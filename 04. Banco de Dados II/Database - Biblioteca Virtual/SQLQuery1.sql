use biblioteca_virtual;

create table usuario(
	id_usuario int not null primary key,
	nome varchar(60),
	sexo char(1),
	rg varchar(9),
	telefone_celular varchar(12)
)

create table perfil(
	id_perfil int not null primary key,
	tipo_perfil varchar(30)
)

create table area(
	id_area int not null primary key,
	nome varchar(40),
	descricao varchar(80)
)

create table acervo(
	id_acervo int not null primary key,
	id_usuario int,
	data_insercao date,
	tipo_arquivo varchar(40),
	nome_autor varchar(40),
	preco float,
	foreign key(id_usuario) references usuario(id_usuario)
)

create table emprestimo(
	id_emp int not null primary key,
	id_usuario int,
	data_emprestimo date,
	date_termino date,
	quantidade int,
	preco_total decimal,
	foreign key(id_usuario) references usuario(id_usuario)
)

create table emprestimo_itens(
	id_emprestimo int not null primary key,
	id_acervo int,
	preco_unitario decimal,
	foreign key(id_acervo) references acervo(id_acervo)
)

create table sac(
	id_sac int not null primary key,
	descricao varchar(100),
	nome_pessoa varchar(40),
	data_atendimento date,
)

