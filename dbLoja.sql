-- apagar o banco de dados
drop database dbLoja;

-- criar o banco de dados
create database dbLoja;


-- acessar o banco de dados
use dbLoja;

-- criando as tabelas do banco de dados
create table tbFuncionarios(
codFunc int not null auto_increment,
nome varchar(100) not null,
email varchar(100) not null,
cpf char(14) not null unique,
telCel char(10), 
dataNasc date,
sexo char(1),
salario decimal(9,2),
logradouro varchar(100),
numero char(10),
cep char(9),
bairro char(100),
cidade char(100),
estado char(100),
siglaEst char(100),
complemento char(100),

primary key(codFunc)

);



create table tbClientes(

codCli int not null auto_increment,
nome varchar(100) not null,
email varchar(100),
telCel char(9),
cpf char(14) not null unique,
primary key(codCli)

);






create table tbFornecedores(

codForn int not null auto_increment,
nome varchar(50) not null,
email varchar(100),
cnpj char(18) not null unique,
primary key(codForn)

);


create table tbUsuario(

codUsu int not null auto_increment,	
nome varchar(30) not null unique,
senha varchar(12) not null,
codFunc int not null,

foreign key (codFunc)references tbFuncionarios(codFunc),
primary key(codUsu)

);



create table tbProduto(

codProd int not null auto_increment,
nome varchar(100),
valor decimal(9,2),
quantidade int,
dataEnt date,
validade date,
codForn int not null,
foreign key (codForn)references tbFornecedores(codForn),
primary key(codProd)

);


create table tbVendas(

codVenda int not null auto_increment,
dataVenda date,
horaVenda time,
quantidade int,
valorTotal decimal(9,2),
codProd int not null,
codUsu int not null,
codCli int not null,

primary key(codVenda),
foreign key(codProd)references tbProduto(codProd),
foreign key(codUsu)references tbUsuario(codUsu),
foreign key(codCli)references tbClientes(codCli)

);

desc tbProduto;
desc tbUsuario;
desc tbFuncionarios;
desc tbClientes;
desc tbFornecedores;
desc tbVendas;

-- inserindo registros nas tabelas
insert into tbFuncionarios(
	nome, email, cpf, telCel, dataNasc, sexo, salario, logradouro,
	numero, cep, bairro, cidade, estado, siglaEst, complemento
	)
	
	values('Maria Debe', 'maria@gmail.com', '123.123.123.12', '99999-9999', '1200/01/01',
		'M', 12300.52, 'Rua do Sabio', '99B', '03333-333', 'Santo Fornicas', 'Sao Paulo,', 'SP',
		'Casa do fundo inicial')

select * from tbFuncionarios;
