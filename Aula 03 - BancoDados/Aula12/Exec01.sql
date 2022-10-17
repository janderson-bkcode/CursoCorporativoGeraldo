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

