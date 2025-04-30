CREATE DATABASE LojaDB;
USE LojaDB;

CREATE TABLE Produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10,2),
    estoque INT
);

CREATE TABLE HistoricoPreco (
    id INT AUTO_INCREMENT PRIMARY KEY,
    produto_id INT,
    preco_antigo DECIMAL(10,2),
    preco_novo DECIMAL(10,2),
    data_alteracao DATETIME DEFAULT NOW(),
    FOREIGN KEY (produto_id) REFERENCES Produtos(id)
);

DELIMITER //
CREATE TRIGGER trg_update_preco
BEFORE UPDATE ON Produtos
FOR EACH ROW
BEGIN
    IF OLD.preco != NEW.preco THEN
        INSERT INTO HistoricoPreco (produto_id, preco_antigo, preco_novo)
        VALUES (OLD.id, OLD.preco, NEW.preco);
    END IF;
END;
//
DELIMITER ;
