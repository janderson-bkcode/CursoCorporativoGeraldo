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



CREATE TABLE tb_pessoas(

codigo int not null unique ,
nome varchar(max),
CONSTRAINT pk_tb_pessoas_codigo PRIMARY KEY(codigo)
);


CREATE TABLE tb_carteiraMotorista(

 numero integer not null ,
 dataExpedicao dateTime,
 validade datetime,
 categoria varchar(2),
 codigo int Constraint unique_tb_carteiraMotorista_codigo unique not null ,
 dataRetirada datetime,

 CONSTRAINT pk_tb_carteiraMotorista PRIMARY KEY(numero),
 CONSTRAINT fk_tb_carteiraMotorista_codigo FOREIGN KEY (codigo) REFERENCES tb_pessoas(codigo)
);


CREATE TABLE tb_homens(
	rg Integer ,
	nome varchar(60),
	CONSTRAINT pk_tb_homens_rg PRIMARY KEY(rg)
);

CREATE TABLE tb_mulher(
	rg Integer,
	nome varchar(60),
	CONSTRAINT pk_tb_mulher_rg PRIMARY KEY(rg)
);

CREATE TABLE tb_Casamento(

 rg_homem integer ,
 rg_mulher integer constraint nn_tb_Casamento_rgMulher not null unique,
 data_casamento date,
 
 CONSTRAINT pk_tb_Casamento_rgHomen PRIMARY KEY(rg_homem),
 CONSTRAINT fk_tb_Casamento_rgHomen FOREIGN KEY(rg_homem) REFERENCES tb_homens(rg),
 CONSTRAINT fk_tb_casamento_rgMulher FOREIGN KEY (rg_mulher) REFERENCES tb_mulher(rg)
);


----------
CREATE TABLE tb_departamentos(
codigoDpto int ,
nomeDpto varchar(60),

CONSTRAINT pk_tb_departamentos PRIMARY KEY (codigoDpto)

);

CREATE TABLE tb_Empregado2(

cpf int,
nome varchar(60),
codDpto int CONSTRAINT nn_tb_empregados_codDpto NOT NULL,
dataLocacao date,

CONSTRAINT pk_tb_empregados_cpf PRIMARY KEY(cpf),
CONSTRAINT fk_tb_empregados_codDpto FOREIGN KEY(codDpto) 
	REFERENCES tb_departamentos(codigoDpto)
);
---------
CREATE TABLE tb_pessoas2(
rg int,
nome varchar(60),

CONSTRAINT pk_tb_empregados_rg PRIMARY KEY (rg)

);

CREATE TABLE tb_Automoveis(

chassi varchar(17),
modelo varchar(60),
ano date,

CONSTRAINT pk_tb_automoveis_chassi PRIMARY KEY(chassi),
);

CREATE TABLE tb_posse(
rg int,
chassi varchar(17),
dataCompra date,
CONSTRAINT pk_tb_posse_chassi PRIMARY KEY(chassi),
CONSTRAINT fk_tb_posse_chassi FOREIGN KEY(chassi) REFERENCES tb_automoveis(chassi),
CONSTRAINT fk_Tb_posse_rg FOREIGN KEY(rg) REFERENCES tb_pessoas2(rg)
);

------
CREATE TABLE tb_empregados3(
rg int,
nome varchar(60),

CONSTRAINT pk_tb_empregados3_rg PRIMARY KEY(rg)

);

CREATE TABLE tb_projetos(
cod int,
nome varchar(60),

CONSTRAINT pk_tb_projetos_cod PRIMARY KEY (cod)

);

CREATE TABLE tb_Participacao(
rg int ,
cod int,
dataInicio date,

CONSTRAINT pk_tbParticipacao_rg_cod PRIMARY KEY(rg,cod),
CONSTRAINT fk_tb_partipacao_rg FOREIGN KEY (rg) REFERENCES tb_empregados3(rg),
CONSTRAINT fk_tb_participacao_cod FOREIGN KEY (cod) REFERENCES tb_projetos(cod)
);

--------
CREATE TABLE tb_empregados4(
rg varchar(11),
nome varchar(60),
idade int,
rg_gerente varchar(11),

CONSTRAINT pk_tbEmpregados4_rg PRIMARY KEY (rg),
CONSTRAINT fk_tbEmpregados4_rg FOREIGN KEY (rg_gerente)
	REFERENCES tb_empregados4(rg)
);

CREATE TABLE tb_clientes(
rg varchar(11),
nome varchar(255),

CONSTRAINT pk_tb_clientes_rg PRIMARY KEY(rg)

);

CREATE TABLE tb_contas(
numero int,
tipo varchar(60)

CONSTRAINT pk_tb_contas_numero PRIMARY KEY(numero)

);

