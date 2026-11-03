CREATE TABLE IF NOT EXISTS eventmanager.promotor (
    id        BIGINT GENERATED ALWAYS AS IDENTITY,
    nome      VARCHAR(255) NOT NULL,
    tipo      VARCHAR(15)  NOT NULL,
    documento VARCHAR(14)  NOT NULL,
    email     VARCHAR(255) NOT NULL,

    CONSTRAINT promotor_pk           PRIMARY KEY (id),
    CONSTRAINT promotor_documento_uk UNIQUE (documento),
    CONSTRAINT promotor_tipo_ck      CHECK (tipo IN ('pessoa', 'empresa', 'organizacao'))
);

CREATE TABLE IF NOT EXISTS eventmanager.evento (
    id          BIGINT GENERATED ALWAYS AS IDENTITY,
    nome        VARCHAR(255) NOT NULL,
    descricao   TEXT         NOT NULL,
    data_inicio DATE         NOT NULL,
    data_fim    DATE,

    CONSTRAINT evento_pk      PRIMARY KEY (id),
    CONSTRAINT evento_data_ck CHECK (data_fim IS NULL OR data_fim >= data_inicio)
);

CREATE TABLE IF NOT EXISTS eventmanager.pessoa (
    id              BIGINT GENERATED ALWAYS AS IDENTITY,
    nome            VARCHAR(255) NOT NULL,
    email           VARCHAR(255) NOT NULL,
    telefone        VARCHAR(11)  NOT NULL,
    data_nascimento DATE         NOT NULL,

    CONSTRAINT pessoa_pk          PRIMARY KEY (id),
    CONSTRAINT pessoa_email_uk    UNIQUE (email),
    CONSTRAINT pessoa_telefone_ck CHECK (telefone ~ '^[0-9]{10,11}$'),
    CONSTRAINT pessoa_nasc_ck     CHECK (data_nascimento <= CURRENT_DATE)
);

CREATE TABLE IF NOT EXISTS eventmanager.espaco (
    id          BIGINT GENERATED ALWAYS AS IDENTITY,
    nome        VARCHAR(255) NOT NULL,
    capacidade  INT          NOT NULL,
    localizacao VARCHAR(255),

    CONSTRAINT espaco_pk            PRIMARY KEY (id),
    CONSTRAINT espaco_capacidade_ck CHECK (capacidade > 0)
);

CREATE TABLE IF NOT EXISTS eventmanager.recurso (
    id   BIGINT GENERATED ALWAYS AS IDENTITY,
    nome VARCHAR(255) NOT NULL,

    CONSTRAINT recurso_pk      PRIMARY KEY (id),
    CONSTRAINT recurso_nome_uk UNIQUE (nome)
);

