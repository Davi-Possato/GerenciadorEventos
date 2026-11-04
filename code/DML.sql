SET search_path TO eventmanager;

BEGIN;

INSERT INTO promotor (id, nome, tipo, documento, email)
OVERRIDING SYSTEM VALUE
VALUES
(1, 'Universidade Tecnológica de Campinas', 'organizacao', '12345678000190', 'eventos@utc.edu.br'),
(2, 'Associação Brasileira de Tecnologia', 'organizacao', '23456789000181', 'contato@abt.org.br'),
(3, 'InovaTech Soluções Digitais Ltda.', 'empresa', '34567890000172', 'eventos@inovatech.com.br'),
(4, 'Mariana Costa Ferreira', 'pessoa', '12345678901', 'mariana@eventos.com.br'),
(5, 'Instituto Brasileiro de Inteligência Artificial', 'organizacao', '45678901000163', 'contato@ibia.org.br'),
(6, 'TechBrasil Eventos Ltda.', 'empresa', '56789012000154', 'contato@techbrasil.com.br');


INSERT INTO evento (id, nome, descricao, data_inicio, data_fim)
OVERRIDING SYSTEM VALUE
VALUES
(1, 'Semana da Computação 2025', 'Evento acadêmico sobre programação, bancos de dados e desenvolvimento de software.', '2025-09-15', '2025-09-17'),
(2, 'Semana da Computação 2026', 'Evento acadêmico sobre inteligência artificial, computação em nuvem e desenvolvimento web.', '2026-09-14', '2026-09-16'),
(3, 'Congresso Brasileiro de Inteligência Artificial 2026', 'Congresso sobre aprendizado de máquina, ciência de dados e inteligência artificial.', '2026-10-20', '2026-10-22'),
(4, 'Fórum Nacional de Transformação Digital 2027', 'Fórum sobre inovação, tecnologia e transformação digital.', '2027-03-10', NULL);


INSERT INTO pessoa (id, nome, email, telefone, data_nascimento)
OVERRIDING SYSTEM VALUE
VALUES
(1, 'Lucas Oliveira Santos', 'lucas@email.com', '19987654321', '1998-04-12'),
(2, 'Ana Carolina Silva', 'ana@email.com', '11987654322', '2000-08-25'),
(3, 'Pedro Henrique Almeida', 'pedro@email.com', '31987654323', '1997-11-03'),
(4, 'Mariana Ribeiro Costa', 'mariana@email.com', '21987654324', '1999-02-17'),
(5, 'Gabriel Ferreira Lima', 'gabriel@email.com', '19987654325', '2001-06-09'),
(6, 'Juliana Martins Rocha', 'juliana@email.com', '11987654326', '1996-09-14'),
(7, 'Rafael Pereira Souza', 'rafael@email.com', '31987654327', '1995-12-21'),
(8, 'Beatriz Gomes Oliveira', 'beatriz@email.com', '21987654328', '2002-03-05'),
(9, 'Thiago Rodrigues Silva', 'thiago@email.com', '19987654329', '1998-07-19'),
(10, 'Camila Fernandes Dias', 'camila@email.com', '11987654330', '1997-10-08'),
(11, 'Bruno Carvalho Mendes', 'bruno@email.com', '31987654331', '1994-05-27'),
(12, 'Larissa Monteiro Alves', 'larissa@email.com', '21987654332', '2000-01-16'),
(13, 'Felipe Augusto Barbosa', 'felipe@email.com', '19987654333', '1999-09-22'),
(14, 'Isabela Cristina Lopes', 'isabela@email.com', '11987654334', '2001-04-30'),
(15, 'Matheus Vinicius Ribeiro', 'matheus@email.com', '31987654335', '1996-06-11'),
(16, 'Amanda Vitória Castro', 'amanda@email.com', '21987654336', '1998-12-02'),
(17, 'Gustavo Henrique Martins', 'gustavo@email.com', '19987654337', '1993-03-18'),
(18, 'Fernanda Azevedo Lima', 'fernanda@email.com', '11987654338', '1995-08-07'),
(19, 'Daniel Eduardo Moreira', 'daniel@email.com', '31987654339', '1997-02-24'),
(20, 'Patrícia Helena Nascimento', 'patricia@email.com', '21987654340', '1992-11-13'),
(21, 'Ricardo Alexandre Gomes', 'ricardo@email.com', '19987654341', '1990-07-04'),
(22, 'Vanessa Cristina Teixeira', 'vanessa@email.com', '11987654342', '1994-10-29'),
(23, 'Eduardo Luiz Cardoso', 'eduardo@email.com', '31987654343', '1989-05-15'),
(24, 'Priscila Andrade Oliveira', 'priscila@email.com', '21987654344', '1996-01-23'),
(25, 'André Felipe Nogueira', 'andre@email.com', '19987654345', '1991-09-10'),
(26, 'Renata de Souza Martins', 'renata@email.com', '11987654346', '1998-06-26'),
(27, 'Vinicius Gabriel Batista', 'vinicius@email.com', '31987654347', '2000-12-17'),
(28, 'Carolina Mendes Ferreira', 'carolina@email.com', '21987654348', '1997-04-01'),
(29, 'Leonardo Henrique Pinto', 'leonardo@email.com', '19987654349', '1993-08-20'),
(30, 'Natália Cristina Ramos', 'natalia@email.com', '11987654350', '1999-11-06'),
(31, 'João Victor Almeida', 'joao@email.com', '31987654351', '2002-02-12'),
(32, 'Letícia Maria Fernandes', 'leticia@email.com', '21987654352', '2001-07-28'),
(33, 'Marcelo Augusto Correia', 'marcelo@email.com', '19987654353', '1988-03-09'),
(34, 'Sabrina Oliveira Moraes', 'sabrina@email.com', '11987654354', '1995-05-31'),
(35, 'Diego Henrique Vieira', 'diego@email.com', '31987654355', '1994-09-16'),
(36, 'Bianca Cristina Freitas', 'bianca@email.com', '21987654356', '2000-10-24'),
(37, 'Roberto Carlos Figueiredo', 'roberto@email.com', '19987654357', '1985-12-08'),
(38, 'Helena Maria Duarte', 'helena@email.com', '11987654358', '1992-06-19'),
(39, 'Caio Eduardo Rezende', 'caio@email.com', '31987654359', '2003-01-14'),
(40, 'Sofia Almeida Barreto', 'sofia@email.com', '21987654360', '2002-08-03');


