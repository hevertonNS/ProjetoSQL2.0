-- apagar o banco de dados
drop database dbmercearia;

-- criar o banco de dados
create database dbmercearia;

-- acessando o banco de dados
use dbmercearia;

-- criar as tabelas

create table tbfuncionarios(
codfunc int not null auto_increment,
nome varchar(100) not null,
email varchar(100),
telefone varchar(10),
cpf char(14) not null unique,
sexo char(1) default 'F' check(sexo in('F','M')),
salario decimal(9,2) default 0 check(salario >=0 ),
primary key(codfunc)
);

create table tbfornecedores(
codforn int not null auto_increment,
nome varchar(100),
cnpj char(18) unique,
ie char(12) unique,
logradouro varchar(100),
numero char(5),
cep char(9),
bairro varchar(100),
cidade varchar(50),
estado varchar(50),
telefone char(10),
primary key(codforn)
);

create table tbclientes(
codcli int not null auto_increment,
nome varchar(100),
email varchar(100),
cpf char(14) not null unique,
primary key(codcli)
);

create table tbusuarios(
codusu int not null auto_increment,
nome varchar(50) not null,
senha varchar(20) not null,
codfunc int not null,
primary key(codusu),
foreign key(codfunc)references tbfuncionarios(codfunc)
);  

create table tbprodutos(
codprod int not null auto_increment,
descricao varchar(100),
quantidade int default 0 check(quantidade>=0),
valor decimal(9,2) default 0 check(valor>=0),
dataentrada date,
horaentrada time,
codforn int not null,
primary key(codprod),
foreign key(codforn)references tbfornecedores(codforn)
);

create table tbvendas(
codvend int not null auto_increment,
codcli int not null,
codprod int not null,
codusu int not null,
datavenda date,
horavenda time,
quantidade int default 0 check(quantidade>=0),
primary key (codvend),
foreign key (codcli)references tbclientes(codcli),
foreign key (codprod)references tbprodutos(codprod),
foreign key (codusu)references tbusuarios(codusu)
);

-- visualizar a estrutura da tabela
desc tbfuncionarios;
desc tbclientes;
desc tbusuarios;
desc tbfornecedores;
desc tbprodutos;
desc tbvendas;

--inserir registro na tabela
insert into tbfuncionarios(nome,email,telefone,cpf,sexo,salario)
values('Junior Ferreira','junior.ferreira@hotmail.com',
'96915-0877','289.098.145-99','M',1628.00);

insert into tbfuncionarios(nome,email,telefone,cpf,sexo,salario)
values('Cleusa Maria','cleusa.maria@hotmail.com',
'91076-0557','222.098.111-78','F',1628.27);

insert into tbusuarios(nome,senha,codfunc)
values ('junior.ferreira','567890',1);

insert into tbusuarios(nome,senha,codfunc)
values ('cleusa.maria','90876',2);


-- visualizar os registros da tabela

select * from tbfuncionarios;
select * from tbusuarios;
select * from tbfornecedores;
select * from tbprodutos;
select * from tbclientes;
select * from tbvendas;