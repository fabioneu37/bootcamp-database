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

-- size = dimensão do produto
create table product(
    idproduct int auto_increment primary key,
    Pname varchar(10),
    classification_kids bool,
    category enum('Eletrônico','vestimenta','Brinquedo','Alimentos','Móveis') not null,
    avaliacao float default 0,
    size varchar(10),
    constraint unique_cpf_ unique(CPF)
);

-- criar tabela pedido
create table orders(
    idOrder int auto_increment primary key,
    idOrderClient int,
    orderStatus enum('Cancelado','Confrmado','Em processamento'),
    order_description varchar(255)
);