INSERT INTO espaco (id, nome, capacidade, localizacao)
OVERRIDING SYSTEM VALUE
VALUES
(1, 'Laboratório de Programação A', 15, 'Bloco A - Campinas/SP'),
(2, 'Laboratório de Informática B', 25, 'Bloco B - Campinas/SP'),
(3, 'Sala de Treinamento 101', 40, 'Bloco C - Campinas/SP'),
(4, 'Sala de Conferências 202', 45, 'Bloco C - Campinas/SP'),
(5, 'Auditório de Tecnologia', 60, 'Centro Acadêmico - Campinas/SP'),
(6, 'Auditório de Inovação', 100, 'Centro de Convenções - Campinas/SP'),
(7, 'Auditório Principal', 300, 'Centro de Eventos - Campinas/SP'),
(8, 'Sala de Exposições Tecnológicas', 80, 'Pavilhão de Exposições - Campinas/SP');


INSERT INTO recurso (id, nome)
OVERRIDING SYSTEM VALUE
VALUES
(1, 'Projetor multimídia'),
(2, 'Computadores'),
(3, 'Sistema de áudio'),
(4, 'Internet de alta velocidade'),
(5, 'Equipamento de transmissão ao vivo'),
(6, 'Lousa digital');


INSERT INTO evento_promotor (evento_id, promotor_id, papel)
VALUES
(1, 1, 'principal'),
(1, 2, 'co-promotor'),
(2, 1, 'principal'),
(2, 3, 'co-promotor'),
(2, 4, 'co-promotor'),
(3, 5, 'principal'),
(3, 2, 'co-promotor'),
(4, 6, 'principal'),
(4, 3, 'co-promotor');


INSERT INTO equipe_evento (evento_id, pessoa_id, funcao)
VALUES
(1, 1, 'Coordenador geral'),
(1, 6, 'Organização'),
(1, 11, 'Suporte técnico'),
(1, 16, 'Credenciamento'),
(1, 21, 'Comunicação'),
(2, 1, 'Coordenador técnico'),
(2, 7, 'Coordenador geral'),
(2, 12, 'Organização'),
(2, 17, 'Suporte técnico'),
(2, 22, 'Credenciamento'),
(2, 27, 'Comunicação'),
(3, 6, 'Coordenadora científica'),
(3, 13, 'Organização'),
(3, 18, 'Suporte técnico'),
(3, 23, 'Credenciamento'),
(3, 28, 'Comunicação'),
(4, 10, 'Coordenadora geral'),
(4, 15, 'Organização'),
(4, 20, 'Suporte técnico'),
(4, 25, 'Credenciamento'),
(4, 30, 'Comunicação');


