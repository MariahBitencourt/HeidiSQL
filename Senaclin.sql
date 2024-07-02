senaclin
/*Mostrar banco de dados*/
SHOW DATABASES

/*Selecionar bancos de dados*/
USE mysql

/*Mostrar tabelas*/
SHOW TABLES

/*Criar banco de dados*/
CREATE DATABASE senabook

/*Apagar banco de dados*/
DROP DATABASE test

/*Criação de tabelas do BD*/
CREATE TABLE Medico (
idMedico INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nomeMedico VARCHAR(50) NOT NULL,
loginMedico VARCHAR (50) NOT NULL,
senha CHAR (8) NOT NULL,
crm CHAR(8) NOT NULL
);

/*Inserindo masssa de dados*/
INSERT INTO medico (nomeMedico,loginMedico,senha,crm)
VALUES ('Dr.Olavo','olavodoctor@gmail.com','12345678','222333SP');


/*Buscando dados*/
SELECT * FROM medico
SELECT nomeMedico, crm FROM medico

/*Alterar ou Atualizar dados*/
UPDATE medico
SET senha='87654321',
loginMedico='olavodoctor@gmail.com'
WHERE idMedico=1



SHOW TABLES /*Mostra as tabelas do banco de dados selecionado*/
/*DROP TABLE medico - apaga a tabela*/


CREATE TABLE recepcionista (
idRecepcionista INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nomeRecepcionista VARCHAR (50) NOT NULL,
loginRecepcionista VARCHAR (50) NOT NULL,
senha CHAR (8) NOT NULL,
celular CHAR (11) NOT NULL,
nomeLogradouro VARCHAR(50) NOT NULL,
numero VARCHAR (7) NOT NULL,
complemento VARCHAR (10) NULL,
cep CHAR (8) NOT NULL,
cidade VARCHAR (30) NOT NULL,
estado CHAR (2) NOT NULL 
);

DROP TABLE recepcionista 


CREATE TABLE paciente(
idPaciente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (50) NOT NULL, 
cpf CHAR (11) NOT NULL UNIQUE,
dataNascimento DATETIME NOT NULL,
doencasPreexistentes VARCHAR (255) NULL,
tipoSanguineo VARCHAR (3) NOT NULL,
CONSTRAINT chk_tipoSanguineo CHECK
 (tipoSanguineo= 'A-' OR
  tipoSanguineo= 'AB+' OR tipoSanguineo= 'AB-' OR
 tipoSanguineo= 'B+' OR tipoSanguineo= 'B-' OR
 tipoSanguineo= 'O+' OR tipoSanguineo= 'O-')
);


CREATE TABLE consulta (
idConsulta INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
idPaciente INT NOT NULL,
idMedico INT NOT NULL,
idRecepcionista INT NOT NULL,
dataHoraConsulta DATETIME NOT NULL,
tipoConsulta SMALLINT DEFAULT 0,
/*0-Primeira vez 1-Retorno*/
observacoes VARCHAR(255),
valor DECIMAL(7,2),
CONSTRAINT fk_consultaPaciente FOREIGN KEY (idPaciente)
REFERENCES Paciente(idPaciente),
CONSTRAINT fk_consultaMedico FOREIGN KEY (idMedico)
REFERENCES Medico(idMedico),
CONSTRAINT fk_consultaRecepcionista FOREIGN KEY (idRecepcionista)
REFERENCES Recepcionista(idRecepcionista)
);


SET FOREIGN_KEY_CHECKS = 0;
CREATE TABLE consulta (
idConsulta INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
idPaciente INT NOT NULL,
idMedico INT NOT NULL,
idRecepcionista INT NOT NULL,
dataHoraConsulta DATETIME NOT NULL,
tipoConsulta SMALLINT DEFAULT 0,
/*0-Primeira vez 1-Retorno*/
observacoes VARCHAR(255),
valor DECIMAL(7,2),
CONSTRAINT fk_consultaPaciente FOREIGN KEY (idPaciente)
REFERENCES paciente(idPaciente),
CONSTRAINT fk_consultaMedico FOREIGN KEY (idMedico)
REFERENCES medico(idMedico),
CONSTRAINT fk_consultaRecepcionista FOREIGN KEY (idRecepcionista)
REFERENCES recepcionista(idRecepcionista)
);
SET FOREIGN_KEY_CHECKS = 1;

DROP TABLE consulta


