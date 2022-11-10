--EXERCICIO 14

use EXERCICIO_12
--01
SELECT id_empregado, nome,
CAST(salario * 12 as numeric)  as "SALARIO ANUAL"
FROM tb_empregado;

--02
SELECT id_funcao, nome,data_admissao
FROM tb_empregado 

--03
SELECT DISTINCT id_funcao
FROM tb_empregado

--04
SELECT e.nome + ', ' + f.ds_funcao as "Empregado e função"
FROM tb_empregado e 
INNER JOIN tb_funcao f on (f.id_funcao = e.id_funcao)

--05
SELECT CAST(id_empregado AS varchar) + ',' + CAST(id_funcao AS varchar) + ','+  COALESCE(CAST(id_gerente AS varchar),'sem gerente')+ ',' + CAST(id_departamento AS varchar) + ','+
nome + ',' + sobrenome + ',' + email + ',' +  telefone  + ',' + CAST(data_admissao AS varchar) + coalesce(CAST(percentual_comissao AS nvarchar),'Sem comissão')+
',' + cast(salario as varchar)
FROM tb_empregado

--06
SELECT nome, salario
FROM tb_empregado 
WHERE salario >2850.00

--07
SELECT nome,id_departamento
FROM tb_empregado
where id_empregado = 141

--08
SELECT nome, salario
FROM tb_empregado
WHERE salario NOT BETWEEN 1500 AND 2850.00

--09
SELECT nome,salario,data_admissao
FROM tb_empregado
WHERE data_admissao BETWEEN '20/02/1987' AND '01/05/1989'
ORDER BY data_admissao ASC;


--10
SELECT nome,id_departamento
FROM tb_empregado
Where id_departamento in(10,30)
order by nome

--11
SELECT nome AS Funcionario ,salario as "Salario Mensal"
FROM tb_empregado
Where salario > 1500
and id_departamento in (10,30)

--12
SELECT nome,data_admissao
FROM tb_empregado
WHERE data_admissao Between '01/01/1987' and  '31/12/1987'

--13
SELECT nome,salario
FROM tb_empregado
Where id_gerente IS  NULL

--14
SELECT nome,salario,percentual_comissao
FROM tb_empregado
wHERE percentual_comissao is not null 
Order by salario, percentual_comissao DESC

--15
SELECT nome
FROM tb_empregado
WHERE nome  like '__a'

--16
SELECT nome
FROM tb_empregado
WHERE nome like '%ll%'
and id_departamento = 30
and id_gerente =108

--17
SELECT nome,salario, CAST(salario * 1.15 as varchar) as "Novo Salario"
FROM tb_empregado

--18
SELECT nome,salario, CAST((salario * 1.15) - salario as varchar) as "Aumento"
FROM tb_empregado

--19
SELECT nome,COALESCE(Cast(percentual_comissao as varchar),'Nenhuma Comissão') as "COMISSÃO"
FROM tb_empregado

--20
SELECT e.nome, e.id_departamento, d.nm_departamento
FROM tb_empregado e
INNER JOIN tb_departamento d ON(d.id_departamento = e.id_departamento)

--21
SELECT d.id_departamento , l.cidade, f.id_funcao,ds_funcao
FROM tb_empregado e 
INNER JOIN tb_funcao f ON (e.id_funcao = f.id_funcao)
INNER JOIN tb_departamento d ON(e.id_departamento = d.id_departamento)
INNER JOIN tb_localizacao l on (l.id_localizacao = d.id_localizacao)
Where d.id_departamento = 30

--22
SELECT e.nome , d.nm_departamento, l.cidade,l.estado
FROM tb_empregado e 
INNER JOIN tb_funcao f ON (e.id_funcao = f.id_funcao)
INNER JOIN tb_departamento d ON(e.id_departamento = d.id_departamento)
INNER JOIN tb_localizacao l on (l.id_localizacao = d.id_localizacao)
Where e.percentual_comissao IS NOT NULL
