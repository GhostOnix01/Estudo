create table if not exists cursos (
nome varchar (30) NOT NULL UNIQUE,
descricao text,
carga int unsigned,
totaulas int unsigned,
ano year DEFAULT '2016'
) DEFAULT CHARSET = utf8;

Alter table cursos
add column idcurso int first;

Alter table cursospessoas1
Add Primary Key (idcurso);

desc cursos;