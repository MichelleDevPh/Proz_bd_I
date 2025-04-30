
CREATE FUNCTION TotalClientesCadastradosPorDia(data_consulta DATE)
RETURNS INT
BEGIN
    DECLARE total INT;
    
    SELECT COUNT(*) INTO total
    FROM clientes
    WHERE DATE(data_cadastro) = data_consulta;
    
    RETURN total;
END;