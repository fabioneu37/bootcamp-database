-- criação do banco de dados para o  cenário de E-commerce
create database ecommerce;
use ecommerce;

-- criar tabela cliente
create table clients(
    idClient int auto_increment primary key,
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

create table payments(
 idClient int ,
 idPayment int,
 typePayment enum('Boleto','Cartão','Dois cartões'),
 limitAvailable float,
 primary key(idClient, id_payment)
);

-- criar tabela pedido
create table orders(
    idOrder int auto_increment primary key,
    idOrderClient int,
    orderStatus enum('Cancelado','Confrmado','Em processamento'),
    order_description varchar(255),
    sendValue float default 10,
    payment float,
    constraint fk_orders_client foreign key( idOrderClient) references clients(idcliente)
);

-- tabela estoque
create table productStorage(
    idProdStorage int auto_increment primary key,
    StorageLocation varchar(255),
    quantity int default 0
);

-- tabela fornecedor
create table supplier(
  idSupplier int auto_increment primary key,
  SocialName varchar(255) not null,
  CNPJ varchar(15) not null,
  quantity int default 0,
  contact char(11) not null,
  constraint unique_supplier unique(CNPJ)
);

-- tabela vendedor
create table seller(
  idSeller int auto_increment primary key,
  SocialName varchar(255) not null,
  abstName varchar(255),
  CNPJ varchar(15),
  CPF char(9) ,
  location varchar(255),
  contact char(11) not null,
  constraint unique_cnpj_seller unique(CNPJ),
  constraint unique_cnpj_seller unique(CPF)
);

create table productSeller(
   idPseller int,
   idProduct int,
   prodQuantity int default 1,
   primary key(idSeller,idProduct),
   constraint fk_product_seller foreign key(idPseller) references seller(idSeller),
   constraint fk_product_product foreign key(idProduct) references product(idproduct)
);

create table ClientPJ(
  idClientPJ int primary key,
  CNPJ varchar(15),
  idclient int,
  constraint fk_clientpj_client foreign key(idclient) references clients(idclient)
);

create table ClientPF(
  idClientPF int primary key,
  CNPJ varchar(15),
  idclient int,
  constraint fk_clientpf_client foreign key(idclient) references clients(idclient)
);