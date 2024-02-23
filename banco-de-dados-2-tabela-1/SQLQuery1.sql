
CREATE DATABASE ExemploBancoDeDados;


USE ExemploBancoDeDados;


CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Email VARCHAR(100)
);


INSERT INTO Clientes (ClienteID, Nome, Email)
VALUES (1, 'João', 'joao@example.com'),
       (2, 'Maria', 'maria@example.com'),
       (3, 'Pedro', 'pedro@example.com');


CREATE TABLE Pedidos (
    PedidoID INT PRIMARY KEY,
    ClienteID INT,
    DataPedido DATE,
    ValorTotal DECIMAL(10, 2),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);


INSERT INTO Pedidos (PedidoID, ClienteID, DataPedido, ValorTotal)
VALUES (1, 1, '2024-02-20', 100.00),
       (2, 2, '2024-02-21', 150.00),
       (3, 3, '2024-02-22', 200.00);

-- Consulta usando INNER JOIN para obter os dados dos clientes e seus pedidos
SELECT c.Nome, p.PedidoID, p.DataPedido, p.ValorTotal
FROM Clientes c
INNER JOIN Pedidos p ON c.ClienteID = p.ClienteID;
