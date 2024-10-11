desc pessoas;
Alter table pessoas
add column profissao varchar (20) after nome; ##DEPOIS DO NOME

Alter table pessoas
add column profissao varchar (10) first; ##DEPOIS DO NOME

select * from pessoas; #MOSTRA TODOS CADAsTRADO

Alter table pessoas #ELIMINA COLUNA
drop column profissao;

Alter table pessoas
change column profissao prof varchar(20); ##ALTERA NOME

Alter table pessoas
rename to pessoas1; ##RENOMEAR NOME DA TABELA

desc pessoas1; #VISUALIZAR TABELA

Alter table pessoas
modify column profissao varchar(20) not null default ''; # ATRIBUI VALOR VAZIO