/*Inserindo dois ou mais registros*/
INSERT INTO medico (nomeMedico,loginMedico,senha,crm)
VALUES ('Dra.Rosana','rosana@gmail.com','12345678','666333MG');

INSERT INTO medico (nomeMedico,loginMedico,senha,crm)
VALUES ('Dr.Heitor','heitor@gmail.com','12345678','555333SP');

SELECT * FROM medico 

INSERT INTO medico (nomeMedico,loginMedico,senha,crm)
VALUES  ('Dr.Ricardo','ricardo@gmail.com','12345678','777222MG'),
('Dr.Graziella','graziella@gmail.com','12345678','555111RJ');

SELECT nomeMedico,crm FROM medico /*Escolhendo algumas colunas*/
SELECT * FROM medico /*Trazendo todas as colunas*/

/*Insert Explícito*/
INSERT INTO medico (crm, nomeMedico,senha,loginMedico)
VALUES ('666111SP','Dra. Ana Maria de novo','anamaria@gmail.com');


/*Insert Implícito*/
INSERT INTO medico
VALUES (5,'Dra. Ana Paula','anapaula@gmail.com','11223344','121111SP');


/*Excluir Registros*/
DELETE FROM medico 
WHERE idMedico = 5

SELECT * FROM medico 


/*Buscar Filtros*/
SELECT * FROM medico 
WHERE idMedico = 6

/*Buscar com filtros*/
SELECT FROM medico
WHERE idMedico = 6

/*Filtros e Operadores*/
SELECT idMedico,nomeMedico,crm FROM medico 
WHERE idMedico >= 2 AND idMedico <= 6

/*Filtros com Between*/
SELECT idMedico,nomeMedico,crm FROM medico
WHERE idMedico BETWEEN 2 AND 6

UPDATE medico
SET senha='12345678',
loginMedico='anamarianova@gmail.com'
WHERE idMedico=4


SELECT * FROM medico 
WHERE crm like '%MG'

DELETE FROM medico 
WHERE idMedico = 6


SELECT nomeMedico,crm,loginMedico FROM medico
WHERE nomeMedico LIKE 'Dra. An%'

/*Ordenando resultados de uma consulta*/
SELECT * FROM medico
ORDER BY nomeMedico ASC/*Crescente*/


SELECT * FROM medico
ORDER BY nomeMedico DESC /*Decresente*/


/*Inserir 03 pacientes e 03 recepcionistas no BD*/
INSERT INTO paciente (nome,cpf,dataNascimento,doencasPreexistentes,tipoSanguineo) 
VALUES ('Mariah','45249131816','2007-06-30 21:30','Não Consta','O+');

SELECT * FROM paciente

INSERT INTO paciente (nome,cpf,dataNascimento,doencasPreexistentes,tipoSanguineo)
VALUES ('Filipe','54421170801','2005-10-23','1 mês de vida','O-'),
('Livia','12385266632','2005-12-01','Crise de epilepsia','A-');


INSERT INTO recepcionista (nomeRecepcionista,loginRecepcionista,senha,celular,nomeLogradouro,numero,complemento,cep,cidade,estado)
VALUES ('Fernando','fernando@gmail.com','12345678','13123456783','Rua do meio','1980','13','12356784','São Vicente','SP'),
('Kauan','kauanzinho@gmail.com','12345678','13987456123','Rua alfredinho','95','32','98765423','Santos','SP'),
('Pedro','pedrinho@gmail.com','12345678','13654987123','Rua pedro','18','20','32145698','Santos','SP');

SELECT * FROM recepcionista

DELETE FROM recepcionista
WHERE idRecepcionista = 6 


/*Inserindo Consulta*/
INSERT INTO consulta (idMedico,idPaciente,idRecepcionista,dataHoraConsulta,tipoConsulta)
VALUES
(2,1,2,'2024-06-24 18:30',0);

SELECT * FROM consulta


/*Funções de agregação*/
/*Conta as ocorrências*/
SELECT COUNT(idMedico) AS 'Quantidade de Médicos'
FROM medico
WHERE crm LIKE '%MG'

/*Pega o valor máximo/maior: data, hora, inteiro,decimal */
SELECT MAX(dataHoraConsulta) FROM consulta
/* Pega o valor mínimo/menor : data, hora, inteiro,decimal*/

/*Realiza a soma dos valores*/
SELECT SUM(idRecepcionista) FROM recepcionista

/*Realiza a media aritmética simples de determinados valores*/
SELECT AVG(idPaciente) FROM paciente 

