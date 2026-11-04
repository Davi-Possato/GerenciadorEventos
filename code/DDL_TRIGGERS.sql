CREATE OR REPLACE FUNCTION eventmanager.fn_inscricao_sessao_vagas()
RETURNS trigger AS $$
DECLARE
    v_requer    BOOLEAN;
    v_limite    INT;
    v_ocupadas  INT;
BEGIN
    SELECT s.requer_inscricao, COALESCE(s.limite_vagas, e.capacidade)
      INTO v_requer, v_limite
      FROM eventmanager.sessao s
      JOIN eventmanager.espaco e ON e.id = s.espaco_id
     WHERE s.id = NEW.sessao_id
       FOR UPDATE OF s;

    IF NOT v_requer THEN
        RAISE EXCEPTION 'A sessao % nao exige inscricao especifica', NEW.sessao_id;
    END IF;

    IF NEW.status = 'confirmada' THEN
        SELECT COUNT(*) INTO v_ocupadas
          FROM eventmanager.inscricao_sessao
         WHERE sessao_id = NEW.sessao_id
           AND status = 'confirmada'
           AND pessoa_id <> NEW.pessoa_id;

        IF v_ocupadas >= v_limite THEN
            NEW.status := 'lista_espera';
        END IF;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_inscricao_sessao_vagas
BEFORE INSERT OR UPDATE ON eventmanager.inscricao_sessao
FOR EACH ROW EXECUTE FUNCTION eventmanager.fn_inscricao_sessao_vagas();

CREATE OR REPLACE FUNCTION eventmanager.fn_promover_lista_espera()
RETURNS trigger AS $$
BEGIN
    UPDATE eventmanager.inscricao_sessao
       SET status = 'confirmada'
     WHERE (pessoa_id, sessao_id) IN (
            SELECT pessoa_id, sessao_id
              FROM eventmanager.inscricao_sessao
             WHERE sessao_id = NEW.sessao_id
               AND status = 'lista_espera'
             ORDER BY data_inscricao, pessoa_id
             LIMIT 1);
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_promover_lista_espera
AFTER UPDATE OF status ON eventmanager.inscricao_sessao
FOR EACH ROW
WHEN (OLD.status = 'confirmada' AND NEW.status = 'cancelada')
EXECUTE FUNCTION eventmanager.fn_promover_lista_espera();

CREATE OR REPLACE FUNCTION eventmanager.fn_sessao_sem_conflito()
RETURNS trigger AS $$
BEGIN
    IF NEW.status <> 'cancelada' AND EXISTS (
        SELECT 1
          FROM eventmanager.sessao s
         WHERE s.espaco_id = NEW.espaco_id
           AND s.status <> 'cancelada'
           AND s.id <> COALESCE(NEW.id, -1)
           AND NEW.inicio < s.fim
           AND NEW.fim > s.inicio
    ) THEN
        RAISE EXCEPTION 'Conflito: o espaco % ja possui sessao nesse horario', NEW.espaco_id;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_sessao_sem_conflito
BEFORE INSERT OR UPDATE OF espaco_id, inicio, fim, status ON eventmanager.sessao
FOR EACH ROW EXECUTE FUNCTION eventmanager.fn_sessao_sem_conflito();

CREATE OR REPLACE FUNCTION eventmanager.fn_sessao_historico()
RETURNS trigger AS $$
BEGIN
    INSERT INTO eventmanager.sessao_historico
           (sessao_id, espaco_id_antigo, inicio_antigo, fim_antigo)
    VALUES (OLD.id, OLD.espaco_id, OLD.inicio, OLD.fim);
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_sessao_historico
AFTER UPDATE ON eventmanager.sessao
FOR EACH ROW
WHEN (OLD.espaco_id IS DISTINCT FROM NEW.espaco_id
   OR OLD.inicio    IS DISTINCT FROM NEW.inicio
   OR OLD.fim       IS DISTINCT FROM NEW.fim)
EXECUTE FUNCTION eventmanager.fn_sessao_historico();