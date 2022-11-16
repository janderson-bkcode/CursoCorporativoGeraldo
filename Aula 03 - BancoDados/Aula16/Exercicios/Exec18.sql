-- EXERCICIO 18
USE Exercicio_16
--01

--page 58

-- ALTERANDO FUNÇÃO PAGE 35
GO
  CREATE OR ALTER FUNCTION [dbo].[fn_exercicio01](@num INT)
    RETURNS INT
    AS
    BEGIN
    WHILE (@num <=10 and @num!=6 and @num!=8)
        BEGIN
        INSERT INTO tb_mensagem
        values(@num,'TEXTO');
        SET @num = @num +1
        END
    END
GO
    

--02