INSERT INTO atividade (id, evento_id, titulo, descricao, tipo)
OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'Introdução ao PostgreSQL', 'Fundamentos de SQL e bancos de dados.', 'minicurso'),
(2, 1, 'Desenvolvimento Web Moderno', 'Criação de aplicações web.', 'workshop'),
(3, 1, 'Segurança da Informação', 'Boas práticas de segurança.', 'palestra'),
(4, 1, 'Carreiras em Tecnologia', 'Oportunidades no mercado de trabalho.', 'painel'),
(5, 1, 'Arquitetura de Software', 'Organização e evolução de sistemas.', 'mesa-redonda'),
(6, 1, 'Projetos Acadêmicos', 'Apresentação de trabalhos dos estudantes.', 'apresentação'),
(7, 2, 'Inteligência Artificial Aplicada', 'Aplicações práticas de inteligência artificial.', 'workshop'),
(8, 2, 'Java e Angular', 'Desenvolvimento de aplicações full stack.', 'minicurso'),
(9, 2, 'Computação em Nuvem', 'Serviços e infraestrutura em nuvem.', 'palestra'),
(10, 2, 'Cibersegurança', 'Proteção de sistemas e informações.', 'painel'),
(11, 2, 'DevOps', 'Automação e integração contínua.', 'mesa-redonda'),
(12, 2, 'Projetos Inovadores', 'Apresentação de projetos de software.', 'apresentação'),
(13, 3, 'Machine Learning com Python', 'Modelos de aprendizado de máquina.', 'minicurso'),
(14, 3, 'IA Generativa', 'Aplicações de inteligência artificial generativa.', 'palestra'),
(15, 3, 'Ética em IA', 'Uso responsável da inteligência artificial.', 'mesa-redonda'),
(16, 3, 'Visão Computacional', 'Processamento de imagens.', 'workshop'),
(17, 3, 'Ciência de Dados', 'Análise de dados nas empresas.', 'painel'),
(18, 3, 'Pesquisas em IA', 'Apresentação de pesquisas acadêmicas.', 'apresentação'),
(19, 4, 'Transformação Digital', 'Modernização de processos empresariais.', 'palestra'),
(20, 4, 'Governança de Dados', 'Gestão e qualidade de informações.', 'workshop'),
(21, 4, 'Infraestrutura em Nuvem', 'Modernização de infraestrutura tecnológica.', 'minicurso'),
(22, 4, 'Empreendedorismo Digital', 'Inovação e startups.', 'painel'),
(23, 4, 'Segurança Digital', 'Proteção de dados corporativos.', 'mesa-redonda'),
(24, 4, 'Tecnologia em 2030', 'Tendências tecnológicas.', 'apresentação');


INSERT INTO atividade_palestrante (atividade_id, pessoa_id, papel)
VALUES
(1, 1, 'Instrutor'),
(1, 11, 'Instrutor auxiliar'),
(2, 3, 'Instrutor'),
(2, 8, 'Instrutora auxiliar'),
(3, 7, 'Palestrante'),
(4, 10, 'Mediadora'),
(4, 21, 'Debatedor'),
(5, 15, 'Mediador'),
(5, 23, 'Debatedor'),
(6, 5, 'Apresentador'),
(6, 14, 'Apresentadora'),
(7, 1, 'Instrutor'),
(7, 18, 'Instrutora auxiliar'),
(8, 3, 'Instrutor'),
(8, 17, 'Instrutor auxiliar'),
(9, 23, 'Palestrante'),
(10, 6, 'Mediadora'),
(10, 25, 'Debatedor'),
(11, 11, 'Mediador'),
(11, 28, 'Debatedora'),
(12, 13, 'Apresentador'),
(12, 26, 'Apresentadora'),
(13, 6, 'Instrutora'),
(13, 19, 'Instrutor auxiliar'),
(14, 21, 'Palestrante'),
(15, 18, 'Mediadora'),
(15, 37, 'Debatedor'),
(16, 9, 'Instrutor'),
(16, 24, 'Instrutora auxiliar'),
(17, 20, 'Mediadora'),
(17, 33, 'Debatedor'),
(18, 27, 'Apresentador'),
(18, 34, 'Apresentadora'),
(19, 25, 'Palestrante'),
(20, 10, 'Instrutora'),
(20, 35, 'Instrutor auxiliar'),
(21, 15, 'Instrutor'),
(21, 29, 'Instrutor auxiliar'),
(22, 20, 'Mediadora'),
(22, 33, 'Debatedor'),
(23, 17, 'Mediador'),
(23, 38, 'Debatedora'),
(24, 30, 'Apresentadora'),
(24, 37, 'Apresentador');