CREATE TABLE tb_correntistas(
rg varchar(11),
numero int,
CONSTRAINT pk_tb_correntistas_rgNumero PRIMARY KEY (rg,numero),
CONSTRAINT fk_tb_correntitas_rg FOREIGN KEY(rg) REFERENCES tb_clientes(rg),
CONSTRAINT fk_tb_correntistas_numero FOREIGN KEY (numero) REFERENCES tb_contas(numero)

);

CREATE TABLE tb_cartoesMagnneticos(

numero int,
dataexp date,
rg varchar(11),
nroConta int,

CONSTRAINT pk_tb_cartoesMagneticos_numero PRIMARY KEY (numero ),
CONSTRAINT fk_tb_cartoesMagneticos_rg FOREIGN KEY(rg) REFERENCES tb_clientes(rg),
CONSTRAINT fk_tb_cartoesMagneticos_nroConta FOREIGN KEY(nroConta) REFERENCES tb_contas(numero)
);

INSERT INTO tb_empregados4(rg,nome,idade,rg_gerente)
Values 
('1','janderson',25,null), 
('2','Antonio',20,'1'),
('3','Arthur',30,'2'),
('4','Fernando',24,'3'),
('5','Pedro',24,'2'),
('6','Gustavo',24,'4');


SELECT *
	FROM tb_empregados4;

SELECT e.nome + 'Trabalha para ' + g.nome
FROM tb_empregados4 e
INNER JOIN tb_empregados4 g ON(e.rg_gerente = g.rg)


SELECT e.nome + 'Trabalha para ' + COALESCE( g.nome,'Acionistas')
FROM tb_empregados4 e
LEFT OUTER JOIN tb_empregados4 g ON(e.rg_gerente = g.rg) 


-----
CREATE TABLE tb_instituicoes(

sigla varchar(6)

CONSTRAINT pk_tb_instituicoes PRIMARY KEY(sigla)
);

CREATE TABLE tb_Projetos2(
numero int,

CONSTRAINT pk_tb_projetos2 PRIMARY KEY(numero)
);

CREATE TABLE tb_pesquisadores(
rg varchar(11) PRIMARY KEY
);


CREATE TABLE tb_Pesquisas(
sigla varchar(6),
numero int,
rg varchar(11),
dataInicio date,

CONSTRAINT pk_tbPesquisa_sigla_numero_rg 
	PRIMARY KEY (sigla,numero,rg),
CONSTRAINT fk_tbPesquisa_sigla FOREIGN KEY (sigla) 
	REFERENCES tb_instituicoes(sigla),
CONSTRAINT fk_tbPesquisa_numero FOREIGN KEY(numero) 
	REFERENCES tb_Projetos2(numero),
CONSTRAINT fk_tb_pesquisadores FOREIGN KEY(rg) 
	REFERENCES tb_pesquisadores(rg)
);
---------------------------------------------------

CREATE TABLE tb_Produtos(

codProduto int,
descProduto varchar(60),
CONSTRAINT pk_tbProdutos PRIMARY KEY(codProduto)
);

CREATE TABLE tb_Cidades(
codigo int,
nomeCidade varchar(60),
CONSTRAINT pk_tbCidades_cod PRIMARY KEY(codigo)
);

CREATE TABLE tb_Distribuidores(

rg varchar(11)
CONSTRAINT pk_tbDist_rg PRIMARY KEY(rg)

);

CREATE TABLE distribuicao(
codProduto int,
codigoCidade int,
rgDistribuidor varchar(11)

CONSTRAINT pk_tbDistribuicao_codCidDist PRIMARY KEY(codProduto,codigoCidade)
CONSTRAINT fk_tbDistribuicao_codProd FOREIGN KEY(codProduto) REFERENCES tb_Produtos(codProduto),
CONSTRAINT fk_tbDistribuicao_codCidade FOREIGN KEY(codigocidade) REFERENCES tb_Cidades(codigo),
CONSTRAINT fk_tbDistribuicao_rg FOREIGN KEY (rgDistribuidor) REFERENCES  tb_Distribuidores(rg)
);

-------------

CREATE TABLE tb_Bairro (
cod int,
nome varchar,

CONSTRAINT pk_tbBairro_cod PRIMARY KEY(cod)

);


CREATE TABLE tb_carteiros(
rg varchar(11)
CONSTRAINT pk_tbCarteiros_rg PRIMARY KEY(rg)
);


CREATE TABLE tb_correspondencias(

codigo int ,
peso numeric,
codBairro int not null,
rg varchar(11)not null,

CONSTRAINT pk_tbCorre_COD PRIMARY KEY (codigo),
CONSTRAINT fk_tbCorre_codBairro FOREIGN KEY(codBairro) REFERENCES tb_Bairro(cod),
CONSTRAINT fk_tbCorre_rg FOREIGN KEY(rg) REFERENCES tb_carteiros(rg)
);

