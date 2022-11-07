use Master

CREATE DATABASE EXERCICIO16
DROP DATABASE  EXERCICIO16
use EXERCICIO16
CREATE TABLE tb_vendedores(

id_vendedor integer,
cpf varchar(max),
nome varchar(max),
carteiraTrabalho varchar(max),
telefone	varchar(max),
dataAdmissao	DATE,
fg_ativo	INTEGER

CONSTRAINT pk_tbVendedores_idVendedor PRIMARY KEY(id_vendedor)
);

CREATE TABLE tb_categorias(
id_categoria        INTEGER,
tituloCategoria     varchar(max),
descricaoCategoria  varchar(max),
fg_ativo		    INTEGER,

CONSTRAINT pk_tb_categorias_idCategoria PRIMARY KEY(id_categoria)
);

CREATE TABLE tb_fornecedores(
id_fornecedor		INTEGER,
cnpj				varchar(max),
razaoSocial			varchar(max),
telefone			varchar(max),
endereco			varchar(max),
contato				varchar(max),
fg_ativo			varchar(max),
CONSTRAINT pk_tb_fornecedores_id_fornecedor PRIMARY KEY(id_fornecedor)
);

CREATE TABLE tb_produtos(
id_produto         INTEGER,
id_fornecedor       INTEGER ,
id_categoria        INTEGER,
nomeProduto         varchar(max),
descricaoProduto    varchar(max),
valorUnitario		NUMERIC,
quantidade			INTEGER,
quantidadeMinima	INTEGER,
fg_ativo			INTEGER,

CONSTRAINT pk_idProduto PRIMARY KEY(id_produto),
CONSTRAINT fk_fornecedor FOREIGN KEY(id_fornecedor)
REFERENCES tb_fornecedores(id_fornecedor),
CONSTRAINT fk_categoria  FOREIGN KEY(id_categoria)
	REFERENCES tb_categorias(id_categoria)
);

CREATE TABLE tb_compras(

id_compra INTEGER,
id_fornecedor INTEGER,
id_produto	 INTEGER,
id_categoria INTEGER,
dataCompra DATE,
valorTotal NUMERIC,
quantidade INTEGER,
fg_ativo INTEGER

CONSTRAINT pk_tbcomprasIDCompra PRIMARY KEY(id_compra),
CONSTRAINT fk_fornecedoresstbCompra FOREIGN KEY(id_fornecedor)
	REFERENCES  tb_fornecedores(id_fornecedor),
CONSTRAINT fk_Idproduto FOREIGN KEY(id_produto)
	REFERENCES tb_produtos(id_produto),
CONSTRAINT fk_idCategoria FOREIGN KEY(id_categoria)
	REFERENCES tb_categorias(id_categoria)
);

CREATE TABLE tb_vendas(
id_vendas     INTEGER,
id_vendedor   INTEGER,
id_categoria  INTEGER,
id_produto	  INTEGER,
data_venda	  DATE,
valorTotal	  NUMERIC,
quantidade	  INTEGER,
fg_ativo	  INTEGER,

CONSTRAINT pk_idVenda PRIMARY KEY(id_vendas),
CONSTRAINT fk_Vendedor FOREIGN KEY (id_vendedor)
	REFERENCES tb_vendedores(id_vendedor),
CONSTRAINT fk_idCategoriaTbVendas FOREIGN KEY (id_categoria)
REFERENCES tb_categorias(id_categoria),
CONSTRAINT fk_produto FOREIGN KEY(id_produto)
	REFERENCES tb_produtos(id_produto)
);

INSERT INTO tb_categorias(id_categoria,tituloCategoria,descricaoCategoria,fg_ativo)
VALUES
(1,'Brinquedos','Produtos infato/Juvenil',1),
(2,'Bebê e Cia','Produtos para bebês',1),
(3,'Casa e Decoração','Produtos para casa/lar',1),
(4,'Colecionáveis','Produtos destinados para colecionadores',1),
(5,'Construção e Ferramentas','Produtos pra construção Civil',1)

select * from tb_categorias

INSERT INTO tb_fornecedores(id_fornecedor,cnpj,razaoSocial,telefone,endereco,contato,fg_ativo)
VALUES
(1,'01.123.456/0001-01','Nome da Empresa 1','21 3456 7887','Av Nove de Julho ,1347','contato1@gmail.com',1),
(2,'02.456.789/0001-02','Nome da Empresa 2','16 3876 1234','Rua Rui Barbosa ,800 Conjunto B','contato2@gmail.com',1),
(3,'03.678.901/0001-03','Nome da Empresa 3','15 6543 9981','Rua jose Bonifácio,35','contato3@gmail.com',1),
(4,'04.890.123/0001-04','Nome da Empresa 4','11 5678 9877','Av Presidente Vargas,1254','contato4@gmail.com',1),
(5,'05.012.345/0001-05','Nome da Empresa 5','19 3656 4584','Rua Rafael Mendes, 78 Sala 13','contato5@gmail.com',1)


SELECT * FROM tb_fornecedores
INSERT INTO tb_produtos(id_produto,id_fornecedor,id_categoria,nomeProduto,descricaoProduto,valorUnitario,quantidade,quantidadeMinima,fg_ativo)
VALUES
(1,5,2,'Banheira para bebê','Descrição da Banheira para bebê',55.87,7,10,1),
(2,4,1,'Kit de Mágicas','Descrição de Kit de Magicas',55.87,7,10,1),
(3,3,3,'Tapete','Descrição do Tapete',55.87,7,10,1),
(4,2,4,'Selo','Descrição do Selo',55.87,7,10,1),
(5,1,5,'Fechadura','Descrição da Fechadura',55.87,7,10,1),
(6,1,2,'Base de Cadeira para Auto','Descrição daBase de Cadeira para Auto',55.87,7,10,1),
(7,2,1,'Jogo de Dominó','Descrição Jogo de Dominó',55.87,7,10,1),
(8,4,4,'Bonecas de Porcelana','Descrição das Bonecas de Porcelana',55.87,7,10,1)



INSERT INTO tb_vendedores(id_vendedor,cpf,nome,carteiraTrabalho,telefone,dataAdmissao,fg_ativo)
VALUES
(1,'123.456.789.01', 'José Ferreira Guedes','09876','16 1234 5678','2000-02-01',1),
(2,'876.122.341.87', 'Fabio Nunes Freitas','','16 1234 5678','2000-02-01',1),
(3,'123.456.789.01', 'José Ferreira Guedes','09876','16 1234 5678','2000-02-01',1),
(4,'123.456.789.01', 'José Ferreira Guedes','09876','16 1234 5678','2000-02-01',1),
(5,'123.456.789.01', 'José Ferreira Guedes','09876','16 1234 5678','2000-02-01',1)