INSERT INTO sessao (id, atividade_id, espaco_id, inicio, fim, requer_inscricao, limite_vagas, status)
OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, '2025-09-15 09:00', '2025-09-15 11:00', TRUE, 4, 'realizada'),
(2, 1, 2, '2025-09-16 09:00', '2025-09-16 11:00', TRUE, 10, 'realizada'),
(3, 2, 3, '2025-09-15 09:00', '2025-09-15 12:00', TRUE, 15, 'realizada'),
(4, 2, 4, '2025-09-16 14:00', '2025-09-16 17:00', TRUE, 20, 'realizada'),
(5, 3, 5, '2025-09-15 14:00', '2025-09-15 16:00', TRUE, NULL, 'realizada'),
(6, 4, 6, '2025-09-16 09:00', '2025-09-16 11:00', FALSE, NULL, 'realizada'),
(7, 5, 7, '2025-09-17 09:00', '2025-09-17 11:00', FALSE, NULL, 'realizada'),
(8, 6, 3, '2025-09-17 14:00', '2025-09-17 16:00', FALSE, NULL, 'cancelada'),
(9, 7, 1, '2026-09-14 09:00', '2026-09-14 11:00', TRUE, 3, 'realizada'),
(10, 7, 2, '2026-09-15 09:00', '2026-09-15 11:00', TRUE, 10, 'realizada'),
(11, 8, 3, '2026-09-14 09:00', '2026-09-14 12:00', TRUE, 15, 'realizada'),
(12, 8, 4, '2026-09-15 14:00', '2026-09-15 17:00', TRUE, 20, 'realizada'),
(13, 9, 5, '2026-09-14 14:00', '2026-09-14 16:00', TRUE, NULL, 'realizada'),
(14, 10, 6, '2026-09-15 09:00', '2026-09-15 11:00', FALSE, NULL, 'realizada'),
(15, 11, 7, '2026-09-16 09:00', '2026-09-16 11:00', FALSE, NULL, 'realizada'),
(16, 12, 5, '2026-09-16 14:00', '2026-09-16 16:00', FALSE, NULL, 'realizada'),
(17, 13, 2, '2026-10-20 09:00', '2026-10-20 12:00', TRUE, 12, 'realizada'),
(18, 13, 3, '2026-10-21 09:00', '2026-10-21 12:00', TRUE, 20, 'realizada'),
(19, 14, 7, '2026-10-20 14:00', '2026-10-20 16:00', TRUE, NULL, 'realizada'),
(20, 15, 6, '2026-10-21 14:00', '2026-10-21 16:00', FALSE, NULL, 'realizada'),
(21, 16, 1, '2026-10-22 09:00', '2026-10-22 12:00', TRUE, 8, 'realizada'),
(22, 17, 5, '2026-10-22 09:00', '2026-10-22 11:00', TRUE, NULL, 'realizada'),
(23, 18, 4, '2026-10-22 14:00', '2026-10-22 16:00', FALSE, NULL, 'cancelada'),
(24, 19, 7, '2027-03-10 09:00', '2027-03-10 11:00', TRUE, NULL, 'agendada'),
(25, 19, 6, '2027-03-11 09:00', '2027-03-11 11:00', TRUE, NULL, 'agendada'),
(26, 20, 5, '2027-03-10 14:00', '2027-03-10 17:00', TRUE, 30, 'agendada'),
(27, 21, 6, '2027-03-12 09:00', '2027-03-12 12:00', TRUE, 40, 'agendada'),
(28, 22, 7, '2027-03-11 14:00', '2027-03-11 16:00', TRUE, NULL, 'agendada'),
(29, 23, 5, '2027-03-12 14:00', '2027-03-12 16:00', FALSE, NULL, 'agendada'),
(30, 24, 7, '2027-03-13 09:00', '2027-03-13 11:00', FALSE, NULL, 'agendada');


INSERT INTO espaco_recurso (espaco_id, recurso_id, quantidade)
VALUES
(1, 1, 1), (1, 2, 15), (1, 4, 1), (1, 6, 1),
(2, 1, 1), (2, 2, 25), (2, 4, 1), (2, 6, 1),
(3, 1, 1), (3, 3, 1), (3, 4, 1), (3, 6, 1),
(4, 1, 1), (4, 3, 1), (4, 4, 1), (4, 6, 1),
(5, 1, 2), (5, 3, 1), (5, 4, 1), (5, 5, 1),
(6, 1, 2), (6, 3, 2), (6, 4, 1), (6, 5, 2),
(7, 1, 3), (7, 3, 3), (7, 4, 2), (7, 5, 3),
(8, 1, 2), (8, 2, 10), (8, 3, 1), (8, 4, 1), (8, 5, 1);


