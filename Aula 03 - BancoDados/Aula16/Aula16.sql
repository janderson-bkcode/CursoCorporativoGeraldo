--AULA 16

USE MyAdventureWorks

--CRIANDO A VIEW DDL
CREATE VIEW dbo.vwEmployeeInformation
AS 
SELECT p.Title,p.FirstName,p.MiddleName,
       p.LastName,e.JobTitle,e.BirthDate,e.Gender
FROM Person.Person p 
INNER JOIN HumanResources.Employee e
    ON (p.BusinessEntityID = e.BusinessEntityID);

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
    --ADICIONE AS INTRUÇÕES T-SQL PARA CALCULAR O VALOR DE RETORNO 
    SELECT @Age = DATEDIFF(DAY,@BirthDate,GETDATE())
    --RETORNA O RESULTADO DA FUNÇÃO
    RETURN @Age
END;
GO


