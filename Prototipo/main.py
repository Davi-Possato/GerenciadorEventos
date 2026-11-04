import json
import re
from pathlib import Path

import psycopg
from ollama import Client

BASE_DIR = Path(__file__).resolve().parent

with open(BASE_DIR / "config.json", encoding="utf-8") as f:
    config = json.load(f)

# ---------- Projeto.txt: DDL e consultas ----------
projeto_path = BASE_DIR.parent / "Projeto.txt"
if not projeto_path.exists():
    print("Erro: Projeto.txt não encontrado.")
    raise SystemExit(1)

projeto = projeto_path.read_text(encoding="utf-8")
try:
    ddl = projeto.split("3. DDL COMPLETO", 1)[1]
    ddl = ddl.split("4. CONSULTAS", 1)[0]
    ddl = ddl.strip()
    secao_consultas = projeto.split("4. CONSULTAS", 1)[1]
except IndexError:
    print("Erro: seções 3 e 4 não encontradas em Projeto.txt.")
    raise SystemExit(1)

consultas = re.findall(
    r"CONSULTA\s+(\d+)\s*OBJETIVO:\s*(.*?)\s*SQL:\s*(.*?)(?=CONSULTA\s+\d+|FIM DO ARQUIVO|\Z)",
    secao_consultas,
    re.DOTALL,
)

# ---------- Conexões ----------
db = config["database"]
conn = psycopg.connect(
    host=db["host"],
    port=db["port"],
    dbname=db["dbname"],
    user=db["user"],
    password=db["password"]
)
conn.autocommit = True

ollama_config = config["ollama"]
client = Client(
    host=ollama_config["host"]
)


def executar(sql):
    try:
        with conn.cursor() as cur:
            cur.execute(sql)
            if cur.description is None:
                print("Comando executado com sucesso.")
                return
            colunas = [c.name for c in cur.description]
            linhas = cur.fetchall()
        mostrar(colunas, linhas)
    except Exception as e:
        print("Erro ao executar o SQL:", e)


def mostrar(colunas, linhas):
    if not linhas:
        print("(nenhum resultado)")
        return
    texto = [[str(v) for v in linha] for linha in linhas]
    larguras = [max(len(c), *(len(l[i]) for l in texto)) for i, c in enumerate(colunas)]
    print(" | ".join(c.ljust(larguras[i]) for i, c in enumerate(colunas)))
    print("-+-".join("-" * w for w in larguras))
    for l in texto:
        print(" | ".join(v.ljust(larguras[i]) for i, v in enumerate(l)))
    print(f"({len(linhas)} linhas)")


def limpar_sql(texto):
    texto = re.sub(r"<think>.*?</think>", "", texto, flags=re.DOTALL)
    texto = re.sub(r"```(?:sql)?", "", texto, flags=re.IGNORECASE)
    return texto.strip()


def pergunta_para_sql(pergunta):
    prompt = f"""Você é especialista em PostgreSQL.
Use exclusivamente o esquema abaixo (todas as tabelas estão no schema eventmanager,
use sempre o prefixo eventmanager. nas tabelas).

{ddl}

Converta a pergunta do usuário em UMA consulta SQL PostgreSQL.
Responda apenas com o SQL, sem explicações e sem markdown.

Pergunta: {pergunta}"""
    response = client.chat(
        model=ollama_config["model"],
        messages=[
            {
                "role": "user",
                "content": prompt
            }
        ]
    )
    resposta = response["message"]["content"]
    return limpar_sql(resposta)


def main():
    while True:
        print("\n=== Gestão de Eventos e Espaços ===")
        for num, objetivo, _ in consultas:
            print(f"{num} - {objetivo}")
        print("6 - Pergunta em linguagem natural")
        print("0 - Sair")
        opcao = input("Opção: ").strip()

        if opcao == "0":
            break
        elif opcao == "6":
            pergunta = input("Pergunta: ")
            try:
                sql = pergunta_para_sql(pergunta)
            except Exception as e:
                print("Erro ao consultar o Ollama:", e)
                continue
            print("\nSQL gerado:\n" + sql + "\n")
            executar(sql)
        else:
            for num, _, sql in consultas:
                if num == opcao:
                    executar(sql.strip())
                    break
            else:
                print("Opção inválida.")

    conn.close()


if __name__ == "__main__":
    main()