-- criação do banco de dados para o  cenário de E-commerce
create database ecommerce;
use ecommerce;

-- criar tabela cliente
create table cliente(
    idcliente int auto_increment primary key,
    Fname varchar(20),
    Minit char(3),
    Lname varchar(20),
    CPF char(11) not null,
    Adress varchar(30),
    constraint unique_cpf_client unique (CPF)
);

-- cria tabela produto