SELECT * FROM medico

SELECT COUNT(idMedico) AS 'Quantidade de Médicos'
FROM medico
WHERE crm LIKE '%SP'


SELECT * FROM paciente

INSERT INTO paciente (nome,cpf,dataNascimento,tiposanguineo)
VALUES 
('Magali','55566677788','2001-07-07 6:55:00','O+'),
('Mônica','99966677788','2002-10-02 13:22:00','O+'),
('Cascão','99966611188','2000-12-22 11:21:00','B-'),
('Penadinho','22266677788','1997-08-01 12:22:00','O-');


SELECT tiposanguineo 'Tipos Sanguíneos',
COUNT(idPaciente) AS 'Total Paciente' 
FROM paciente
GROUP BY tiposanguineo


/*Como NÃO fazer? */
SELECT COUNT(idPaciente) AS 'Total Pacientes',
FROM paciente
GROUP BY tiposanguineo

SELECT tiposanguineo AS 'Tipos Sanguineos',
COUNT(idPaciente) AS 'Total de Pacientes'
FROM paciente

SELECT * FROM paciente
SELECT * FROM medico

SELECT tiposanguineo AS 'Tipos Sanguineos',
COUNT(idPaciente) AS 'Total de Pacientes'
FROM paciente
GROUP BY tiposanguineo
ORDER BY COUNT(idPaciente) DESC


SELECT tiposanguineo AS 'Tipos Sanguineos',
COUNT(idPaciente) AS 'Total de Pacientes'
FROM paciente
GROUP BY tiposanguineo
HAVING COUNT(idPaciente)>=2
ORDER BY COUNT(idPaciente) DESC


/*WHERE só funciona com as colunas nativas*/
/*HAVING funciona com filtro e função de agregação*/
/*ORDER BY funciona com todos ou seja função de agregação ou colunas*/



/****JOIN****/
/* /* Traga o nome do médico, o crm e a data da consulta marcada 
para ele levando em conta todos os médicos que possuem 
consultas */


SELECT nomeMedico,nome,crm,dataHoraConsulta FROM medico
INNER JOIN consulta
ON medico.idMedico = consulta.idMedico 
INNER JOIN paciente
ON consulta.idPaciente = paciente.idPaciente;


SELECT * FROM consulta;
SELECT * FROM medico;
SELECT * FROM paciente;

/*Qual a diferença em resultado?*/
SELECT nomeMedico,crm,dataHoraConsulta FROM
medico
LEFT JOIN consulta
ON medico.idMedico = consulta.idMedico 

SELECT nomeMedico,crm,dataHoraConsulta FROM
medico
INNER JOIN consulta
ON medico.idMedico = consulta.idMedico 


/*Criar uma query que traga o nome recepcionista, o celular dele,
e a data da consulta que ele marcou*/

SELECT nomeRecepcionista,celular,dataHoraConsulta FROM 
recepcionista
INNER JOIN consulta
ON recepcionista.idRecepcionista = consulta.idRecepcionista

SELECT * FROM recepcionista
SELECT * FROM consulta


/*B - Criar uma query que traga o nome do paciente, seu documento,
o nome do médico, o crm, a data da consulta e o recepcionista 
que a marcou */

SELECT nome,cpf,nomeMedico,crm,dataHoraConsulta,nomeRecepcionista FROM paciente
INNER JOIN consulta 
ON paciente.idPaciente = consulta.idPaciente
INNER JOIN medico 
ON medico.idMedico = consulta.idMedico
INNER JOIN recepcionista
ON recepcionista.idRecepcionista = consulta.idRecepcionista 

/*C - Criar uma query que traga quantas consultas existem 
na clínica */
 SELECT COUNT(*) AS 'Quantidades de Consulta'
 FROM consulta;

/*D - Criar uma query que traga o nome do paciente, o email,
o tipo sanguineo e a data de suas consultas
mas somente dos pacientes que possuem email*/

SELECT nome,email,tipoSanguineo,dataHoraConsulta FROM 
paciente INNER JOIN consulta 
ON paciente.idPaciente = consulta.idPaciente
WHERE email <> 'Não informado' AND email IS NOT NULL AND email <>''
/*opção kauan ou joão H*/

WHERE email LIKE '%@%' /*opçõa gabrielly*/


SELECT * FROM paciente
 
/*E - Criar uma query que traga o nome de TODOS OS paciente, 
o nome do médico, a data da consulta
independente de os pacientes possuírem consultas */

