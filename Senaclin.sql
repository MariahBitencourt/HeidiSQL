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




