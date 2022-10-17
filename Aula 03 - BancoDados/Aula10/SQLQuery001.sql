use master

select * from sys.master_files

Create Database bkBankAula10
ON primary
(
	Name = 'bkBankAula10',
	FileName = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BkBankAula10.mdf',
	Size = 10MB,MAXSIZE = 20,FILEGROWTH = 10%
)

LOG ON
(NAME = 'bkBankAula10_log',
FILENAME ='C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BkBankAula10_log.ldf',
Size = 10MB,MAXSIZE = 200,FILEGROWTH = 20%
);

--

ALTER Database bkBankAula10
	ADD FILEGROUP bkBankAula10Group1;

------------------

	ALTER Database bkBankAula10
	ADD FILE (
		NAME = 'bkBankAula10a',
		FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BkBankAula10a.ndf',
		SIZE = 10MB,
		MAXSIZE = 20,
		FILEGROWTH = 10%
	)TO FILEGROUP bkBankAula10Group1;

---------

USE bkBankAula10;

GO
CREATE SCHEMA Sales;

GO
CREATE SCHEMA HumanResources;

GO
----------------------------------------
Use bkBankAula10

Create Table HumanResources.Address(
AddressID int Constraint nnAddressAddressID NOT NULL IDENTITY(1,1),
StreetAddress	Varchar(125) Constraint nnAddressStreetAddress NOT NULL,
StreetAddress2  Varchar(75) Constraint nnAddressStreetAddress2 NOT NULL,
City			Varchar(100)Constraint nnAddressCity NOT NULL,
State			CHAR(2)Constraint nnAddressState NOT NULL,
EmployeeID		INT constraint nnAddressEmployed not null
)ON bkBankAula10Group1;

--
select * from sys.sysconstraints 
select * from sys.foreign_keys
select * from sys.key_constraints -- pk/uk
select * from sys.check_constraints
select * from sys.default_constraints
---------------
CREATE TABLE HumanResources.Employee(
	EmployeeID INT CONSTRAINT nnEmployeeEmployeeID NOT NULL IDENTITY(1,1),
	FirstName VARCHAR(50) CONSTRAINT nnEmployeeFirstName NOT NULL,
	MiddleName VARCHAR(50) NULL,
	LastName VARCHAR(50) CONSTRAINT nnEmployeeLastName NOT NULL
) ON bkBankAula10Group1;

ALTER TABLE HumanResources.Employee
	ADD GENDER CHAR(1) CONSTRAINT nnEmployeeGender NOT NULL;

--------

use bkBankAula10

ALTER TABLE HumanResources.Employee
	ADD FullName as LastName + ' ' + FirstName;

--
Use bkBankAula10
	ALTER TABLE HumanResources.Employee
	ADD	 SocialSecurityNumber Varchar(10)
		CONSTRAINT nnEmployeeSocialSecurityNumber NOT NULL;

	ALTER TABLE HumanResources.Employee
		ADD Active BIT
		CONSTRAINT nnEmployeeActive NOT NULL;

	ALTER TABLE HumanResources.Employee
	 ADD CONSTRAINT pkHumanResourceEmployeeID
		PRIMARY KEY(EmployeeID);
	
	ALTER TABLE HumanResources.Address
	  ADD CONSTRAINT pkHumanResourceAddressID
		PRIMARY KEY(AddressID);

	ALTER TABLE HumanResources.Employee
		ADD CONSTRAINT dfEmployeeActive
		DEFAULT(1) FOR Active;

	ALTER TABLE HumanResources.Employee
		ADD CONSTRAINT uqEmployeeSocialSecurityNumber
			UNIQUE(SocialSecurityNumber);

     ALTER TABLE HumanResources.Address
		ADD CONSTRAINT fkAddressEmployeeID
			FOREIGN KEY(EmployeeID)
				REFERENCES HumanResources.Employee(EmployeeID)

