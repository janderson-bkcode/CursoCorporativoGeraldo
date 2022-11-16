--AULA 16

USE MyAdventureWorks

--CRIANDO A VIEW DDL
GO
CREATE VIEW dbo.vwEmployeeInformation
AS 
SELECT p.Title,p.FirstName,p.MiddleName,
       p.LastName,e.JobTitle,e.BirthDate,e.Gender
FROM Person.Person p 
INNER JOIN HumanResources.Employee e
    ON (p.BusinessEntityID = e.BusinessEntityID);
GO
-- INVOCANDO A VIEW
SELECT *
FROM vwEmployeeInformation

-- PAGE 11 VERIFICANDO SE A COLUNA É DETERMINÍSTICA

GO
    SELECT COLUMNPROPERTY(OBJECT_ID('Sales.SalesOrderDetail'),
        'LineTotal','IsDeterministic') as 'Column Length'
GO

-- PAGE 15 CRIANDO VIEW INDEXADA
GO
--CONFIGURA AS OPÇÕES PARA SUPORTAR VIEWS INDEXADAS
SET NUMERIC_ROUNDABORT OFF;
SET ANSI_PADDING ,ANSI_WARNINGS,CONCAT_NULL_YIELDS_NULL,
    ARITHABORT,QUOTED_IDENTIFIER,ANSI_NULLS ON ;

GO 
--VERIFICA SE JA EXISTE UMA VIEW COMO MESMO NOME
IF(OBJECT_ID('Purchasing.vwPurchaseOrders')) IS NOT NULL
    DROP VIEW Purchasing.vwPurchaseOrders;
GO

GO
    CREATE VIEW Purchasing.vwPurchaseOrders
    WITH SCHEMABINDING
    AS  
        SELECT
        poh.OrderDate,
        pod.ProductID,
        SUM(poh.TotalDue)TotalDue,
        COUNT_BIG(*) POCOUNT
        FROM Purchasing.PurchaseOrderHeader poh
        INNER JOIN Purchasing.PurchaseOrderDetail pod
            ON (poh.PurchaseOrderID = pod.PurchaseOrderID)
        GROUP BY poh.OrderDate,pod.ProductID;
GO

GO
    --ADICIONA UM INDICE CLUSTERIZADO ÚNICO
    CREATE UNIQUE CLUSTERED INDEX CIX_wPurchaseOrders_OrderDateProductId
    ON Purchasing.vwPurcharseOrders(OrderDate,ProductID)
GO

SELECT *
FROM Purchasing.vwPurchaseOrders;

--PAGE 20 FUNÇÕES DEFINIDAS PELO USUÁRIO

--CRIANDO FUNÇÃO ESCALAR
SET ANSI_NULLS ON 
GO
SET QUOTED_IDENTIFIER ON 
GO

CREATE FUNCTION dbo.GetEmployeeAge(@BirthDate DATETIME)
    RETURNS INT
AS
BEGIN
    --DECLARA A VARIAVEL DE RETORNO
    DECLARE @Age INT
    --ADICIONE AS INSTRUÇÕES T-SQL PARA CALCULAR O VALOR DE RETORNO 
    SELECT @Age = DATEDIFF(DAY,@BirthDate,GETDATE())
    --RETORNA O RESULTADO DA FUNÇÃO
    RETURN @Age
END;
GO

--INVOCANDO A FUNÇÃO GetEmployeeAge
SELECT
    p.FirstName,p.LastName,e.BirthDate,
    dbo.GetEmployeeAge(BirthDate) EmployeeAge
FROM HumanResources.Employee e
INNER JOIN Person.Person p
ON (e.BusinessEntityID = p.BusinessEntityID)

GO 
-- ALTERANDO FUNÇÃO PAGE 35
ALTER FUNCTION [dbo].[GetEmployeeAge](@BirthDate DATETIME)
RETURNS INT
AS
BEGIN
--DECLARA A VARIVAVEL DE RETORNO
DECLARE @Age int
--adicione as instruções T-SQL para calcular o valor de retorno
SELECT @Age = DATEDIFF(Year,@BirthDate,GETDATE())

--RETORNA O RESULTADO DA FUNÇÃO
RETURN @Age
END;

GO
    SELECT TOP(10)
        p.FirstName,p.LastName,e.BirthDate,
        dbo.GetEmployeeAge(BirthDate) EmployeeAge
    FROM HumanResources.Employee e
    INNER JOIN Person.Person p
    ON (e.BusinessEntityID = p.BusinessEntityID)
GO

GO 
    DROP FUNCTION dbo.GetEmployeeAge;
GO

--PAGE 40
GO 
    IF(OBJECT_ID('dbo.GetEmployeeAge')) IS NOT NULL
        DROP FUNCTION dbo.GetEmployeeAge
    GO

    CREATE FUNCTION [dbo].[GetEmployeeAge](
        @BirthDate DATETIME = '26/05/1972',--DEFAULT
        @Temp DATETIME = NULL --OPCIONAL
    )
    RETURNS INT
    AS
    BEGIN
    --DECLARA VARIÁVEL DE RETORNO
    DECLARE @Age INT
    --ADICIONA AS INSTRUÇÕES T-SQL PARA CALCULAR O VALOR DE RETORNO
    SELECT @Age = DATEDIFF(YEAR,@BirthDate,GETDATE())
    --RETORNA O RESULTADO DA FUNÇÃO
    RETURN @Age
    END;
GO

--INVOCANDO A FUNÇÃO DE DIVERSOS MANEIRAS

--PARAMETRO DE ENTRADA ÚNICO 
SELECT dbo.GetEmployeeAge(DEFAULT,NULL);
SELECT dbo.GetEmployeeAge('26/05/1972','');
SELECT dbo.GetEmployeeAge('26/05/1972',NULL);

-- O PRIMEIRO PARAMETRO É PADRÃO E O SEGUNDO É DE ENTRADA
SELECT dbo.GetEmployeeAge(DEFAULT,'10/01/1972');
SELECT dbo.GetEmployeeAge('26/05/1972','10/01/1972');


--
GO
    DECLARE @Age INT;
    EXECUTE @Age = dbo.GetEmployeeAge @BirthDate = '31/07/1977';
    SELECT @Age;
GO