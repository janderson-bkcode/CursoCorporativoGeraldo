
-- EXERCICIO 01
SELECT  nome||' '||sobrenome||
COALESCE(CAST(percentual_comissao as varchar),' Nenhuma Comissão ') AS "COMISSÃO"
FROM tb_empregado;

--EXERCICIO 02

SELECT e.nome "Empregado", e.dt_admissao " data de admissão do Empregado",
  g.nome "Gerente", g.dt_admissao "Data de admissão do Gerente"
  FROM tb_empregado e, tb_empregado g
  WHERE e.id_gerente = g.id_empregado
  AND e.dt_admissao < g.dt_admissao;

--EXERCICIO 03
SELECT ROUND(AVG(salario)) as "Média",ROUND(MAX(salario)) as "Máximo",
ROUND(MIN(salario)) as "Minimo",ROUND(SUM(salario)) as "Somatório"
FROM tb_empregado;

--EXERCICIO 04
SELECT g.id_gerente  as "Gerente", MIN(f.salario) as "Salario empregado"
FROM tb_departamento g , tb_empregado f
WHERE g.id_gerente = f.id_gerente
AND f.salario >= 1000
GROUP BY g.id_gerente , f.salario
ORDER BY f.salario DESC;

--EXERCICIO 05
SELECT COUNT(*) TOTAL_DE_FUNCIONARIOS,
(SELECT COUNT(*) FROM tb_empregado WHERE data_admissao = '1990') 
    ADMITIDOS_1990,
(SELECT COUNT(*) FROM tb_empregado WHERE data_admissao = '1991'
    ADMITIDOS_1991,
(SELECT COUNT(*) FROM tb_empregado WHERE data_admissao '1992') 
    ADMITIDOS_1992,
(SELECT COUNT(*) FROM tb_empregado WHERE data_admissao = '1993') 
    ADMITIDOS_1993
FROM tb_empregado
GROUP BY CUBE(id_empregado)
HAVING COUNT(id_empregado) > 1;


--EXERCICIO 06 ALTERNATIVA USANDO O  CASE SIMPLES
SELECT id_empregado, id_funcao DESCRICAO_FUNCAO,
CASE id_funcao
	WHEN 'SH_CLERK' THEN 'A'
	WHEN 'ST_MAN' THEN 'B'
	WHEN 'AC_ACCOUNT' THEN 'C'
	WHEN 'AC_MGR' THEN 'D'
	WHEN 'IT_PROG' THEN 'E'
	ELSE '0'
END	AS "CLASSE"

FROM tb_empregado;

--EXERCICIO 06 ALTERNATIVA USANDO CASE COM EXPRESSÃO PESQUISADA
SELECT id_empregado, id_funcao DESCRICAO_FUNCAO,
CASE 
	WHEN id_funcao ='SH_CLERK' THEN 'A'
	WHEN id_funcao ='ST_MAN' THEN 'B'
	WHEN id_funcao ='AC_ACCOUNT' THEN 'C'
	WHEN id_funcao ='AC_MGR' THEN 'D'
	WHEN id_funcao ='IT_PROG' THEN 'E'
	ELSE '0'
END  AS "CLASSE"

FROM tb_empregado;



--EXERCICIO 07
SELECT nome ,DATEDIFF(MONTH,SYSDATE,data_admissao)
as "Meses Trabalhados"
FROM tb_empregado
ORDER BY"Meses Trabalhados";


--EXERCICIO 08
CREATE TABLE #tbDepartamento2(
id int,
nm_depto VARCHAR(25)
);

INSERT INTO #tbDepartamento2
	SELECT id_departamento,nm_departamento
	from tb_departamento


--EXERCICIO 09
SELECT id_empregado,nome,salario, CAST(salario * 1.15 as varchar) as "Novo Salario"
FROM tb_empregado


--EXERCICIO 10
SELECT nm_empregado, dt_admissao,
 CAST(DATENAME(DAY,DATEADD(M,6,dt_admissao))as varchar) REVISÃO
 FROM tb_empregado;