SELECT nome,nomeMedico,dataHoraConsulta FROM paciente
LEFT JOIN consulta 
ON paciente.idPaciente = consulta.idPaciente
LEFT JOIN medico
ON medico.idMedico = consulta.idMedico


/*Desafio Final - Trazer a quantidade de consultas 
que possuo na clínica agrupada 
por tipo sanguineo do paciente*/

SELECT tipoSanguineo AS 'Tipo Sanguineo e Paciente',
COUNT(consulta.idPaciente) AS 'Quantidade de Consultas'
FROM paciente
INNER JOIN consulta
ON paciente.idPaciente = consulta.idPaciente
GROUP BY tipoSanguineo

SELECT COUNT(consulta.idPaciente) AS 'Quantidade de Consultas',
tipoSanguineo AS 'Tipo Sangue'
FROM paciente 
INNER JOIN consulta 
ON paciente.idPaciente = consulta.idPaciente
GROUP BY tipoSanguineo

/*1.Buscar nome do médico, nome da especialidade, 
e crm de todos os médicos cuja especialidade ou seja “Cardiologista*/

SELECT nomeMedico,nomeEspecialidade,crm FROM medico
INNER JOIN especialidade ON especialidade.idEspecialidade = medico.idEspecialidade
WHERE nomeEspecialidade LIKE '%Cardiologista'novaclin


/* View - Estrutura CREATE, DROP ALTER*//*NÃO MUDA DADOS*/

DROP VIEW vw_relatorioConsulta

CREATE VIEW vw_relatorioConsulta 
AS 
SELECT nome AS 'Nome do paciente',cpf,nomeMedico AS 'Nome do médico',
crm,dataHoraConsulta AS 'Data',nomeRecepcionista AS 'Nome do recepcionista' 
FROM 
paciente 
INNER JOIN consulta
ON paciente.idPaciente = consulta.idpaciente
INNER JOIN medico 
ON medico.idMedico = consulta.idMedico
INNER JOIN recepcionista 
ON recepcionista.idRecepcionista = consulta.idRecepcionista

/*Executar uma view*/
SELECT * FROM vw_relatorioConsulta
ORDER BY 'Data' DESC;


/*Criar uma VIEW para trazer a quantidade*/
CREATE VIEW vw_tipoSanguineo
AS 
SELECT COUNT(consulta.idPaciente) AS 'Quantidade de Consultas',
tipoSanguineo AS 'Tipo Sanguineo'
FROM paciente 
INNER JOIN consulta 
ON paciente.idPaciente = consulta.idPaciente
GROUP BY tipoSanguineo

SELECT * FROM vw_tipoSanguineo


/*Stored Procedures OU Procedimentos Armazenados para inserir algo 
CREATE/ DROP/ ALTER */
/*MUDA DADOS OU (NÃO)*/

CREATE PROCEDURE pi_recepcionista
(IN 
nomeRecepcionsta VARCHAR(50),
loginRecepcionista VARCHAR(50),
senha CHAR(8),
celular CHAR(11),
nomeLogradouro VARCHAR(50),
numero VARCHAR(7),
complemento VARCHAR(10),
cep CHAR(8),
cidade VARCHAR(30),
estado CHAR(2))

INSERT INTO recepcionista 
(nomeRecepcionista,loginRecepcionista,senha,celular,
nomeLogradouro,numero,complemento,cep,cidade,estado)
VALUES (nomeRecepcionista,loginRecepcionista,senha,celular,
nomeLogradouro,numero,complemento,cep,cidade,estado);

/*Chamar a Stored Procedure*/
CALL pi_recepcionista('Rosa da Silva','rosa.silva@gmail.com','22445677',
'11997455994','RuaPatriarca','67',NULL,'11000000','São Paulo','SP');

/**/
SELECT * FROM recepcionista

DELETE FROM recepcionista WHERE idRecepcionista=4;*/


/*Deletar recepcionista*/

CREATE PROCEDURE pd_recepcionista
(param_idRecepcionista INT)
DELETE FROM recepcionista
WHERE idRecepcionista = param_idRecepcionista

CALL pd_recepcionista(6)

SELECT * FROM recepcionista


/*Criar uma procedure que liste nome do paciente, e tipo Sanguineo todos pacientes de determinada cidade*/

CREATE PROCEDURE ps_ListaPacienteTipoSanguineo
(IN tipo VARCHAR(3))
SELECT nome,tipoSanguineo from paciente
WHERE tipoSanguineo=tipo;

