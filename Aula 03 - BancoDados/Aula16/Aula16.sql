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

--PAGE 51
SET ANSI_NULLS ON --MANIPULAÇÃO DE VALORES NULOS
GO 

SET QUOTED_IDENTIFIER ON -- PALAVRAS RESERVADAS
GO

    CREATE OR ALTER FUNCTION dbo.GetOrderDetails(@SalesID int)
    RETURNS TABLE
    AS
        RETURN(
        SELECT sod.SalesOrderID,sod.SalesOrderDetailID,sod.CarrierTrackingNumber,p.Name ProductName,so.[Description]
        FROM Sales.SalesOrderDetail sod
        INNER JOIN Production.Product p ON (sod.ProductID = p.ProductID)
        INNER JOIN sales.SpecialOffer so ON (sod.SpecialOfferID = so.SpecialOfferID)
        WHERE sod.SalesOrderID = @SalesID     
)
GO

--INVOCANDO FUNCTION
SELECT * FROM dbo.GetOrderDetails(43659)


--page 58
GO
    CREATE OR ALTER FUNCTION [dbo].[GetTotalPedido](@OrderID Int)
        RETURNS DECIMAL(7,2)
    AS
    BEGIN 
        DECLARE @Total DECIMAL(7,2)
        SELECT @Total = SUM(SalesOrderDetail.UnitPrice * SalesOrderDetail.OrderQty)
        FROM Sales.SalesOrderDetail
        WHERE SalesOrderID= @OrderID
        RETURN @Total
    END;
GO

SELECT dbo.GetTotalPedido(43660) TotalPedido;

-- page 60

GO
    CREATE OR ALTER FUNCTION [dbo].[GetDetalhesPedidoCliente]
        (@CustomerID NCHAR(5))
    RETURNS @PedidosCliente TABLE(
                    CustomerId  NCHAR(5),
                    FirstName   VARCHAR(25),
                    MiddleName  VARCHAR(25),
                    LastName    VARCHAR(25),
                    OrderDate   DATETIME
)
AS 
BEGIN
    INSERT INTO @PedidosCliente
    SELECT c.CustomerID,p.FirstName,p.MiddleName,p.LastName,c.ModifiedDate
    FROM Sales.Customer c
    INNER JOIN Person.Person p ON (c.CustomerID = p.BusinessEntityID)
    WHERE c.CustomerID = @CustomerID;

    IF(@@ROWCOUNT = 0)
        BEGIN
            INSERT INTO @PedidosCliente
            VALUES(NULL,'Cliente não localizado','Cliente não localizado','Cliente não localizado',GETDATE())
    END
    RETURN
END;
GO

SELECT * from dbo.GetDetalhesPedidoCliente(285);
SELECT * from dbo.GetDetalhesPedidoCliente(0000);