---- -------------------05 /10 / 22 Aula 10.2--------------------------------------------------------

Use master
use Academico


Create database Academico;

DROP TABLE IF EXISTS tb_historicos;
DROP TABLE IF EXISTS tb_matriculas;
DROP TABLE IF EXISTS tb_departamentos;
DROP TABLE IF EXISTS tb_cursos_oferecidos;
DROP TABLE IF EXISTS tb_cursos;
DROP TABLE IF EXISTS tb_empregados;
DROP TABLE IF EXISTS tb_grades_salarios;
----------------------


---------------------------
--Tabela tb_grades_salarios
---------------------------

CREATE TABLE tb_grades_salarios(
id_grade			INTEGER,
limite_inferior		NUMERIC(7,2) CONSTRAINT  nn_table_grades_limite_inferior NOT NULL,
								 CONSTRAINT  ck_table_grades_limite_inferior CHECK (limite_inferior >=0),
limite_superior		NUMERIC(7,2) CONSTRAINT  nn_table_grades_limite_superior NOT NULL,
bonus				FLOAT		 CONSTRAINT  nn_table_grades_bonus NOT NULL,
								 CONSTRAINT  ck_table_grades_bonus CHECK(limite_inferior <= limite_superior),

fg_ativo			BIT,
CONSTRAINT pk_tb_grades_id_grade	PRIMARY KEY(id_grade));

---------------------------
--Tabela tb_cursos
---------------------------

CREATE TABLE tb_cursos(
id_curso		VARCHAR(6),
ds_curso		VARCHAR(60) CONSTRAINT nn_tb_cursos_ds_curso  NOT NULL,
categoria		CHAR(3)		CONSTRAINT nn_tb_cursos_categoria NOT NULL,
							-- GEN (general), para cursos introdutorios
							-- DSG (design), para analise e projeto
							-- BLD (build),para desenvolvimento de aplicativos
							CONSTRAINT ck_tb_cursos_categoria CHECK(categoria IN('GEN','BLD','DSG')),
duracao		INTEGER			CONSTRAINT nn_tb_cursos_duracao NOT NULL,
fg_ativo	BIT,
CONSTRAINT ck_tb_cursos_id_curso CHECK(id_curso = UPPER(id_curso)),
CONSTRAINT pk_tb_cursos_id_curso PRIMARY KEY(id_curso));


SELECT *
	FROM tb_cursos;

---------------------------
--Tabela tb_EMPREGADOS
---------------------------

CREATE TABLE tb_empregados(
id_empregado		INTEGER		CONSTRAINT ck_tb_emp_id_emp CHECK (id_empregado >7000),
nm_empregado		VARCHAR(60)	CONSTRAINT nn_tb_emp_nn_emp NOT NULL,
iniciais_empregado  VARCHAR(5)	CONSTRAINT nn_tb_emp_iniciais NOT NULL,
ds_cargo			VARCHAR(40),
id_gerente			INTEGER     CONSTRAINT fk_tb_emp_id_gerente REFERENCES tb_empregados,
dt_nascimento		DATE		CONSTRAINT nn_tb_emp_dt_nascimento NOT NULL,
salario				NUMERIC(7,2) CONSTRAINT nn_tb_emp_salario NOT NULL,
comissao		    FLOAT,
id_departamento     BIT,
fb_ativo		    BIT,
CONSTRAINT pk_tb_emp_id_emp PRIMARY KEY(id_empregado));


SELECT * FROM tb_empregados;


---------------------------
----Tabela tb_departamentos
---------------------------

