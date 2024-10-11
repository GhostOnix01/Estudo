SQLSERVER

// Restrição de unicidade - Para definir um campo como "UNICO"

CREATE TABLE aluno (
  codigo int,
  nome varchar(100),
  CPF char(11) UNIQUE,
  email varchar(50),
  telefone varchar(11),
  dt_nascimento date
);

CREATE TABLE aluno (
  codigo int,
  nome varchar(100),
  CPF char(11),
  email varchar(50),
  telefone varchar(11),
  dt_nascimento date,
  CONSTRAINT cpf_unique UNIQUE(CPF)
);

CREATE TABLE aluno (
  codigo int,
  nome varchar(100),
  CPF char(11),
  RG char(10),
  orgaoEmissor char(15),
  email varchar(50),
  telefone varchar(11),
  dt_nascimento date,
  CONSTRAINT cpf3_unique UNIQUE(CPF),
  CONSTRAINT rg_unique UNIQUE(RG, orgaoEmissor)
);

============================================================================================

// Restrição CHECK - Para definir valores somente positivo e/ou negativo, entre outros...

CREATE TABLE produto (
  codpro int NOT NULL,
  descricao varchar(100) NOT NULL,
  preco money NOT NULL CHECK (preco>0),
);

CREATE TABLE produto (
  codpro int NOT NULL,
  descricao varchar(100) NOT NULL,
  preco money NOT NULL,
  CONSTRAINT ch_preco CHECK (preco>0)
);

==============================================================================================

// DEFAULT - Para definir valores como default caso o usuário não informe

CREATE TABLE salario (
  codinst int NOT NULL,
  valor money NOT NULL DEFAULT 2000.00,
  cargo varchar(20) NOT NULL DEFAULT 'Instrutor Passeio'
);

===============================================================================================

// Chaves Primárias

CREATE TABLE curso (
  codigo int NOT NULL PRIMARY KEY,
  nome varchar(100),
  descricao varchar(max)
);

CREATE TABLE aluno (
  codigo int,
  nome varchar(100),
  CPF char(11),
  email varchar(50),
  telefone varchar(11),
  dt_nascimento date,
  CONSTRAINT pk_codigo_cpf PRIMARY KEY(codigo, CPF)
);

===============================================================================================

// Chaves Estrangeiras

CREATE TABLE dependente (
  CPF char(11) NOT NULL PRIMARY KEY,
  nome varchar(50) NOT NULL,
  email varchar(50),
  dt_nascimento date,
  codfun int NOT NULL FOREIGN KEY REFERENCES funcionario(codfun)
);

CREATE TABLE dependente (
  CPF char(11) NOT NULL PRIMARY KEY,
  nome varchar(50) NOT NULL,
  email varchar(50),
  dt_nascimento date,
  codfun int NOT NULL,
  CONSTRAINT PK_fun_dep FOREIGN KEY (codfun) REFERENCES funcionario(codfun)
);

===============================================================================================

// Campos IDENTITY - Criamos um auto incremento que inicia em 1 e incrementa um valor a cada registro. 
Assim, a sequência irá iniciar em 1 e incrementar 1 a cada registro. Podemos criar o auto incremento 
conforme a necessidade, por exemplo, IDENTITY(100, 10) começa em 100 e soma 10 a cada registro.

CREATE TABLE contas_pagar (
  codcpg int NOT NULL IDENTITY(1,1),
  descricao varchar(100) NOT NULL,
  valor money NOT NULL CHECK(valor>0)
);

===============================================================================================

// 'Para modificar Tabelas

Ao perceber, após a tabela ter sido criada, que foi cometido um erro ou que as necessidades da aplicação mudaram, 
é possível remover a tabela e criá-la novamente. Porém, esse procedimento não é conveniente quando existem dados na
 tabela ou se a tabela é referenciada por outros objetos do banco de dados (por exemplo, uma restrição de chave estrangeira).
 Para essa finalidade o SQL disponibiliza um conjunto de comandos que realizam modificações em tabelas existentes.'

// 'Incluindo colunas
A sintaxe para incluir uma coluna em uma tabela é a seguinte:'
ALTER TABLE nome_tabela ADD nome_coluna tipo;

