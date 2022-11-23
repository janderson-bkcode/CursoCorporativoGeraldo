USE[EXERCICIO_12]

--Ex 1
GO
CREATE OR ALTER FUNCTION fn_exercicio_1()
  RETURNS @tb_mensagem TABLE (resultado INT)
AS
BEGIN
	DECLARE @numero INT = 1

	WHILE @numero <= 10
		BEGIN
			IF @numero != 6 AND @numero != 8
				BEGIN
					INSERT INTO @tb_mensagem VALUES (@numero)
				END
			SET @numero = @numero + 1
		END
RETURN
END
GO

SELECT *
FROM fn_exercicio_1()

--Ex 2


SELECT * FROM tb_departamento

GO
CREATE OR ALTER FUNCTION dbo.GetDeptoInfo(@dptoID INT)
RETURNS VARCHAR(100)
AS
BEGIN
	DECLARE @dptoInfo VARCHAR(100)

	IF EXISTS(SELECT id_departamento FROM tb_departamento WHERE id_departamento = @dptoID)
	BEGIN
		SET @dptoInfo = (SELECT 'id: ' + CAST(d.id_departamento AS VARCHAR) +
							' nome: ' + d.nm_departamento + ' endere�o: ' + l.endereco + ', '+ l.cidade + ', ' 
							+ COALESCE(l.estado, '') + ', ' +p.nm_pais
						FROM tb_departamento  d
						INNER JOIN tb_localizacao l ON(d.id_localizacao = l.id_localizacao)
						INNER JOIN tb_pais p ON (l.id_pais = p.id_pais)
						WHERE id_departamento = @dptoID)
	END
	ELSE
	BEGIN
		SET @dptoInfo = 'Nenhum departamento encontrado'
	END

	RETURN @dptoInfo
END
GO

SELECT dbo.GetDeptoInfo(10)

--Ex 3

GO
CREATE OR ALTER FUNCTION dbo.CopyDptoTable()
RETURNS INT
AS
BEGIN
	DECLARE @tb_departamento_new TABLE(
		id_departamento INT,
		id_localizacao INT,
		nm_departamento VARCHAR(20))

	INSERT INTO @tb_departamento_new
	SELECT * FROM tb_departamento
	WHERE LEN(nm_departamento) % 2 = 0

	RETURN @@ROWCOUNT
END
GO

SELECT dbo.CopyDptoTable()

--Ex 4

GO
CREATE OR ALTER FUNCTION GetFuncaoID()
RETURNS @table TABLE(
		id_funcao VARCHAR(10),
		media_salario DECIMAL(10,2)
		)
AS
BEGIN
	INSERT INTO @table
	SELECT id_funcao, AVG(salario)
	FROM tb_empregado
	GROUP BY id_funcao
	HAVING AVG(salario) > 9550.35

	RETURN
END
GO

SELECT * FROM GetFuncaoID()

Go 
Create or alter FUNCTION get
returns Table