create database CaminhosDoSolSQL;

use database CaminhosDoSolSQL;

create table usuario
(
    cd_usuario int auto_increment primary key,
    email_usuario varchar(90),
    senha_usuario varchar(45),
    nm_usuario varchar(15),
    sbnm_usuario varchar(15)
);

create table funcionario
(
    cd_funcionario auto_increment primary key,
    nm_funcionario varchar(15),
    nr_telefone_funcionario varchar(12)
);

create table categoria
(
    cd_categoria int auto_increment primary key,
    id_categoria varchar(45)
);

create table produto
(
    cd_produto int auto_increment primary key,
    vl_produto decimal(4,2),
    nm_produto varchar(45),
    fk_cd_categoria int,
    foreign key (fk_cd_categoria) references categoria(cd_categoria)
);

create table estoque
(
    cd_estoque int auto_increment primary key,
    qt_estoque int,
    fk_cd_produto int,
    foreign key(fk_cd_produto) references produto(cd_produto)
);

create table tamanho
(
    cd_tamanho int auto_increment primary key,
    nm_tamanho varchar(2),
    fk_cd_produto int,
    foreign key(fk_cd_produto) references produto(cd_produto)
);

create table pedido
(
    cd_pedido int auto_increment primary key,
    nr_protocolo bigint(17),
    fk_cd_produto int,
    fk_cd_usuario int,
    fk_cd_funcionario int,
    foreign key(fk_cd_produto) references produto(cd_produto),
    foreign key(fk_cd_usuario) references usuario(cd_usuario),
    foreign key(fk_cd_funcionario) references funcionario(cd_funcionario)
);

create table carrinho
(
    cd_carrinho int auto_increment primary key,
    fk_cd_usuario int,
    fk_cd_pedido int,
    foreign key(fk_cd_usuario) references usuario(cd_usuario),
    foreign key(fk_cd_pedido) references pedido(cd_pedido)
);

create table favorito
(
    cd_favorito int auto_increment primary key,
    fk_cd_produto int,
    fk_cd_usuario int,
    foreign key(fk_cd_produto) references produto(cd_produto),
    foreign key(fk_cd_usuario) references usuario(cd_usuario)
);

create table reclamacao
(
    cd_reclamacao int auto_increment primary key,
    ds_reclamacao longtext,
    fk_cd_usuario int,
    fk_cd_pedido int,
    fk_cd_funcionario int,
    foreign key(fk_cd_usuario) references usuario(cd_usuario),
    foreign key(fk_cd_pedido) references pedido(cd_pedido),
    foreign key(fk_cd_funcionario) references funcionario(cd_funcionario)
);

create view PrecoMaior
as select vl_produto
from produto
where fk_cd_categoria = 1
order by vl_produto ASC;