CREATE TABLE IF NOT EXISTS eventmanager.evento_promotor (
    evento_id   BIGINT      NOT NULL,
    promotor_id BIGINT      NOT NULL,
    papel       VARCHAR(40) NOT NULL,

    CONSTRAINT evento_promotor_pk          PRIMARY KEY (evento_id, promotor_id),
    CONSTRAINT evento_promotor_papel_ck    CHECK (papel IN ('principal', 'co-promotor')),
    CONSTRAINT evento_promotor_evento_fk   FOREIGN KEY (evento_id)
        REFERENCES eventmanager.evento (id) ON DELETE CASCADE,
    CONSTRAINT evento_promotor_promotor_fk FOREIGN KEY (promotor_id)
        REFERENCES eventmanager.promotor (id) ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS eventmanager.equipe_evento (
    evento_id BIGINT      NOT NULL,
    pessoa_id BIGINT      NOT NULL,
    funcao    VARCHAR(40) NOT NULL,

    CONSTRAINT equipe_evento_pk        PRIMARY KEY (evento_id, pessoa_id),
    CONSTRAINT equipe_evento_evento_fk FOREIGN KEY (evento_id)
        REFERENCES eventmanager.evento (id) ON DELETE CASCADE,
    CONSTRAINT equipe_evento_pessoa_fk FOREIGN KEY (pessoa_id)
        REFERENCES eventmanager.pessoa (id) ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS eventmanager.atividade (
    id        BIGINT GENERATED ALWAYS AS IDENTITY,
    evento_id BIGINT       NOT NULL,
    titulo    VARCHAR(255) NOT NULL,
    descricao TEXT,
    tipo      VARCHAR(50)  NOT NULL,

    CONSTRAINT atividade_pk        PRIMARY KEY (id),
    CONSTRAINT atividade_evento_fk FOREIGN KEY (evento_id)
        REFERENCES eventmanager.evento (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS eventmanager.atividade_palestrante (
    atividade_id BIGINT       NOT NULL,
    pessoa_id    BIGINT       NOT NULL,
    papel        VARCHAR(255) NOT NULL,

    CONSTRAINT atividade_palestrante_pk           PRIMARY KEY (atividade_id, pessoa_id),
    CONSTRAINT atividade_palestrante_atividade_fk FOREIGN KEY (atividade_id)
        REFERENCES eventmanager.atividade (id) ON DELETE CASCADE,
    CONSTRAINT atividade_palestrante_pessoa_fk    FOREIGN KEY (pessoa_id)
        REFERENCES eventmanager.pessoa (id) ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS eventmanager.sessao (
    id               BIGINT GENERATED ALWAYS AS IDENTITY,
    atividade_id     BIGINT      NOT NULL,
    espaco_id        BIGINT      NOT NULL,
    inicio           TIMESTAMP   NOT NULL,
    fim              TIMESTAMP   NOT NULL,
    requer_inscricao BOOLEAN     NOT NULL DEFAULT FALSE,
    limite_vagas     INT,
    status           VARCHAR(20) NOT NULL DEFAULT 'agendada',

    CONSTRAINT sessao_pk           PRIMARY KEY (id),
    CONSTRAINT sessao_periodo_ck   CHECK (fim > inicio),
    CONSTRAINT sessao_vagas_ck     CHECK (limite_vagas IS NULL OR limite_vagas > 0),
    CONSTRAINT sessao_status_ck    CHECK (status IN ('agendada', 'cancelada', 'realizada')),
    CONSTRAINT sessao_atividade_fk FOREIGN KEY (atividade_id)
        REFERENCES eventmanager.atividade (id) ON DELETE CASCADE,
    CONSTRAINT sessao_espaco_fk    FOREIGN KEY (espaco_id)
        REFERENCES eventmanager.espaco (id) ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS eventmanager.sessao_historico (
    id               BIGINT GENERATED ALWAYS AS IDENTITY,
    sessao_id        BIGINT    NOT NULL,
    espaco_id_antigo BIGINT    NOT NULL,
    inicio_antigo    TIMESTAMP NOT NULL,
    fim_antigo       TIMESTAMP NOT NULL,
    alterado_em      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT sessao_historico_pk         PRIMARY KEY (id),
    CONSTRAINT sessao_historico_periodo_ck CHECK (fim_antigo > inicio_antigo),
    CONSTRAINT sessao_historico_sessao_fk  FOREIGN KEY (sessao_id)
        REFERENCES eventmanager.sessao (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS eventmanager.espaco_recurso (
    espaco_id  BIGINT NOT NULL,
    recurso_id BIGINT NOT NULL,
    quantidade INT    NOT NULL DEFAULT 1,

    CONSTRAINT espaco_recurso_pk            PRIMARY KEY (espaco_id, recurso_id),
    CONSTRAINT espaco_recurso_quantidade_ck CHECK (quantidade > 0),
    CONSTRAINT espaco_recurso_espaco_fk     FOREIGN KEY (espaco_id)
        REFERENCES eventmanager.espaco (id) ON DELETE CASCADE,
    CONSTRAINT espaco_recurso_recurso_fk    FOREIGN KEY (recurso_id)
        REFERENCES eventmanager.recurso (id) ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS eventmanager.inscricao_evento (
    pessoa_id      BIGINT      NOT NULL,
    evento_id      BIGINT      NOT NULL,
    status         VARCHAR(15) NOT NULL DEFAULT 'confirmada',
    data_inscricao TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT inscricao_evento_pk        PRIMARY KEY (pessoa_id, evento_id),
    CONSTRAINT inscricao_evento_status_ck CHECK (status IN ('confirmada', 'cancelada')),
    CONSTRAINT inscricao_evento_pessoa_fk FOREIGN KEY (pessoa_id)
        REFERENCES eventmanager.pessoa (id) ON DELETE CASCADE,
    CONSTRAINT inscricao_evento_evento_fk FOREIGN KEY (evento_id)
        REFERENCES eventmanager.evento (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS eventmanager.inscricao_sessao (
    pessoa_id      BIGINT      NOT NULL,
    sessao_id      BIGINT      NOT NULL,
    status         VARCHAR(15) NOT NULL DEFAULT 'confirmada',
    data_inscricao TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT inscricao_sessao_pk        PRIMARY KEY (pessoa_id, sessao_id),
    CONSTRAINT inscricao_sessao_status_ck CHECK (status IN ('confirmada', 'lista_espera', 'cancelada')),
    CONSTRAINT inscricao_sessao_pessoa_fk FOREIGN KEY (pessoa_id)
        REFERENCES eventmanager.pessoa (id) ON DELETE CASCADE,
    CONSTRAINT inscricao_sessao_sessao_fk FOREIGN KEY (sessao_id)
        REFERENCES eventmanager.sessao (id) ON DELETE CASCADE
);