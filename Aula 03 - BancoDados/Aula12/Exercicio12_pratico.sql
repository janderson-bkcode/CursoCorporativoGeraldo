-- MÓDULO BANCO DE DADOS INTERMEDIÁRIO
-- JANDERSON BARBOSA GONÇALVES

--02
use master

Create Database EXERCICIO_12

use EXERCICIO_12

CREATE TABLE tb_funcao (
id_funcao VARCHAR(10),
ds_funcao VARCHAR(35),
base_salario DECIMAL(7,2),
teto_salario DECIMAL(7,2)
CONSTRAINT pk_tb_funcao_id_funcao PRIMARY KEY(id_funcao)
);

CREATE TABLE tb_pais(
 id_pais CHAR(2) ,
 nm_pais VARCHAR(40),
 CONSTRAINT pk_tb_pais_id_pais PRIMARY KEY(id_pais)
);


CREATE TABLE tb_localizacao(
id_localizacao iNT,
id_pais        CHAR(2) CONSTRAINT nn_tb_localizacao_id_pais NOT NULL,
endereco	   VARCHAR(40) ,
cep			   VARCHAR(12),
cidade		   VARCHAR(30),
estado         VARCHAR(25),

CONSTRAINT pk_tb_localizacao_id_localizacao PRIMARY KEY(id_localizacao),
CONSTRAINT fk_tb_localizacao_id_pais FOREIGN KEY(id_pais)
	REFERENCES tb_pais(id_pais)
);

CREATE TABLE tb_departamento(
id_departamento INT,
id_localizacao  INT CONSTRAINT nn_tb_departamento_id_localizacao NOT NULL,
nm_departamento VARCHAR(30)

CONSTRAINT pk_tb_departamento_id_departamento PRIMARY KEY (id_departamento),
CONSTRAINT fk_tb_departamento_id_localizacaO  FOREIGN KEY (id_localizacao)
	REFERENCES tb_localizacao(id_localizacao)
);

CREATE TABLE tb_empregado(
id_empregado        INT,
id_funcao           VARCHAR(10) CONSTRAINT nn_tb_empregado_id_funcao       NOT NULL,
id_gerente          INT,
id_departamento     INT CONSTRAINT nn_tb_empregado_id_departamento NOT NULL,
nome			    VARCHAR(20),
sobrenome		    VARCHAR(25),
email			    VARCHAR(25),
telefone		    VARCHAR(20),
data_admissao	    DATE,
percentual_comissao DECIMAL(5,2),
salario				DECIMAL(7,2)


CONSTRAINT pk_tb_empregado_id_empregado PRIMARY KEY (id_empregado),
CONSTRAINT fk_tb_empregado_id_gerente FOREIGN KEY (id_gerente)
	REFERENCES tb_empregado(id_empregado),
CONSTRAINT fk_tb_empregado_id_funcao FOREIGN KEY(id_funcao)
	REFERENCES tb_funcao(id_funcao),
CONSTRAINT fk_id_tb_empregado_id_departamento FOREIGN KEY(id_departamento)
	REFERENCES tb_departamento(id_departamento)
);


select * from tb_empregado

--03
INSERT INTO tb_funcao(id_funcao,ds_funcao,base_salario,teto_salario)
VALUES
('AD_ASST','Assistente Administrativo',3000.33,6000.66),
('AD_PRED','Presidente',20000.22,40000.44),
('AD_VP','Vice Presidente Adminstrativo',15000.15,30000.33),
('FI_MGR','Gerente Financeiro',8200.88,16000.16),
('IT_PROG','Programador',4000.44,10000.11);

SELECT * FROM tb_funcao

INSERT INTO tb_pais(id_pais,nm_pais)
VALUES('BR','Brasil'),
('CA','Canadá'),
('IT','Itália'),
('JP','Japão'),
('US','EUA');

Select * from tb_pais

INSERT INTO tb_localizacao(id_localizacao,id_pais,endereco,cep,cidade,estado)
VALUES
(1000,'IT','Vila Cola di Rie ,1297','00989','Roma',NULL),
(1100,'IT','Calle della Testa ,93091','10934','Veneza',NULL),
(1200,'JP','Shinjuku-ku, 2017','1689','Tóquio','Prefeitura de Tóquio'),
(1300,'JP','Kamiya-cho , 9450','6823','Hiroshima',NULL),
(2800,'BR','Rua Frei Caneca 1360 ','01307-002','São Paulo','São Paulo');

SELECT * FROM tb_localizacao

INSERT INTO tb_departamento(id_departamento,id_localizacao,nm_departamento)
VALUES
(10,1000,'Administração'),
(20,1100,'Marketing'),
(40,1200,'Recursos Humanos'),
(60,1300,'TI'),
(210,2800,'Suporte de TI');

SELECT * from tb_departamento


INSERT INTO tb_empregado(id_empregado,id_gerente,id_departamento,id_funcao,nome,sobrenome,email,telefone,data_admissao,percentual_comissao,salario)
VALUES
(100,NULL,10,'AD_PRED','Steven','King','steven@empresa.com','5151223459','1987-06-17',NULL,2400.99),
(101,100, 20,'AD_VP',  'Neena', 'Kochhar','neena@empresa.com','51512 34568','1989-09-21',NULL,17000.78),
(102,100, 40,'AD_VP',  'Lex','De Haan','lex@empresa.com','51512 34569','1993-01-13',NULL,17000.85),
(103,102, 60,'IT_PROG','Alexander','Hunold','Alexander@empresa.com','59042 34567','1990-01-03',0.25,9000.55),
(104,103, 210,'IT_PROG','Bruce','Ernst','bruce@empresa.com','59042 34568','1991-05-21',0.10,6000.35);

--04

SELECT e.nome,e.data_admissao
from tb_empregado e
INNER JOIN tb_funcao f on(f.id_funcao = e.id_funcao)
WHERE e.data_admissao Between '20-02-1987' and '01-05-1989'
ORDER BY 2;

--05
SELECT UPPER(e.nome), LEN(e.sobrenome),d.nm_departamento,p.nm_pais
FROM tb_empregado e
INNER JOIN tb_departamento d ON (d.id_departamento = e.id_departamento)
INNER JOIN tb_localizacao l on (l.id_localizacao = d.id_localizacao)
INNER JOIN tb_pais p ON (p.id_pais = l.id_pais)
WHERE e.nome IN (SELECT nome
				FROM tb_empregado
				WHERE nome LIKE 'B%' or nome LIKE 'L%' OR nome LIKE 'A%')
--06
SELECT e.nome,d.nm_departamento,l.cidade,COALESCE(l.estado,'Estado Não registrado')
FROM tb_empregado e
INNER JOIN tb_departamento d ON (d.id_departamento = e.id_departamento)
INNER JOIN tb_localizacao l on (l.id_localizacao = d.id_localizacao)
WHERE e.percentual_comissao IS NOT NULL OR  e.percentual_comissao !=0

--07
SELECT e.nome + 'Trabalha para o '+ COALESCE(g.nome,'Acionistas')
FROM tb_empregado e
LEFT JOIN tb_empregado g ON (e.id_gerente = g.id_empregado)


--08
SELECT nome + ' ' + 'Recebe' + ' '+ CAST(salario as VARCHAR)+ ' ' + 'Mas Deseja'+ ' ' + CAST((salario * 3)as VARCHAR)as "Salario dos Sonhos"
FROM tb_empregado
ORDER BY salario

--09
SELECT nome
FROM tb_empregado
WHERE id_departamento = 60
OR id_gerente = 102
ANd nome LIKE '%ee%'