INSERT INTO inscricao_evento (pessoa_id, evento_id, status, data_inscricao)
VALUES
(1, 1, 'confirmada', '2025-08-01'),
(2, 1, 'confirmada', '2025-08-01'),
(3, 1, 'confirmada', '2025-08-01'),
(4, 1, 'confirmada', '2025-08-01'),
(5, 1, 'confirmada', '2025-08-01'),
(6, 1, 'confirmada', '2025-08-01'),
(7, 1, 'confirmada', '2025-08-01'),
(8, 1, 'confirmada', '2025-08-01'),
(9, 1, 'confirmada', '2025-08-02'),
(10, 1, 'confirmada', '2025-08-02'),
(11, 1, 'confirmada', '2025-08-02'),
(12, 1, 'confirmada', '2025-08-02'),
(13, 1, 'confirmada', '2025-08-02'),
(14, 1, 'confirmada', '2025-08-02'),
(15, 1, 'confirmada', '2025-08-02'),
(16, 1, 'confirmada', '2025-08-02'),
(17, 1, 'confirmada', '2025-08-03'),
(18, 1, 'confirmada', '2025-08-03'),
(19, 1, 'confirmada', '2025-08-03'),
(20, 1, 'confirmada', '2025-08-03'),
(21, 1, 'confirmada', '2025-08-03'),
(22, 1, 'confirmada', '2025-08-03'),
(23, 1, 'confirmada', '2025-08-03'),
(24, 1, 'confirmada', '2025-08-03'),
(25, 1, 'confirmada', '2025-08-04'),
(26, 1, 'confirmada', '2025-08-04'),
(27, 1, 'confirmada', '2025-08-04'),
(28, 1, 'confirmada', '2025-08-04'),
(29, 1, 'cancelada', '2025-08-05'),
(30, 1, 'cancelada', '2025-08-05'),

(1, 2, 'confirmada', '2026-08-01'),
(2, 2, 'confirmada', '2026-08-01'),
(3, 2, 'confirmada', '2026-08-01'),
(4, 2, 'confirmada', '2026-08-01'),
(5, 2, 'confirmada', '2026-08-01'),
(6, 2, 'confirmada', '2026-08-01'),
(7, 2, 'confirmada', '2026-08-01'),
(8, 2, 'confirmada', '2026-08-01'),
(9, 2, 'confirmada', '2026-08-02'),
(10, 2, 'confirmada', '2026-08-02'),
(11, 2, 'confirmada', '2026-08-02'),
(12, 2, 'confirmada', '2026-08-02'),
(13, 2, 'confirmada', '2026-08-02'),
(14, 2, 'confirmada', '2026-08-02'),
(15, 2, 'confirmada', '2026-08-02'),
(16, 2, 'confirmada', '2026-08-02'),
(17, 2, 'confirmada', '2026-08-03'),
(18, 2, 'confirmada', '2026-08-03'),
(19, 2, 'confirmada', '2026-08-03'),
(20, 2, 'confirmada', '2026-08-03'),
(21, 2, 'confirmada', '2026-08-03'),
(22, 2, 'confirmada', '2026-08-03'),
(23, 2, 'confirmada', '2026-08-03'),
(24, 2, 'confirmada', '2026-08-03'),
(25, 2, 'confirmada', '2026-08-04'),
(26, 2, 'confirmada', '2026-08-04'),
(27, 2, 'confirmada', '2026-08-04'),
(28, 2, 'confirmada', '2026-08-04'),
(29, 2, 'confirmada', '2026-08-04'),
(30, 2, 'confirmada', '2026-08-04'),
(31, 2, 'cancelada', '2026-08-05'),
(32, 2, 'cancelada', '2026-08-05'),

(5, 3, 'confirmada', '2026-09-20'),
(6, 3, 'confirmada', '2026-09-20'),
(7, 3, 'confirmada', '2026-09-20'),
(8, 3, 'confirmada', '2026-09-20'),
(9, 3, 'confirmada', '2026-09-20'),
(10, 3, 'confirmada', '2026-09-20'),
(11, 3, 'confirmada', '2026-09-20'),
(12, 3, 'confirmada', '2026-09-20'),
(13, 3, 'confirmada', '2026-09-21'),
(14, 3, 'confirmada', '2026-09-21'),
(15, 3, 'confirmada', '2026-09-21'),
(16, 3, 'confirmada', '2026-09-21'),
(17, 3, 'confirmada', '2026-09-21'),
(18, 3, 'confirmada', '2026-09-21'),
(19, 3, 'confirmada', '2026-09-21'),
(20, 3, 'confirmada', '2026-09-21'),
(21, 3, 'confirmada', '2026-09-22'),
(22, 3, 'confirmada', '2026-09-22'),
(23, 3, 'confirmada', '2026-09-22'),
(24, 3, 'confirmada', '2026-09-22'),
(25, 3, 'confirmada', '2026-09-22'),
(26, 3, 'confirmada', '2026-09-22'),
(27, 3, 'confirmada', '2026-09-22'),
(28, 3, 'confirmada', '2026-09-22'),
(29, 3, 'cancelada', '2026-09-25'),
(30, 3, 'cancelada', '2026-09-25'),

