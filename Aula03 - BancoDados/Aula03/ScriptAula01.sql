CREATE DATABASE "AULA_03_08_22";


CREATE TABLE tb_curso(
cod_curso INT NOT NULL CONSTRAINT pk_tb_curso_cod_curso PRIMARY KEY,
nm_curso VARCHAR(40) NOT NULL
);

INSERT INTO tb_curso(cod_curso,nm_curso)
values
(1,'Ciência da Computação'),
(2,'Analise e desenvolvimento de Sistemas'),
(3,'Gestão de Negocios e Inovação'),
(4,'Sistemas Biomédicos')



CREATE TABLE tb_departamento(
cod_departamento INTEGER,
nm_deparamento VARCHAR(60),
CONSTRAINT pk_tb_departamento_cod_departamento PRIMARY KEY(cod_departamento)
);

INSERT INTO tb_departamento(cod_departamento,nm_deparamento)
VALUES(10,'Medicina'),(15,'Administração'),(20,'Computação');


CREATE TABLE tb_disciplina(
cod_disciplina INTEGER,
cod_departamento INTEGER CONSTRAINT nn_tb_disciplina_cod_dpto not null,
nm_disciplina VARCHAR(40),
creditos INT

CONSTRAINT pk_tb_disciplina_cod_disciplina 
	PRIMARY KEY(cod_disciplina)
CONSTRAINT fk_tb_disciplina_cod_departamento 
	FOREIGN KEY (cod_departamento)
	REFERENCES tb_departamento(cod_departamento)
);

insert into tb_disciplina(cod_disciplina,cod_departamento,nm_disciplina,creditos)
VALUES(1,20,'BANCO DE DADOS I',80),
(2,20,'BANCO DE DADOS I',80),
(3,20,'Estrutura de dados II',80),
(3,15,'Gestão de Pessoas',80);

CREATE TABLE tb_aluno(
cod_aluno INT NOT NULL CONSTRAINT pk_tb_aluno_cod_aluno PRIMARY KEY,
cod_curso INT  CONSTRAINT nn_cod_curso NOT NULL,
nm_aluno VARCHAR NOT NULL
CONSTRAINT fk_tb_aluno_cod_curso 
	FOREIGN KEY(cod_curso)
	REFERENCES tb_curso(cod_curso)
);


CREATE TABLE tb_disciplina_curso(
cod_curso INTEGER,
cod_disciplina INTEGER,
CONSTRAINT pk_tb_disciplina_curso_cod_curso_cod_disciplina PRIMARY KEY(cod_curso,cod_disciplina),
CONSTRAINT fk_tb_disciplina_cod_curso FOREIGN KEY(cod_curso) REFERENCES tb_curso(cod_curso),
CONSTRAINT fk_tb_disciplina_cod_disciplina FOREIGN KEY(cod_disciplina) REFERENCES tb_disciplina(cod_disciplina)
);

INSERT INTO tb_disciplina_curso(cod_curso,cod_disciplina)
VALUES(1,1),(1,2),(2,3),(3,4);



CREATE TABLE tb_disciplina_pre_requisito(
cod_disciplina_liberada INTEGER,
cod_disciplina_liberadora INTEGER,
CONSTRAINT pk_cod_disciplina_liberda_cod_liberadora PRIMARY KEY(cod_disciplina_liberada,cod_disciplina_liberadora),
CONSTRAINT fk_cod_disciplina_liberada FOREIGN KEY(cod_disciplina_liberada) REFERENCES tb_disciplina(cod_disciplina),
CONSTRAINT fk_cod_disciplina_liberadora FOREIGN KEY(cod_disciplina_liberada) REFERENCES tb_disciplina(cod_disciplina)

);


CREATE TABLE tb_empregados(
rg varchar(11),
nome varchar(60),
idade INTEGER,
CONSTRAINT pk_tb_empregados_rg PRIMARY KEY(rg)
);

CREATE TABLE tb_pedidos(
numero int ,
ds_pedido varchar(100),
data_pedido DATE,
CONSTRAINT pk_tb_pedido_numero PRIMARY KEY(numero)
);

CREATE TABLE tb_itens(

NroPedido INTEGER,
NroItem INTEGER,
produto varchar(60),
quantidade integer,
CONSTRAINT pk_tb_itens_nroPedido_NroItem PRIMARY KEY(NroPedido,NroItem),
CONSTRAINT fk_tb_itens_nroPedido FOREIGN KEY(NroPedido) REFERENCES tb_pedidos(numero)
);

CREATE TABLE tb_empregadoss(
rg integer,
nome varchar(200),
idade int,
planoSaude varchar(250),
rua varchar,
numero int,
cidade varchar,
CONSTRAINT pk_tb_emp_rg PRIMARY KEY(rg)
);

CREATE TABLE tb_telefone(
rg integer,
numero integer constraint nn_tbtelefone_numero not null,
CONSTRAINT pk_tb_telefone_rg_numero PRIMARY KEY(rg,numero),
CONSTRAINT fk_tb_telefone_rg FOREIGN KEY(rg) REFERENCES tb_empregadoss(rg)
);

CREATE TABLE tb_servidores(

cpf varchar(11) ,
nome varchar(max)

CONSTRAINT pk_tb_serv_cpf primary key(cpf)
);

CREATE TABLE tb_funcionarios(
cpf varchar(11),
funcao varchar(max),

CONSTRAINT pk_tb_func_cpf PRIMARY KEY(cpf),
CONSTRAINT fk_tb_func_cpf FOREIGN KEY (cpf) REFERENCES tb_funcionarios(cpf)
);

CREATE TABLE tb_professores(
cpf varchar(11),
titulacao varchar(max),
categoria varchar(max),

CONSTRAINT pk_tb_prof_cpf PRIMARY KEY(cpf),
CONSTRAINT fk_tb_prof_cpf FOREIGN KEY (cpf) REFERENCES tb_servidores(cpf)

);