CALL ps_ListaPacienteTipoSanguineo('B-');


/*Crie uma procedure que mostre todas as consultas de acordo com o id do Medico ordenada por data - AGENDA DO MÉDICO*/

CREATE PROCEDURE ps_idMedicoDataHoraConsulta
(IN param_idMedico INT)
SELECT idMedico,dataHoraConsulta FROM consulta
WHERE idMedico=param_idMedico
ORDER BY dataHoraConsulta ASC

CALL ps_idMedicoDataHoraConsulta('2');
 

/*Criar uma procedure que conta o total de consultas que possua na clínica*/

CREATE PROCEDURE ps_totalDataHoraConsultas()
SELECT COUNT(idConsulta) AS 'Total de Consultas' FROM consulta

CALL ps_totalDataHoraConsultas;


/*Criar uma procedure que mostre o nome do paciente, 
a data da consulta e o nome do médico, de acordo com o nome do paciente informado*/

DROP PROCEDURE ps_nomePacientedataHoraConsultaNomeMedico
(IN idConsulta INT)
SELECT nome,dataHoraConsulta,nomeMedico FROM consulta


CALL ps_nomePacientedataHoraConsultaNomeMedico('');

SELECT * FROM consulta


/*1.Buscar nome do médico, nome da especialidade, e crm de todos os médicos cuja especialidade
seja “Cardiologista”.*/
SELECT nome, nomeEspecialidade, crm
FROM medico
INNER JOIN especialidade ON especialidade.idEspecialidade = medico.IdEspecialidade
WHERE nomeEspecialidade LIKE '%Cardiologista%';

 
/*2.Buscar quantos pacientes a clínica possui por cidade.*/
SELECT cidade, COUNT(*) AS num_pacientes
FROM paciente
GROUP BY cidade;
 
/*3.Buscar a data de todas as consultas, nome do médico e o nome do paciente, em ordem
cronológica. */
SELECT c.dataHoraConsulta, m.nome AS nome_medico, p.nome AS nome_paciente
FROM consulta c
JOIN medico m ON c.idMedico = m.idMedico
JOIN paciente p ON c.idPaciente = p.idPaciente
ORDER BY c.dataHoraConsulta;

/*4- Buscar o nome do paciente, celular, email, e a data da consulta 
de todos os pacientes com consulta marcada, desde que vivam em Santos.*/
SELECT p.nome, p.cel, p.email, c.dataHoraConsulta
FROM paciente p
JOIN consulta c ON p.idPaciente = c.idPaciente
WHERE p.cidade = 'Santos';
 
/*5- Buscar todos os pacientes que tenham com a letra "P" no nome. */
SELECT *
FROM paciente
WHERE nome LIKE '%P%';

/*6- Buscar o nome do médico, a data da consulta, o nome do paciente e
 a especialidade do médico de todas as consultas de determinado dia (escolhido por você), em ordem alfabética.*/
SELECT m.nome AS nome_medico, c.dataHoraConsulta, p.nome AS nome_paciente, e.nomeEspecialidade AS especialidade
FROM consulta c
JOIN medico m 
ON c.idMedico = m.idMedico
JOIN paciente p 
ON c.idPaciente = p.idPaciente
JOIN especialidade e 
ON m.IdEspecialidade = e.idEspecialidade
WHERE DATE(c.dataHoraConsulta) = '2024-06-22'
ORDER BY m.nome;
 
/*7- Buscar o nome dos médicos e sua especialidade, 
apenas dos médicos com CRM de SP.*/
SELECT m.nome AS nome_medico, e.nomeEspecialidade AS especialidade
FROM medico m
JOIN especialidade e ON m.IdEspecialidade = e.idEspecialidade
WHERE m.crm LIKE '%SP%';

/*8- Buscar a data da consulta que está mais longe na clínica. */
SELECT MAX(dataHoraConsulta) AS data_mais_longe
FROM consulta;

/*9- Buscar quantos médicos a clínica possui por especialidade.*/
SELECT e.nomeEspecialidade AS especialidade, COUNT(*) AS num_medicos
FROM medico m
JOIN especialidade e ON m.IdEspecialidade = e.idEspecialidade
GROUP BY e.nomeEspecialidade;

/*10- Buscar o nome, celular e email de todos os pacientes
 que começam com a letra “D” em ordem alfabética.*/