CREATE TABLE tb_departamentos(

id_departamento		INTEGER		CONSTRAINT ck_tb_departamentos_id_depto CHECK ((id_departamento%10) =0),
nm_departamento		VARCHAR(40) CONSTRAINT nn_tb_departamentos_nm_depto NOT NULL,
								CONSTRAINT ck_tb_departamentos_nm_depto
											CHECK(nm_departamento = UPPER(nm_departamento)),
localizacao			VARCHAR(60) CONSTRAINT nn_tb_departamentos_localizacao NOT NULL,
								CONSTRAINT ck_tb_departamentos_localizacao
											CHECK (localizacao = UPPER(localizacao)),
id_gerente			INTEGER,
fg_ativo			BIT,
CONSTRAINT pk_tb_departamentos_id_depto PRIMARY KEY(id_departamento),
CONSTRAINT un_tb_departamentos_nm_depto UNIQUE(nm_departamento),
CONSTRAINT fk_tb_departamentos_id_gerente FOREIGN KEY (id_gerente) REFERENCES tb_empregados
);

SELECT * FROM tb_departamentos;

---------------------------
----Tabela cursos_oferecidos
---------------------------
CREATE TABLE tb_cursos_oferecidos(
id_curso			VARCHAR(6)		CONSTRAINT nn_tb_cursos_oferecidos_id_curso NOT NULL,
dt_inicio			DATE			CONSTRAINT nn_tb_cursos_oferecidos_dt_inicio NOT NULL,
id_instrutor		INTEGER,
localizacao			VARCHAR(60),
fg_ativo			BIT,
CONSTRAINT pk_tb_cursos_oferecidos PRIMARY KEY (id_curso,dt_inicio),
CONSTRAINT fk_tb_cursos_oferecidos_id_curso FOREIGN KEY(id_curso) REFERENCES tb_cursos,
CONSTRAINT fk_tb_cursos_oferecidos_id_instrutor FOREIGN KEY (id_instrutor) REFERENCES tb_empregados
);

SELECT * FROM tb_cursos_oferecidos
---------------------------
----Tabela tb_matriculas
---------------------------

CREATE TABLE tb_matriculas(
 id_participante		INTEGER		CONSTRAINT nn_tb_matriculas_id_participante NOT NULL,
 id_curso				VARCHAR(6)	CONSTRAINT nn_tb_matriculas_id_curso NOT NULL,
 dt_inicio				DATE		CONSTRAINT nn_tb_matriculas_dt_inicio NOT NULL,
 avaliacao				INTEGER		CONSTRAINT ck_tb_matriculas_avaliacao CHECK(avaliacao in(1,2,3,4,5)),
 fg_ativo				BIT,
 CONSTRAINT pk_tb_matriculas PRIMARY KEY (id_participante,id_curso,dt_inicio),
 CONSTRAINT fk_tb_matriculas FOREIGN KEY(id_curso,dt_inicio) REFERENCES tb_cursos_oferecidos,
 CONSTRAINT fk_tb_matriculas_id_participante FOREIGN KEY (id_participante) REFERENCES tb_empregados);

SELECT * FROM tb_matriculas

CREATE TABLE tb_historicos(
id_empregado		INTEGER		CONSTRAINT nn_tb_historicos_id_emp NOT NULL,
dt_inicio			DATE		CONSTRAINT nn_tb_historicos_dt_inicio NOT NULL,
ano_inicio			INTEGER		CONSTRAINT nn_tb_historicos_ano_inicio NOT NULL,
dt_final			DATE,
id_departamento		INTEGER		CONSTRAINT nn_tb_historicos_id_depto NOT NULL,
salario				NUMERIC(7,2)CONSTRAINT nn_tb_historicos_salario NOT NULL,
comentario			VARCHAR(60),
fg_ativo			BIT,
CONSTRAINT pk_tb_historicos PRIMARY KEY(id_empregado,dt_inicio),
CONSTRAINT ck_tb_historicos_dt_inicio CHECK(dt_inicio < dt_final),
CONSTRAINT fk_tb_historicos_id_emp FOREIGN KEY(id_empregado) REFERENCES tb_empregados ON DELETE CASCADE,
CONSTRAINT fk_tb_historicos_id_depto FOREIGN KEY(id_departamento) REFERENCES tb_departamentos
);

