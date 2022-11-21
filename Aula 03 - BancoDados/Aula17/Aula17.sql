--21-11-2022 Aula 17

use MyAdventureWorks

SET ANSI_NULLS ON 
GO 
SET QUOTED_IDENTIFIER ON 
GO

GO
  CREATE OR ALTER PROCEDURE dbo.PurchaseOrderInformation
  AS
  BEGIN
    SELECT poh.PurchaseOrderID,pod.PurchaseOrderDetailID,poh.OrderDate,poh.TotalDue,pod.ReceivedQty,
            p.Name ProductName
    FROM Purchasing.PurchaseOrderHeader poh
    INNER JOIN Purchasing.PurchaseOrderDetail pod ON (poh.PurchaseOrderID = pod.PurchaseOrderID)
    INNER JOIN Production.Product p ON (pod.ProductID = p.ProductID)
  END
GO

EXEC dbo.PurchaseOrderInformation;


--PAGE 15
EXEC dbo.PurchaseOrderInformation
WITH RESULT SETS
(
    (
        [Purchase Order ID] INT,
        [Purchase Order Detail ID] INT,
        [Order Date] DATETIME,
        [Total Due] MONEY,
        [Received Quantity] FLOAT,
        [Product Name] VARCHAR(50)
    )    
)
--Parametrize
GO
ALTER PROCEDURE [dbo].[PurchaseOrderInformation] 
@EmployeeID INT,@OrderYear INT = 2005
AS
BEGIN
    SELECT poh.PurchaseOrderID,pod.PurchaseOrderDetailID,poh.OrderDate,poh.OrderDate,poh.TotalDue,
           pod.ReceivedQty,p.Name ProductName
    FROM Purchasing.PurchaseOrderHeader poh
    INNER JOIN Purchasing.PurchaseOrderDetail pod ON (poh.PurchaseOrderID = pod.PurchaseOrderID)
    INNER JOIN Production.Product p ON (pod.ProductID = p.ProductID)
    WHERE poh.EmployeeID = @EmployeeID
    AND YEAR(poh.OrderDate) = @OrderYear
END
GO

EXEC dbo.PurchaseOrderInformation @EmployeeID=258;
EXEC dbo.PurchaseOrderInformation @EmployeeID = 258,@OrderYear = 2006;

DROP PROCEDURE dbo.PurchaseOrderInformation;

-- GATILHOS DE MANIPULAÇÃO DE DADOS(TRIGGERS) PAGE 27 
GO
CREATE OR ALTER TRIGGER HumanResources.iCheckModifiedDate
ON HumanResources.Department
    FOR INSERT
    AS
    BEGIN
        DECLARE @modifiedDate DATETIME,@DepartamentID INT
        SELECT @modifiedDate = modifiedDate,@DepartamentID = DepartmentID
        FROM inserted;
        IF(DATEDIFF(DAY,@modifiedDate,GETDATE())>0)
            BEGIN
                UPDATE HumanResources.Department
                SET ModifiedDate = GETDATE()
                WHERE DepartmentID = @DepartamentID
            END
    END
GO 

INSERT INTO HumanResources.Department
VALUES('Executive Marketing','Executive General and Administration','11/02/2011');

SELECT * from HumanResources.Department

--
GO
CREATE OR ALTER TRIGGER HumanResources.iCheckModifiedDate
ON HumanResources.Department
    FOR INSERT
    AS
    BEGIN
        DECLARE @modifiedDate DATETIME,@DepartamentID INT
        SELECT @modifiedDate = modifiedDate,@DepartamentID = DepartmentID
        FROM inserted;
        IF(DATEDIFF(Day,@modifiedDate,GETDATE())>0)
        BEGIN
        UPDATE HumanResources.Department
        SET ModifiedDate = DATEADD(DAY,-1,GETDATE())
        WHERE DepartmentID = @DepartamentID
        END
    END
GO



INSERT INTO HumanResources.Department
VALUES('Executive Marketing','Executive General and Administration','11/02/2011');

SELECT * from HumanResources.Department ORDER BY 1 DESC


DROP TRIGGER HumanResources.iCheckModifiedDate;

DISABLE TRIGGER HumanResources.iCheckModifiedDate
 ON HumanResources.Department;

ENABLE TRIGGER HumanResources.iCheckModifiedDate
 ON HumanResources.Department;

