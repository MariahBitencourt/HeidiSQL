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
senha CHAR (8) NOT NULL,
crm CHAR(8) NOT NULL
);

SHOW TABLES /*Mostra as tabelas do banco de dados selecionado*/
/*DROP TABLE medico - apaga a tabela*/


CREATE TABLE recepcionista (
iRecepcionista INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nomeRecpcionista VARCHAR (50) NOT NULL,
loginRecpconista VARCHAR (50) NOT NULL,
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
idPaciente INT PRIMARY KEY AUTO_INCREMENT,
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
idConsulta INT PRIMARY KEY AUTO_INCREMENT,
idPaciente INT NOT NULL,
idMedico INT NOT NULL,
idRecepcionista INT NOT NULL,
dataHoraConsulta DATETIME NOT NULL,
tipoConsulta SMALLINT DEFAULT 0,
/*0-Primeira vez 1-Retorno*/
observacoes VARCHAR (255),
valor DECIMAL (7,2),



