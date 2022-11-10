USE EXERCICIO_12

--01
SELECT e.nome + 'Trabalha para ' + d.nm_departamento + ' Localizado na cidade: ' + l.cidade +
', Estado: ' + COALESCE(l.estado,'Sem Estado Cadastrado') + ', País: ' + p.nm_pais AS "Informação dos Empregados"
FROM tb_empregado e 
INNER JOIN tb_departamento d ON (e.id_departamento = d.id_departamento)
INNER JOIN tb_localizacao l ON (l.id_localizacao = d.id_localizacao)
INNER JOIN tb_pais p on (p.id_pais = l.id_pais)
ORDER BY 1 asc;

--02
SELECT nome + ' ' +  sobrenome  as "NOME COMPLETO DO EMPREGADO"
FROM tb_empregado 
WHERE LOWER(nome) LIKE '%e_____e%'
and id_departamento = 80 or id_gerente = 148

--03
SELECT COALESCE(g.nome,'Acionistas') + ' Gerencia ' + e.nome as resultado
FROM tb_empregado e
LEFT JOIN tb_empregado g ON(e.id_gerente = g.id_empregado)
ORDER BY g.nome desc

--04
SELECT sobrenome , DATEDIFF(dd,GETDATE(),DAY(data_admissao)) AS DIASTRABALHADOS
FROM tb_empregado
where id_departamento = 80
AND DATEDIFF(dd,GETDATE(),DAY(data_admissao)) >5000;



