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