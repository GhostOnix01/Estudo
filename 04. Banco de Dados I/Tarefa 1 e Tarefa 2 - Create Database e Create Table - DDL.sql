
###########################TAREFA 1 ############################################
Create database Tarefa1Brasil
default character set utf8
default collate utf8_general_ci; ##Modo Brasileiro
use tarefa1;

Create database Tarefa1Suecia; #Modo Suecia


create table pessoas (
nome varchar (30),
idade int (2),
sexo char (1),
peso float (5),
altura float (5),
nacionalidade varchar (10)
);

describe pessoas;
Drop database Tarefa1; ##Serve para Fazer uma Exclusão de Banco de dados
Drop table pessoas; ##Serve para Fazer uma Exclusão de uma Tabela



###########################TAREFA 2 ############################################
#####ECONOMIA DE ESPAÇO - REDUNDANCIA NOS MESMO VALOR #####
Create database Tarefa2Brasil
default character set utf8
default collate utf8_general_ci; ##Modo Brasileiro
use tarefa2Brasil;

Create database Tarefa2Suecia; #Modo Suecia


create table pessoas (
id int NOT NULL auto_increment,
nome varchar (30) NOT NULL,
nascimento date,
sexo enum ('M','F'),
peso decimal (5,2),
altura decimal (3,2),
nacionalidade varchar (10) DEFAULT 'BRASIL',
Primary Key (id)
) default charset = utf8;

drop database tarefa2brasil;