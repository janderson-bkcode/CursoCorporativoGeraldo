CREATE DATABASE Exercicio_13

USE Exercicio_13

CREATE TABLE tb_homem(
id_homem int,
nome_homem varchar(50),
id_mulher int,

CONSTRAINT pk_tbHomenIdHomem PRIMARY KEY(id_homem),
CONSTRAINT fk_tbHomem_idMulher FOREIGN KEY (id_mulher)
	REFERENCES tb_mulher(id_mulher)

);


CREATE TABLE tb_mulher(
id_mulher int ,
Nome_mulher VARCHAR(50),
CONSTRAINT pk_tb_mulher_idMulher PRIMARY KEY(id_mulher)
);

INSERT INTO tb_mulher(id_mulher,Nome_mulher)
values
(1,'Edna'),
(2,'Stefanny'),
(3,'Cássia')

INSERT INTO tb_homem(id_homem,nome_homem,id_mulher)
VALUES
(10,'Anderson',null),
(20,'Jander',1),
(30,'Rogério',2)

-- 3 a
SELECT h.nome_homem + ' É casado com a ' + m.Nome_mulher AS Casamento
from 
tb_homem h, tb_mulher m where (m.id_mulher = h.id_mulher)

-- 3 b
SELECT *
FROM tb_homem
NATURAL JOIN tb_mulher;


--3C
SELECT * from tb_homem h join tb_mulher m using(id_mulher)
-- 3D
SELECT h.nome_homem + ' É casado com a ' + m.Nome_mulher AS Casamento
from 
tb_homem h
join tb_mulher m on (m.id_mulher = h.id_mulher)

-- 3E
SELECT h.nome_homem + ' É casado com a ' + m.Nome_mulher AS Casamento
from 
tb_homem h
CROSS JOIN tb_mulher m


--4
