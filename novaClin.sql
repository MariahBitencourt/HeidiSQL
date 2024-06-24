novaClin

/*Criando Banco de Dados*/
CREATE DATABASE novaClin

SHOW TABLES
SELECT*FROM paciente
SELECT*FROM medico
SELECT*FROM recepcionista
SELECT*FROM consulta 


CREATE TABLE recepcionista(
idRecepcionista INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nomeRecepcionista VARCHAR(50) NOT NULL,
loginRecepcionsita VARCHAR(20) NOT NULL,
senha CHAR(6) NOT NULL,
celular CHAR(11)  NULL,
cpf CHAR(11) NOT NULL
);

CREATE TABLE paciente(
idPaciente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
cpf CHAR(11) NOT NULL UNIQUE,
cel CHAR(11) NOT NULL,
dataNascimento DATETIME NOT NULL,
email VARCHAR(50) NULL,
logradouro VARCHAR (30) NOT NULL,
numero VARCHAR(6) NOT NULL,
complemento VARCHAR(10) NULL,
cidade VARCHAR(20) NOT NULL,
cep CHAR(8) NULL,
observações VARCHAR(100)
);
 
CREATE TABLE especialidade(
idEspecialidade INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nomeEspecialidade VARCHAR(30) NOT NULL
);
 
 
CREATE TABLE medico(
idMedico INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
IdEspecialidade INT NOT NULL,
nome VARCHAR(50) NOT NULL,
crm CHAR(8) NOT NULL,
login VARCHAR(20) NOT NULL,
senha CHAR(6) NOT NULL,
CONSTRAINT Fk_MedicoEspecialidade FOREIGN KEY(idEspecialidade)
REFERENCES especialidade(idEspecialidade)
);
 
CREATE TABLE consulta(
idConsulta INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
idPaciente INT NOT NULL,
idRecepcionista INT NOT NULL,
idMedico INT NOT NULL,
dataHoraConsulta DATETIME NOT NULL,
sintomas VARCHAR(200) NULL,
prescricao VARCHAR(200) NULL,
CONSTRAINT Fk_ConsultaPaciente FOREIGN KEY(idPaciente)
REFERENCES paciente(idPaciente),
CONSTRAINT Fk_ConsultaRecepcionista FOREIGN KEY(idRecepcionista)
REFERENCES recepcionista(idRecepcionista),
CONSTRAINT Fk_ConsultaMedico FOREIGN KEY(idMedico)
REFERENCES medico(idMedico)
);
 
CREATE TABLE exame(
idExame INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
idConsulta INT NOT NULL,
dataHoraExame DATETIME NOT NULL,
nomeExame VARCHAR(30) NOT NULL,
statusExame VARCHAR(10) NOT NULL,
resultado VARCHAR(200) NULL,
dataRetiradaExane DATETIME NULL,
dataPrevisaoEntrega DATETIME NULL,
CONSTRAINT Fk_exameconsulta FOREIGN KEY(idConsulta)
REFERENCES consulta(idConsulta)
);


ALTER TABLE paciente 
ADD estado CHAR(2) NOT NULL;

INSERT INTO paciente 
VALUES (1,'Donald','59736778851','12975869113','2006-08-14','donald@gmail.com','Rua Pluto','102','Apt 22','Santos','11045000','Pneumonia','SP'),
(2,'Margarida','70975482823','17988867491','2002-05-24','margarida@gmail.com','Rua Carvalho de Mendonça','65','Apt 85','São Vicente','11330780','Tuberculose','SP'),
(3,'Patinhas','19319042861','11987482896','1996-02-16','patinhas@gmail.com','Rua Kleber Santos','22','Apt 33','Santos','11320910','Resfriado','SP'),
(4,'Huguinho','80921353804','13996284462','1999-03-19','huguinho@gmail.com','Rua João dos Passos','66','12','Cubatão','11505025','Corte na Cabeça','SP'),
(5,'Luizinho','23234314802','11974368742','1970-05-31','luizinho@gmail.com','Praça Araújo Porto Alegre','70','Apt 22','Praia Grande','11721130','Tumor no rim esquerdo','SP'),
(6,'Zezinho','20172654890','18993405394','1990-02-20','zezinho@gmail.com','Rua das Minas','122','Apt 20','São João del rei','36300066','Overdose','MG'),
(7,'Mickey','77416265827','14999716239','1994-01-21','mickey@gmail.com','Rua da morte','100','Apt 33','Rio de Janeiro','24912300','Tiro no peito','RJ'),
(8,'Minie','49161000850','17982349604','2005-02-25','minie@gmail.com','Rua Travessa Três Folhas','222','Apt 102','São Paulo','03689035','Acidente de carro','SP');

