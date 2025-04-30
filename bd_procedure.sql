DELIMITER $$

CREATE PROCEDURE relatorio_diario_compras()
BEGIN
    SELECT
        p.nome_produto,
        SUM(i.quantidade) AS quantidade_comprada,
        DATE(c.data_compra) AS data_compra
    FROM
        compras c
    INNER JOIN
        itens_compra i ON c.id_compra = i.id_compra
    INNER JOIN
        produtos p ON i.id_produto = p.id_produto
    WHERE
        c.data_compra = CURDATE() 
    GROUP BY
        p.nome_produto, DATE(c.data_compra)
    ORDER BY
        quantidade_comprada DESC;
END$$

DELIMITER ;
