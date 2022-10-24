use Academico

select id_curso,ds_curso
from tb_cursos
where duracao = 4;


Select *
from tb_empregados 
order by ds_cargo ,dt_nascimento desc;

Select c.ds_curso as "Nome do Curso", co.localizacao as "Localização do curso"
from tb_cursos_oferecidos co
join tb_cursos c on(c.id_curso = co.id_curso)
where localizacao in ('SEATTLE','CHICAGO')


Select e.id_empregado
from tb_empregados e
join tb_matriculas m on (m.id_participante = e.id_empregado)
where m.id_curso = 'JAV'
and id_participante in (select id_participante from tb_matriculas
					    where id_curso = 'XML')

Select 
	e.nm_empregado
from tb_empregados e
where not(nm_empregado = 'JONES' AND iniciais_empregado = 'R')


select nm_empregado,iniciais_empregado
from tb_empregados
where nm_empregado <> 'JONES' OR iniciais_empregado<>'R';


select e.ds_cargo, e.id_empregado,e.dt_nascimento
from tb_empregados e
inner JOIN tb_cursos_oferecidos co on(co.id_instrutor = e.id_empregado) 
WHERE e.ds_cargo in ('TRAINER','SALESREP')
AND dt_nascimento < '01-01-1960'


SELECT id_empregado
FROM tb_empregados e
inner join tb_departamentos d on (d.id_departamento = e.id_departamento)
where nm_departamento !='TRAINING'



Select id_empregado
from tb_empregados 
Where id_empregado not in (select id_participante 
							from tb_matriculas
							where id_curso = 'JAV')

select id_empregado
from tb_empregados
where id_empregado in(select id_participante
						from tb_matriculas
						where id_curso !='JAV')

-- Trazendo empregado com subordinados EXEC 11
select id_empregado,nm_empregado,iniciais_empregado
from tb_empregados
where id_empregado in(  select id_gerente
						from tb_empregados
						where id_gerente IS NOT NULL)

-- Trazendo empregado sem subordinados  EXEC 11
select id_empregado,nm_empregado,iniciais_empregado
from   tb_empregados
where  id_empregado not in (select id_gerente
						from tb_empregados
						where id_gerente IS NOT NULL)


select c.categoria
from tb_cursos_oferecidos co
INNER JOIN tb_cursos c on(co.id_curso = c.id_curso)
where c.categoria = 'GEN'
AND co.dt_inicio between '01/01/1999' and '31/12/1999'

-- EXEC 12

select iniciais_empregado, nm_empregado
from tb_empregados
where id_empregado in (SELECT id_participante
						from tb_matriculas
						where id_curso in (SELECT id_curso
												from tb_cursos_oferecidos
													where id_instrutor in (select id_empregado
																			from tb_empregados
																			where nm_empregado = 'SMITH' AND iniciais_empregado = 'N')))

-- ALTERNATIVA COM JOIN PRECISA USAR DISTINCT
SELECT DISTINCT iniciais_empregado,nm_empregado
from tb_empregados e
join tb_matriculas m on (e.id_empregado = m.id_participante)
where m.id_curso in (select id_curso
					 from tb_cursos_oferecidos
					 where id_instrutor in (select e.id_empregado
											 from  tb_empregados
											 where  nm_empregado = 'SMITH' and iniciais_empregado = 'N'))



--EXEC 13
select id_empregado, comissao into tb_comissao_empregados
FROM tb_empregados
WHERE comissao IS NOT NULL

SELECT * from tb_comissao_empregados

ALTER TABLE tb_empregados
 ALTER COLUMN comissao float(8) NOT NULL