(1, 4, 'confirmada', '2026-10-01'),
(2, 4, 'confirmada', '2026-10-01'),
(3, 4, 'confirmada', '2026-10-01'),
(4, 4, 'confirmada', '2026-10-01'),
(5, 4, 'confirmada', '2026-10-01'),
(6, 4, 'confirmada', '2026-10-01'),
(7, 4, 'confirmada', '2026-10-01'),
(8, 4, 'confirmada', '2026-10-01'),
(9, 4, 'confirmada', '2026-10-02'),
(10, 4, 'confirmada', '2026-10-02'),
(11, 4, 'confirmada', '2026-10-02'),
(12, 4, 'confirmada', '2026-10-02'),
(13, 4, 'confirmada', '2026-10-02'),
(14, 4, 'confirmada', '2026-10-02'),
(15, 4, 'confirmada', '2026-10-02'),
(16, 4, 'confirmada', '2026-10-02'),
(17, 4, 'confirmada', '2026-10-03'),
(18, 4, 'confirmada', '2026-10-03'),
(19, 4, 'confirmada', '2026-10-03'),
(20, 4, 'confirmada', '2026-10-03'),
(21, 4, 'confirmada', '2026-10-03'),
(22, 4, 'confirmada', '2026-10-03'),
(23, 4, 'confirmada', '2026-10-03'),
(24, 4, 'confirmada', '2026-10-03'),
(25, 4, 'confirmada', '2026-10-04'),
(26, 4, 'confirmada', '2026-10-04'),
(27, 4, 'confirmada', '2026-10-04'),
(28, 4, 'confirmada', '2026-10-04'),
(29, 4, 'confirmada', '2026-10-04'),
(30, 4, 'confirmada', '2026-10-04'),
(31, 4, 'cancelada', '2026-10-05'),
(32, 4, 'cancelada', '2026-10-05');


INSERT INTO inscricao_sessao (pessoa_id, sessao_id, status, data_inscricao)
VALUES
(1, 1, 'confirmada', '2025-08-10 08:00'),
(2, 1, 'confirmada', '2025-08-10 08:10'),
(3, 1, 'confirmada', '2025-08-10 08:20'),
(4, 1, 'confirmada', '2025-08-10 08:30'),

(1, 2, 'confirmada', '2025-08-11 08:00'),
(2, 2, 'confirmada', '2025-08-11 08:10'),
(3, 2, 'confirmada', '2025-08-11 08:20'),
(5, 2, 'confirmada', '2025-08-11 08:30'),
(6, 2, 'confirmada', '2025-08-11 08:40'),

(1, 3, 'confirmada', '2025-08-12 08:00'),
(2, 3, 'confirmada', '2025-08-12 08:10'),
(3, 3, 'confirmada', '2025-08-12 08:20'),
(4, 3, 'confirmada', '2025-08-12 08:30'),
(5, 3, 'confirmada', '2025-08-12 08:40'),
(6, 3, 'confirmada', '2025-08-12 08:50'),
(7, 3, 'confirmada', '2025-08-12 09:00'),
(8, 3, 'confirmada', '2025-08-12 09:10'),

(1, 4, 'confirmada', '2025-08-13 08:00'),
(2, 4, 'confirmada', '2025-08-13 08:10'),
(3, 4, 'confirmada', '2025-08-13 08:20'),
(4, 4, 'confirmada', '2025-08-13 08:30'),
(5, 4, 'confirmada', '2025-08-13 08:40'),
(6, 4, 'confirmada', '2025-08-13 08:50'),
(7, 4, 'confirmada', '2025-08-13 09:00'),
(8, 4, 'confirmada', '2025-08-13 09:10'),
(9, 4, 'confirmada', '2025-08-13 09:20'),

(1, 5, 'confirmada', '2025-08-14 08:00'),
(2, 5, 'confirmada', '2025-08-14 08:10'),
(3, 5, 'confirmada', '2025-08-14 08:20'),
(4, 5, 'confirmada', '2025-08-14 08:30'),
(5, 5, 'confirmada', '2025-08-14 08:40'),
(6, 5, 'confirmada', '2025-08-14 08:50'),
(7, 5, 'confirmada', '2025-08-14 09:00'),
(8, 5, 'confirmada', '2025-08-14 09:10'),
(9, 5, 'confirmada', '2025-08-14 09:20'),
(10, 5, 'confirmada', '2025-08-14 09:30'),
(11, 5, 'confirmada', '2025-08-14 09:40'),
(12, 5, 'confirmada', '2025-08-14 09:50'),
(13, 5, 'confirmada', '2025-08-14 10:00'),
(14, 5, 'confirmada', '2025-08-14 10:10'),
(15, 5, 'confirmada', '2025-08-14 10:20'),
(16, 5, 'confirmada', '2025-08-14 10:30'),
(17, 5, 'confirmada', '2025-08-14 10:40'),
(18, 5, 'confirmada', '2025-08-14 10:50'),

