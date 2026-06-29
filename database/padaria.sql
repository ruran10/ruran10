-- 1. Criar e usar o banco de dados
CREATE DATABASE IF NOT EXISTS padaria;
USE padaria;

-- 2. Criar tabelas principais
CREATE TABLE IF NOT EXISTS CLIENTE (
    CPF VARCHAR(14) PRIMARY KEY,
    Nome VARCHAR(100),
    Saldo DECIMAL(10,2)
);

-- Adicionamos a coluna 'Quantidade' aqui para o estoque
CREATE TABLE IF NOT EXISTS PRODUTO (
    IdProduto INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100),
    Categoria VARCHAR(50),
    Valor DECIMAL(10,2),
    Quantidade INT DEFAULT 100
);

-- 3. Criar tabelas de apoio
CREATE TABLE IF NOT EXISTS PEDIDO (
    NumeroPedido INT PRIMARY KEY,
    Data DATE,
    ValorTotal DECIMAL(10,2),
    CPF VARCHAR(14),
    FOREIGN KEY (CPF) REFERENCES CLIENTE(CPF)
);

CREATE TABLE IF NOT EXISTS ITEM_PEDIDO (
    NumeroPedido INT,
    IdProduto INT,
    Quantidade INT,
    Subtotal DECIMAL(10,2),
    PRIMARY KEY (NumeroPedido, IdProduto),
    FOREIGN KEY (NumeroPedido) REFERENCES PEDIDO(NumeroPedido),
    FOREIGN KEY (IdProduto) REFERENCES PRODUTO(IdProduto)
);

CREATE TABLE IF NOT EXISTS PAGAMENTO (
    IdPagamento INT PRIMARY KEY,
    FormaPagamento VARCHAR(50),
    Valor DECIMAL(10,2),
    NumeroPedido INT,
    FOREIGN KEY (NumeroPedido) REFERENCES PEDIDO(NumeroPedido)
);

-- 4. Inserir produtos com estoque de 100
INSERT INTO PRODUTO (Nome, Categoria, Valor, Quantidade) VALUES 
('Pão francês', 'Pães', 0.50, 100),
('Pão doce', 'Pães', 0.50, 100),
('Pão doce grande', 'Pães', 4.00, 100),
('Pão de hambúrguer', 'Pães', 10.00, 100),
('Pão de cachorro-quente', 'Pães', 8.00, 100),
('Pão recheado', 'Pães', 12.00, 100),
('Coxinha', 'Salgados', 1.00, 100),
('Bolinho de Queijo', 'Salgados', 1.00, 100),
('Queijo-Presunto', 'Salgados', 1.00, 100),
('Enroladinho de Salsicha', 'Salgados', 1.00, 100),
('Kibe', 'Salgados', 1.00, 100),
('Mortadela comum', 'Frios', 2.00, 100),
('Mortadela defumada', 'Frios', 2.50, 100),
('Queijo Mussarela', 'Frios', 2.00, 100),
('Queijo Prato', 'Frios', 2.00, 100),
('Presunto', 'Frios', 2.00, 100),
('Coca-Cola 350ml', 'Bebidas', 3.00, 100),
('Coca-Cola 600ml', 'Bebidas', 5.00, 100),
('Coca-Cola 2L', 'Bebidas', 10.00, 100),
('Guaraná Antártica 350ml', 'Bebidas', 3.00, 100),
('Guaraná Antártica 600ml', 'Bebidas', 5.00, 100),
('Guaraná Antártica 2L', 'Bebidas', 10.00, 100),
('Bolo de Chocolate', 'Doces', 15.00, 100),
('Bolo de Laranja', 'Doces', 15.00, 100),
('Bolo de Cenoura', 'Doces', 12.00, 100),
('Bolo de Cenoura com Chocolate', 'Doces', 15.00, 100),
('Bolo de Coco', 'Doces', 12.00, 100),
('Rocambole', 'Doces', 8.00, 100);
SELECT * FROM PRODUTO;