---------------------------
-----Carga de dados--------
---------------------------

 --Disable PK (constraints to make inserting easier)

 GO 
 ALTER TABLE tb_empregados
 NOCHECK CONSTRAINT fk_tb_emp_id_gerente;
 GO

 INSERT INTO tb_empregados(id_empregado,nm_empregado,
						  iniciais_empregado,
						  ds_cargo,id_gerente,
						  dt_nascimento,salario,
						  comissao,id_departamento,fb_ativo)
VALUES
(7369,'SMITH','N','TRAINER',7902,'1965-12-17',8000.00,NULL,20,1),
(7499,'ALLEN','JAM','SALESREP',7698,'1961-02-20',16000.00,300,30,1),
(7521,'WARD','TF','SALESREP',7698,'1962-02-22',12500.00,500,30,1),
(7566,'JONES','JM','MANAGER',7839,'1967-04-02',29750.00,NULL,20,1),
(7654,'MARTIN','P','SALESREP',7698,'1956-09-28',12500.00,1400,30,1),
(7698,'BLAKE','R','MANAGER',7839,'1963-11-01',28500.00,NULL,30,1),
(7782,'CLARK','AB','MANAGER',7839,'1965-06-09',24500.00,NULL,10,1),
(7788,'SCOTT','SCJ','TRAINER',7566,'1959-11-26',30000.00,NULL,10,1),
(7839,'KING','CC','DIRECTOR',NULL,'1952-11-17',50000.00,NULL,10,1),
(7844,'TURNER','JJ','SALESREP',7698,'1968-09-28',15000.00,0,30,1),
(7876,'ADAMS','AA','TRAINER',7788,'1966-12-30',11000.00,NULL,20,1),
(7900,'JONES','R','ADMIN',7698,'1969-12-03',8000.00,NULL,30,1),
(7902,'FORD','MG','TRAINER',7566,'1959-02-13',30000.00,NULL,20,1),
(7934,'MILLER','TJA','ADMIN',7782,'1962-01-23',13000.00,NULL,10,1);

GO
	ALTER TABLE tb_empregados
	CHECK CONSTRAINT fk_tb_emp_id_gerente;
GO

SELECT * FROM tb_empregados


INSERT INTO tb_departamentos(id_departamento,nm_departamento,localizacao,id_gerente,fg_ativo)
VALUES
(10,'ACCOUNTING','NEW YORK',7782,1),
(20,'TRAINING','DALLAS',7566,1),
(30,'SALES','CHICAGO',7698,1),
(40,'HR','BOSTON',7839,1);

SELECT * FROM tb_departamentos



INSERT INTO tb_grades_salarios(id_grade,
								limite_inferior,
								limite_superior,
								bonus,fg_ativo)
VALUES
(1,7000.00,12000.00,0,1),
(2,12001.00,14000.00,50,1),
(3,14001.00,20000.00,100,1),
(4,20001.00,30000.00,200,1),
(5,30001.00,99999.00,500,1);

SELECT * FROM tb_grades_salarios


INSERT INTO tb_cursos(id_curso,ds_curso,categoria,duracao,fg_ativo)
VALUES
('SQL','Introdução ao SQL','GEN',4,1),
('OAU','ORACLE para usuarios de aplicativos','GEN',1,1),
('JAV','Java para desenvolvedores Oracle','BLD',4,1),
('PLS','Introdução ao PL/SQL','BLD',1,1),
('XML','XML para desenvolvedores Oracle','BLD',2,1),
('ERM','Modelagemde Dados com DER','DSG',3,1),
('PMT','Técnicas de Modelagem de Processos','DSG',4,1),
('RSO','Modelagem de Sistema Relacional','DSG',2,1),
('PRO','Prototipagem','DSG',5,1),
('GEN','Implementação de Sistemas','DSG',4,1);

SELECT * FROM tb_cursos