(1, 9, 'confirmada', '2026-08-10 08:00'),
(2, 9, 'confirmada', '2026-08-10 08:10'),
(3, 9, 'confirmada', '2026-08-10 08:20'),

(1, 10, 'confirmada', '2026-08-11 08:00'),
(2, 10, 'confirmada', '2026-08-11 08:10'),
(3, 10, 'confirmada', '2026-08-11 08:20'),
(4, 10, 'confirmada', '2026-08-11 08:30'),
(5, 10, 'confirmada', '2026-08-11 08:40'),

(1, 11, 'confirmada', '2026-08-12 08:00'),
(2, 11, 'confirmada', '2026-08-12 08:10'),
(3, 11, 'confirmada', '2026-08-12 08:20'),
(6, 11, 'confirmada', '2026-08-12 08:30'),
(7, 11, 'confirmada', '2026-08-12 08:40'),
(8, 11, 'confirmada', '2026-08-12 08:50'),
(9, 11, 'confirmada', '2026-08-12 09:00'),
(10, 11, 'confirmada', '2026-08-12 09:10'),

(1, 12, 'confirmada', '2026-08-13 08:00'),
(2, 12, 'confirmada', '2026-08-13 08:10'),
(3, 12, 'confirmada', '2026-08-13 08:20'),
(4, 12, 'confirmada', '2026-08-13 08:30'),
(5, 12, 'confirmada', '2026-08-13 08:40'),
(6, 12, 'confirmada', '2026-08-13 08:50'),
(7, 12, 'confirmada', '2026-08-13 09:00'),
(8, 12, 'confirmada', '2026-08-13 09:10'),
(9, 12, 'confirmada', '2026-08-13 09:20'),

(1, 13, 'confirmada', '2026-08-14 08:00'),
(2, 13, 'confirmada', '2026-08-14 08:10'),
(3, 13, 'confirmada', '2026-08-14 08:20'),
(4, 13, 'confirmada', '2026-08-14 08:30'),
(5, 13, 'confirmada', '2026-08-14 08:40'),
(6, 13, 'confirmada', '2026-08-14 08:50'),
(7, 13, 'confirmada', '2026-08-14 09:00'),
(8, 13, 'confirmada', '2026-08-14 09:10'),
(9, 13, 'confirmada', '2026-08-14 09:20'),
(10, 13, 'confirmada', '2026-08-14 09:30'),
(11, 13, 'confirmada', '2026-08-14 09:40'),
(12, 13, 'confirmada', '2026-08-14 09:50'),
(13, 13, 'confirmada', '2026-08-14 10:00'),

(5, 17, 'confirmada', '2026-09-28 08:00'),
(6, 17, 'confirmada', '2026-09-28 08:10'),
(7, 17, 'confirmada', '2026-09-28 08:20'),
(8, 17, 'confirmada', '2026-09-28 08:30'),
(9, 17, 'confirmada', '2026-09-28 08:40'),

(5, 18, 'confirmada', '2026-09-29 08:00'),
(6, 18, 'confirmada', '2026-09-29 08:10'),
(7, 18, 'confirmada', '2026-09-29 08:20'),
(8, 18, 'confirmada', '2026-09-29 08:30'),
(9, 18, 'confirmada', '2026-09-29 08:40'),
(10, 18, 'confirmada', '2026-09-29 08:50'),

(5, 19, 'confirmada', '2026-09-30 08:00'),
(6, 19, 'confirmada', '2026-09-30 08:10'),
(7, 19, 'confirmada', '2026-09-30 08:20'),
(8, 19, 'confirmada', '2026-09-30 08:30'),
(9, 19, 'confirmada', '2026-09-30 08:40'),
(10, 19, 'confirmada', '2026-09-30 08:50'),
(11, 19, 'confirmada', '2026-09-30 09:00'),

(5, 21, 'confirmada', '2026-10-01 08:00'),
(6, 21, 'confirmada', '2026-10-01 08:10'),
(7, 21, 'confirmada', '2026-10-01 08:20'),
(8, 21, 'confirmada', '2026-10-01 08:30'),

(5, 22, 'confirmada', '2026-10-02 08:00'),
(6, 22, 'confirmada', '2026-10-02 08:10'),
(7, 22, 'confirmada', '2026-10-02 08:20'),
(8, 22, 'confirmada', '2026-10-02 08:30'),
(9, 22, 'confirmada', '2026-10-02 08:40'),
(10, 22, 'confirmada', '2026-10-02 08:50'),
(11, 22, 'confirmada', '2026-10-02 09:00'),
(12, 22, 'confirmada', '2026-10-02 09:10'),

(1, 24, 'confirmada', '2026-10-10 08:00'),
(2, 24, 'confirmada', '2026-10-10 08:10'),
(3, 24, 'confirmada', '2026-10-10 08:20'),
(4, 24, 'confirmada', '2026-10-10 08:30'),
(5, 24, 'confirmada', '2026-10-10 08:40'),