'Por exemplo, para adicionar uma coluna chamada RG na tabela aluno, o comando será:'
ALTER TABLE aluno ADD RG char(9);

// 'Alterando colunas
Podemos alterar o tipo de dados de uma coluna:'
ALTER TABLE nome_tabela
ALTER COLUMN nome_coluna tipo;

'Por exemplo, para alterar uma coluna email da tabela aluno de varchar(50) para char(30), o comando será:'
ALTER TABLE aluno
ALTER COLUMN email char(30);

// 'Excluindo colunas
A exclusão de coluna também é feita com o comando ALTER TABLE. Veja a sintaxe:'
ALTER TABLE nome_tabela DROP COLUMN nome_coluna;

'Por exemplo, para excluir a coluna endereço da tabela aluno, o comando será:'
ALTER TABLE aluno DROP COLUMN endereco;

// 'Alterando o nome de tabelas e colunas
No SQL Server, a alteração do nome de tabelas e colunas é feita através de um objeto especial chamado sp_rename.

A sintaxe para alteração nome de uma tabela é:'
EXEC sp_rename 'nome_antigo', 'novo_nome';

'Por exemplo, para alterar o nome da tabela contas_pagar para contas_a_pagar, o código será:'
EXEC sp_rename 'contas_pagar', 'contas_a_pagar';

'O comando sp_rename também permite alterar o nome de colunas. Veja a sintaxe:'
EXEC sp_rename 'tabela.nome', 'novo_nome', 'COLUMN';

'Por exemplo, para mudar o nome da coluna fabricacao da tabela carro para ano_fabricacao, o comando será:'
EXEC sp_rename 'carro.fabricacao', 'ano_fabricacao', 'COLUMN';

// 'Inclusão de restrições
Com o comando ALTER TABLE, é possível criar as restrições UNIQUE, PRIMARY KEY, FOREIGN KEY, CHECK E DEFAULT. 
Veja como fica a sintaxe de cada uma:

UNIQUE RESTRIÇÃO DE COLUNA:'
ALTER TABLE tabela ADD UNIQUE (coluna1, coluna2 ... colunaN);

'UNIQUE RESTRIÇÃO DE TABELA:'
ALTER TABLE tabela ADD CONSTRAINT nome_restricao UNIQUE (coluna1, coluna2 ... colunaN);

'PRIMARY KEY RESTRIÇÃO DE COLUNA:'
ALTER TABLE tabela ADD PRIMARY KEY (coluna1, coluna2 ... colunaN);

'PRIMARY KEY RESTRIÇÃO DE TABELA:'
ALTER TABLE tabela ADD CONSTRAINT nome_restricao PRIMARY KEY (coluna1, coluna2 ... colunaN);

'FOREIGN KEY RESTRIÇÃO DE COLUNA:'
ALTER TABLE tabela
ADD FOREIGN KEY (coluna1, coluna2 ... colunaN) REFERENCES tabela(coluna1, coluna2 ... colunaN);

'FOREIGN KEY RESTRIÇÃO DE TABELA:'
ALTER TABLE tabela
ADD CONSTRAINT nome_restricao
FOREIGN KEY (coluna1, coluna2 ... colunaN) REFERENCES tabela(coluna1, coluna2 ... colunaN);

'CHECK RESTRIÇÃO DE COLUNA:'
ALTER TABLE tabela ADD CHECK (condicao);

'CHECK RESTRIÇÃO DE TABELA:'
ALTER TABLE tabela
ADD CONSTRAINT nome_restricao CHECK (condicao);

'DEFAULT:'
ALTER TABLE tabela
ALTER CONSTRAINT nomeRestricao DEFAULT 'valor padrão' FOR nomeColuna;

'Exclusão de restrições
A exclusão de restrições é bem mais simples que a inclusão. Todas as restrições, exceto a DEFAULT, são excluídas com o seguinte o comando:'
ALTER TABLE tabela DROP CONSTRAINT nome_restricao;

'Para excluir a restrição, precisamos do seu nome... Por isso, sempre que possível, defina as restrições como restrição de tabela.'