INSERT INTO recepcionista (nomeRecepcionista,loginRecepcionsita,senha,celular,cpf)
VALUES ('Chico Bento','chicobento.senaclin','123456','12993211631','53314759819'),
('Franjinha','franjinha.senaclin','123456','11981643127','60963941836'),
('Cebolinha','cebolinha.senaclin','123456','13986753786','42852451832');


INSERT INTO especialidade (nomeEspecialidade)
VALUES ('Cardiologista'),
('Otorrinolaringologista'),
('Clínico Geral'),
('Gastroenterologista'),
('Ortopedista');


INSERT INTO medico
VALUES (1,1,'Pardal','765544SP','pardal_med.senaclin','123456'),
(2,5,'Mônica','768880SP','monica_med.senaclin','123456'),
(3,3,'Zé Carioca','165544RJ','zeca_med.senaclin','123456'),
(4,4,'Magali','265544SP','magali_med.senaclin','123456'),
(5,2,'Horácio','365544MG','horacio_med.senaclin','123456');


INSERT INTO consulta(idPaciente,idMedico,idRecepcionista,dataHoraConsulta,sintomas,Prescricao)
VALUES (1,1,1,'2024-06-22 08:00','Dores no peito','Eletrocardiograma'),
(2,2,1,'2024-07-01 11:00','Dor na coxa','Ultrassom'),
(3,3,1,'2024-06-26 10:00','Resfriado e febre','Medicação dipirona e soro com dipirona na veia'),
(7,4,2,'2024-07-10 16:30','Dor de estomago e vomito','Exame de endoscopia e eno'),
(8,5,2,'2024-06-22 17:00','Surdo de um ouvido','Limpeza com soro a jato no ouvido');


INSERT INTO consulta (idPaciente, idRecepcionista, idMedico, dataHoraConsulta, sintomas, prescricao)
VALUES 
(3, 1, 1, '2024-06-30 15:00:00', 'Dor no peito', 'Eletrocardiograma'),
(3, 1, 2, '2024-07-01 16:00:00', 'Dor nas costas', 'Raio-X coluna');


UPDATE consulta
SET dataHoraConsulta = DATE_ADD(dataHoraConsulta, INTERVAL 2 HOUR)
WHERE idConsulta = 1;

UPDATE paciente
SET logradouro = 'nova rua', numero = '456', complemento = 'ap10'
WHERE nome = 'Minie';


UPDATE paciente
SET cel = '999888777'
WHERE nome = 'Mickey';


DELETE FROM consulta
WHERE idPaciente = 3 AND idMedico = 3;
/*motivo do erro*/
/*Esta operação pode falhar devido a uma restrição de chave estrangeira. 
A consulta do Patinhas com Zé Carioca pode estar referenciada em outras tabelas
(por exemplo, na tabela exame através da chave estrangeira idConsulta). 
Antes de excluir, seria necessário remover as dependências nesses registros relacionados*/


DELETE FROM medico
WHERE nome = 'Mônica';
/*Não é possível excluir a médica Mônica diretamente devido a restrições de chave estrangeira.
Ela pode estar associada a consultas na tabela consulta ou a exames na tabela exame.
Para excluir, primeiro seria necessário remover todas as dependências relacionadas a ela nessas tabelas.*/

SELECT dataHoraConsulta
FROM consulta
ORDER BY dataHoraConsulta;

SELECT * FROM medico;


SELECT DISTINCT cidade
FROM paciente
ORDER BY cidade;


SELECT nome, cel, email
FROM paciente
ORDER BY nome;


UPDATE medico
SET crm = '765544SP'
WHERE nome = 'Pardal';


UPDATE medico
SET senha = 'DOCTOR';


SELECT nome, crm
FROM medico
WHERE crm LIKE '%SP%'
ORDER BY nome;


SELECT nome, cel
FROM paciente
WHERE cidade = 'Santos' AND nome LIKE 'P%'
ORDER BY nome;


SELECT nome, logradouro, numero, cidade
FROM paciente
WHERE logradouro LIKE '%casa%'
ORDER BY nome;