(1, 25, 'confirmada', '2026-10-11 08:00'),
(2, 25, 'confirmada', '2026-10-11 08:10'),
(3, 25, 'confirmada', '2026-10-11 08:20'),
(4, 25, 'confirmada', '2026-10-11 08:30'),
(5, 25, 'confirmada', '2026-10-11 08:40'),
(6, 25, 'confirmada', '2026-10-11 08:50'),

(1, 26, 'confirmada', '2026-10-12 08:00'),
(2, 26, 'confirmada', '2026-10-12 08:10'),
(3, 26, 'confirmada', '2026-10-12 08:20'),
(4, 26, 'confirmada', '2026-10-12 08:30'),
(5, 26, 'confirmada', '2026-10-12 08:40'),
(6, 26, 'confirmada', '2026-10-12 08:50'),
(7, 26, 'confirmada', '2026-10-12 09:00'),
(8, 26, 'confirmada', '2026-10-12 09:10'),

(1, 27, 'confirmada', '2026-10-13 08:00'),
(2, 27, 'confirmada', '2026-10-13 08:10'),
(3, 27, 'confirmada', '2026-10-13 08:20'),
(4, 27, 'confirmada', '2026-10-13 08:30'),
(5, 27, 'confirmada', '2026-10-13 08:40'),
(6, 27, 'confirmada', '2026-10-13 08:50'),
(7, 27, 'confirmada', '2026-10-13 09:00'),
(8, 27, 'confirmada', '2026-10-13 09:10'),
(9, 27, 'confirmada', '2026-10-13 09:20'),

(1, 28, 'confirmada', '2026-10-14 08:00'),
(2, 28, 'confirmada', '2026-10-14 08:10'),
(3, 28, 'confirmada', '2026-10-14 08:20'),
(4, 28, 'confirmada', '2026-10-14 08:30'),
(5, 28, 'confirmada', '2026-10-14 08:40'),
(6, 28, 'confirmada', '2026-10-14 08:50'),
(7, 28, 'confirmada', '2026-10-14 09:00'),
(8, 28, 'confirmada', '2026-10-14 09:10'),
(9, 28, 'confirmada', '2026-10-14 09:20'),
(10, 28, 'confirmada', '2026-10-14 09:30');


INSERT INTO inscricao_sessao (pessoa_id, sessao_id, status, data_inscricao)
VALUES
(5, 1, 'lista_espera', '2025-08-10 09:00'),
(6, 1, 'lista_espera', '2025-08-10 09:10'),
(4, 9, 'lista_espera', '2026-08-10 09:00'),
(5, 9, 'lista_espera', '2026-08-10 09:10');


INSERT INTO inscricao_sessao (pessoa_id, sessao_id, status, data_inscricao)
VALUES
(19, 3, 'cancelada', '2025-08-13 10:00'),
(20, 4, 'cancelada', '2025-08-14 11:00'),
(14, 10, 'cancelada', '2026-08-13 10:00'),
(16, 11, 'cancelada', '2026-08-14 11:00'),
(20, 17, 'cancelada', '2026-10-01 10:00'),
(22, 21, 'cancelada', '2026-10-02 11:00'),
(22, 26, 'cancelada', '2026-10-17 10:00'),
(23, 27, 'cancelada', '2026-10-18 11:00');


UPDATE sessao
SET inicio = '2025-09-15 09:15',
    fim = '2025-09-15 11:15'
WHERE id = 1;


UPDATE sessao
SET espaco_id = 6
WHERE id = 24;


SELECT setval(pg_get_serial_sequence('eventmanager.promotor', 'id'), (SELECT MAX(id) FROM promotor));

SELECT setval(pg_get_serial_sequence('eventmanager.evento', 'id'), (SELECT MAX(id) FROM evento));

SELECT setval(pg_get_serial_sequence('eventmanager.pessoa', 'id'), (SELECT MAX(id) FROM pessoa));

SELECT setval(pg_get_serial_sequence('eventmanager.espaco', 'id'), (SELECT MAX(id) FROM espaco));

SELECT setval(pg_get_serial_sequence('eventmanager.recurso', 'id'), (SELECT MAX(id) FROM recurso));

SELECT setval(pg_get_serial_sequence('eventmanager.atividade', 'id'), (SELECT MAX(id) FROM atividade));

SELECT setval(pg_get_serial_sequence('eventmanager.sessao', 'id'), (SELECT MAX(id) FROM sessao));

SELECT setval(
    pg_get_serial_sequence('eventmanager.sessao_historico', 'id'),
    COALESCE((SELECT MAX(id) FROM sessao_historico), 1),
    (SELECT COUNT(*) > 0 FROM sessao_historico)
);

COMMIT;