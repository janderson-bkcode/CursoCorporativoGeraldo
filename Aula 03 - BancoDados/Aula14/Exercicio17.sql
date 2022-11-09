--09 11 2022 Exercicio 17 

USE Academico

--01
SELECT nm_empregado + ', ' + iniciais_empregado
FROM tb_empregados;

--02
SELECT nm_empregado ,
DATENAME(WEEKDAY,dt_nascimento) + ' , ' +
DATENAME(DAY,dt_nascimento)+ ' de ' +
DATENAME(MONTH,dt_nascimento) + ' de ' +
DATENAME(YEAR,dt_nascimento) AS dataNascimento
FROM tb_empregados;

--03

select DATEADD(y,10000,'14/06/1996')

--04
select DATENAME(WEEKDAY,DATEADD(y,10000,'14/06/1996')) AS DIADASEMANA

--05
SELECT COALESCE(c.id_curso,'SEM CURSO') as CodCurso, COALESCE(cf.dt_inicio,'SEM PREVISAO DE INICIO'),
c.duracao, COALESCE(e.nm_empregado,'sem instrutor') as Instrutor
FROM
tb_cursos_oferecidos cf 
INNER  JOIN tb_cursos c on (c.id_curso = cf.id_curso)
INNER JOIN tb_empregados e on (e.id_empregado = cf.id_instrutor)

--06
SELECT COALESCE(c.id_curso,'SEM CURSO') as CodCurso, COALESCE(cf.dt_inicio,'SEM PREVISAO DE INICIO'),
c.duracao, COALESCE(e.nm_empregado,'sem instrutor') as Instrutor
FROM
tb_cursos_oferecidos cf 
LEFT  JOIN tb_cursos c on (c.id_curso = cf.id_curso)
left JOIN tb_empregados e on (e.id_empregado = cf.id_instrutor)

--07
SELECT p.nm_empregado AS PARTICIPANTES, i.nm_empregado as INSTRUTOR
FROM tb_empregados i
INNER JOIN tb_cursos_oferecidos co on (co.id_instrutor = i.id_empregado)
INNER JOIN tb_matriculas m on (co.id_curso = m.id_curso AND co.dt_inicio = m.dt_inicio)
INNER JOIN tb_empregados p ON (m.id_participante = p.id_empregado)
WHERE m.id_curso = 'SQL';

--08
SELECT nm_empregado,iniciais_empregado,CAST(salario*12 as varchar) as SalarioAnual
FROM tb_empregados e
INNER JOIN tb_grades_salarios gs on(e.salario BETWEEN gs.limite_inferior AND gs.limite_superior)

--09
SELECT m.id_curso,m.dt_inicio,COUNT(m.id_participante) as "Quantidade de Participantes"
FROM tb_cursos_oferecidos cf
INNER JOIN tb_matriculas m on (cf.id_curso = m.id_curso and cf.dt_inicio = m.dt_inicio)
GROUP BY m.id_curso, m.dt_inicio
order by 3 desc

--10
SELECT m.id_curso,m.dt_inicio,COUNT(m.id_participante) as "Matricula"
FROM tb_cursos_oferecidos cf
INNER JOIN tb_matriculas m on (cf.id_curso = m.id_curso and cf.dt_inicio = m.dt_inicio)
WHERE m.dt_inicio between '01/01/1999' and	'31/12/1999'
GROUP BY m.id_curso, m.dt_inicio
HAVING(COUNT(m.id_participante)) >=3

--11
SELECT id_instrutor
FROM tb_cursos_oferecidos
WHERE id_instrutor IS NOT NULL
EXCEPT
SELECT id_participante
FROM tb_matriculas;

--12