SELECT nome, cel, email
FROM paciente
WHERE nome LIKE 'D%'
ORDER BY nome;

/*11- Buscar todos os exames, bem como quem foi o médico que solicitou e a data do exame, 
em ordem cronológica (por data). */
SELECT nomeExame, m.nome AS medico_solicitante,dataHoraExame
FROM exame ex
JOIN consulta c ON ex.idConsulta = c.idConsulta
JOIN medico m ON c.idMedico = m.idMedico
JOIN especialidade e ON m.IdEspecialidade = e.idEspecialidade
ORDER BY ex.dataHoraExame;
 
/*12- Buscar o nome do médico, o crm e a data da consulta,
 de todos os médicos, ainda que não possuam consultas.*/
SELECT m.nome AS nome_medico, m.crm, c.dataHoraConsulta
FROM medico m
LEFT JOIN consulta c ON m.idMedico = c.idMedico
ORDER BY m.nome;

/*13-Buscar o nome de todos os pacientes, celular, email e data da consulta em ordem alfabética.
 Trazer os pacientes ainda que não possuam consultas.*/
SELECT p.nome, p.cel, p.email, c.dataHoraConsulta
FROM paciente p
LEFT JOIN consulta c ON p.idPaciente = c.idPaciente
ORDER BY p.nome;

/*14- Buscar o nome de todos os pacientes, logradouro, número e complemento apenas dos moradores que moram em São Paulo, em ordem alfabética.*/
SELECT nome, logradouro, numero, complemento
FROM paciente
WHERE cidade = 'São Paulo'
ORDER BY nome;

/*15- Buscar a data de todas as consultas, o nome do recepcionista que marcou, o nome do
paciente, o nome do médico, a especialidade do médico e o celular do paciente em ordem
cronológica invertida.*/

SELECT c.dataHoraConsulta, nomeRecepcionista AS nome_recepcionista, p.nome AS nome_paciente, m.nome AS nome_medico, e.nomeEspecialidade AS especialidade_medico, p.cel AS celular_paciente
FROM consulta c
JOIN recepcionista rec ON c.idRecepcionista = rec.idRecepcionista
JOIN paciente p ON c.idPaciente = p.idPaciente
JOIN medico m ON c.idMedico = m.idMedico
JOIN especialidade e ON m.IdEspecialidade = e.idEspecialidade
ORDER BY c.dataHoraConsulta DESC;

/*Desafio - É possível realizar? Justifique:*/
/*Sim, é possível realizar essa consulta. Ela envolve múltiplas junções (joins) entre várias tabelas (consulta, recepcionista, paciente, medico e especialidade), onde os relacionamentos são bem definidos através de chaves estrangeiras. A ordenação é feita de forma decrescente pela coluna dataHoraConsulta.*/
/*Relatório a) - Quantas consultas cada médico realizou na clínica:*/

SELECT m.nome AS nome_medico, COUNT(c.idConsulta) AS num_consultas
FROM medico m
LEFT JOIN consulta c ON m.idMedico = c.idMedico
GROUP BY m.nome;

/*Relatório b) - Quantas consultas foram realizadas por especialidade:*/
SELECT e.nomeEspecialidade AS especialidade_medico, COUNT(c.idConsulta) AS num_consultas
FROM consulta c
JOIN medico m ON c.idMedico = m.idMedico
JOIN especialidade e ON m.IdEspecialidade = e.idEspecialidade
GROUP BY e.nomeEspecialidade;


/*LISTA 4*/

/*1) Criar uma view que traga nome e contatos (telefones e pacientes) em ordem alfabética 
e executá-la.*/

CREATE VIEW vw_nomePacienteTelefonePaciente
AS
SELECT nome AS 'Nome do Paciente',cel AS 'Celular do Paciente' 
FROM paciente
ORDER BY nome;

SELECT * FROM vw_nomePacienteTelefonePaciente


/*2) Criar uma view que traga a quantidade de consultas agrupadas por especialidade e 
executá-la.*/

CREATE VIEW vw_ConsultasPorEspecialidade 
AS 
SELECT COUNT(idConsulta) AS 'Quantidade de Consultas'
FROM consulta
WHERE nomeEspecialidade LIKE '%Cardiologista'


SELECT * FROM consulta


/*Transações em Banco de Dados*/

START TRANSACTION;

COMMIT;

ROLLBACK;

START TRANSACTION;
DELETE FROM consulta;
ROLLBACK;

SELECT * FROM consulta



