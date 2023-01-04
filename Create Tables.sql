BEGIN TRANSACTION

CREATE TABLE Cliente
(
	Codigo INT IDENTITY (1,1) NOT NULL, --PRIMARY KEY 
	Nome VARCHAR (50) NOT NULL,
	CPF CHAR (11) NULL,
	Celular CHAR (11) NULL,
	Telefone_Residencial CHAR (10) NULL,
	Email VARCHAR (50) NULL,
	Logadouro VARCHAR (50) NULL,
	CEP CHAR (8) NULL,
	Cidade VARCHAR (30) NULL,
	Estado CHAR (2),
	CONSTRAINT PK_CodigoCliete PRIMARY KEY (Codigo)
)


CREATE TABLE Fidelidade
(
	Codigo_Cliente INT NOT NULL,
	Data_Adesao DATETIME NOT NULL,
	Pontos INT NULL,
	CONSTRAINT PK_CodigoClienteFidelidade PRIMARY KEY (Codigo_Cliente),
	CONSTRAINT FK_CodigoClienteFidelidade FOREIGN KEY (Codigo_Cliente) REFERENCES Cliente(Codigo)
)
 

CREATE TABLE Forma_Pagamento
(
	Codigo INT IDENTITY(1,1) NOT NULL,
	Nome VARCHAR(25) NOT NULL,
	Tipo VARCHAR(25) NOT NULL,
	CONSTRAINT PK_CodigoPagamento PRIMARY KEY (Codigo)
)


CREATE TABLE Marca
(
	Codigo INT IDENTITY(1,1) NOT NULL,
	Nome VARCHAR(25) NULL,
	Empresa VARCHAR(25) NULL,
	CONSTRAINT PK_CodigoMarca PRIMARY KEY (Codigo)
)


CREATE TABLE Produto
(
	Codigo INT IDENTITY(1,1) NOT NULL,
	Nome VARCHAR (30) NULL,
	Descricao VARCHAR(MAX),
	Codigo_Marca INT NOT NULL,
	CONSTRAINT PK_CodigoProduto PRIMARY KEY (Codigo),
	CONSTRAINT FK_CodigoMarca FOREIGN KEY (Codigo_Marca) REFERENCES Marca(Codigo)
)


CREATE TABLE Pedido_Venda
(
	Codigo INT IDENTITY(1,1) NOT NULL,
	Valor DECIMAL(6,2) NULL,
	Valor_Imposto DECIMAL(6,2) NULL,
	[Data] DATETIME NOT NULL,
	Nota_Fiscal INT NOT NULL,
	Codigo_Cliente INT NOT NULL,
	Codigo_Forma_Pagamento INT NOT NULL,
	CONSTRAINT PK_PedidoVenda PRIMARY KEY (Codigo),
	CONSTRAINT FK_CodigoFormaPagamento FOREIGN KEY (Codigo_Forma_Pagamento) REFERENCES Forma_Pagamento(Codigo),
	CONSTRAINT FK_CodigoCliente FOREIGN KEY (Codigo_Cliente) REFERENCES Cliente(Codigo)
)


CREATE TABLE Item_Pedido_Venda
(
	Codigo INT IDENTITY(1,1) NOT NULL,
	Valor_Total DECIMAL(6,2) NULL,
	Valor_Imposto DECIMAL(6,2) NULL,
	Valor_Unitario DECIMAL(6,2) NULL,
	Quantidade int NULL,
	Codigo_Produto INT NOT NULL,
	Codigo_Pedido_Venda INT NOT NULL,
	CONSTRAINT PK_CodigoItemPedidoVenda PRIMARY KEY (Codigo),
	CONSTRAINT FK_CodigoProduto FOREIGN KEY (Codigo_Produto) REFERENCES Produto (Codigo),
	CONSTRAINT FK_CodigoPedidoVenda FOREIGN KEY (Codigo_Pedido_Venda) REFERENCES Pedido_Venda (Codigo)
)


CREATE TABLE Distribuidor 
(
	Codigo INT IDENTITY(1,1) NOT NULL,
	CNPJ VARCHAR(14) NOT NULL,
	Nome_Fantasia VARCHAR(40) NOT NULL,
	Razao_Social VARCHAR(40) NOT NULL,
	CEP NCHAR(8),
	Logadouro VARCHAR(40),
	Estado CHAR(2),
	Cidade VARCHAR(35),
	CONSTRAINT PK_CodigoDistribuidor PRIMARY KEY (Codigo)
)


CREATE TABLE Pedido_Compra
(
	Codigo INT IDENTITY(1,1) NOT NULL,
	Valor DECIMAL(6,2) NULL,
	[Data] DATETIME NOT NULL,
	Nota_Fiscal INT NOT NULL,
	Codigo_Distribuidor INT NOT NULL,
	CONSTRAINT PK_CodigoPedidoCompra PRIMARY KEY (Codigo),
	CONSTRAINT FK_CodigoDistribuidor FOREIGN KEY (Codigo_Distribuidor) REFERENCES Distribuidor (Codigo)
)


CREATE TABLE Item_Pedido_Compra
(
	Codigo INT IDENTITY(1,1) NOT NULL,
	Valor_Unitario DECIMAL(6,2) NULL,
	Quantidade INT NULL,
	Valor_Total DECIMAL(6,2) NULL,
	Codigo_Produto INT NOT NULL,
	Codigo_Pedido_Compra INT NOT NULL,
	CONSTRAINT PK_CodigoItenPedidoCompra PRIMARY KEY (Codigo),
	CONSTRAINT FK_CodigoProdutoItem FOREIGN KEY (Codigo_Produto) REFERENCES Produto (Codigo),
	CONSTRAINT FK_CodigoPedidoCompra FOREIGN KEY (Codigo_Pedido_Compra) REFERENCES Pedido_Compra (Codigo)
)

--COMMIT
--ROLLBACK

--DROP TABLE 

SELECT * FROM Cliente
SELECT * FROM Fidelidade
SELECT * FROM Forma_Pagamento
SELECT * FROM Marca
SELECT * FROM Produto
SELECT * FROM Pedido_Venda
SELECT * FROM Distribuidor	
SELECT * FROM Pedido_Compra
SELECT * FROM Item_Pedido_Compra
SELECT * FROM Item_Pedido_Compra

