CREATE DATABASE ExemploDB;
GO

USE ExemploDB;
GO

CREATE TABLE Produtos (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    preco DECIMAL(10, 2)
);
GO

CREATE TABLE LogInsercaoProdutos (
    id INT PRIMARY KEY IDENTITY,
    produto_id INT,
    data_insercao DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (produto_id) REFERENCES Produtos(id)
);
GO

CREATE TRIGGER insere_log_produto
ON Produtos
AFTER INSERT
AS
BEGIN
    INSERT INTO LogInsercaoProdutos (produto_id)
    SELECT id
    FROM inserted;
END;
GO

INSERT INTO Produtos (id, nome, preco) VALUES (1, 'Camiseta', 29.99);
GO

SELECT * FROM LogInsercaoProdutos;
GO
