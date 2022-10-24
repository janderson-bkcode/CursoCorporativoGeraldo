
--24/10/22 aula 13

use MyAdventureWorks

SELECT SalesOrderID,CustomerID,SalesPersonID
FROM Sales.SalesOrderHeader
WHERE SalesPersonID IS NOT NULL;



--Pivot
SELECT --Colunas
      SalesPersonID,[29486] AS Cust1,[29487] AS Cust2,
	  [29488] AS Cust3,[29491] AS Cust4,
	  [29492] AS Cust5,[29512] AS Cust6
FROM --Dados
	(SELECT SalesOrderID,CustomerID,SalesPersonID
	 FROM Sales.SalesOrderHeader
	 WHERE SalesPersonID IS NOT NULL
	 ) AS p
	 PIVOT --Tuplas
	 ( COUNT(SalesOrderID)
		FOR CustomerId IN ([29486],[29487],[29488],[29491],[29492],[29512])	
	 ) AS pvt
ORDER BY SalesPersonID;



GO 
IF(OBJECT_ID('dbo.unPvc')) IS NOT NULL
   DROP TABLE dbo.unPvt

GO
CREATE TABLE dbo.unPvt(
SalesPersonID INT,
Cust1 int,
Cust2 int,
Cust3 int,
Cust4 int,
Cust5 int,
Cust6 int
);

GO
INSERT INTO dbo.unPvt(SalesPersonID,Cust1,Cust2,Cust3,Cust4,Cust5,Cust6)
VALUES
(274,5,6,4,2,6,7),
(275,1,7,2,3,6,8),
(276,0,2,8,9,6,3),
(277,6,3,1,7,6,1),
(278,5,4,9,0,2,0),
(279,2,1,0,1,8,9)
GO

SELECT *
FROM dbo.unPvt


--Unpivot
SELECT SalesPersonId,Customer,Sales
From(
	SELECT SalesPersonId,Cust1,Cust2,Cust3,Cust4,Cust5,Cust6
	FROM unPvt
) up
UNPIVOT
(
	Sales FOR Customer IN(Cust1,Cust2,Cust3,Cust4,Cust5,Cust6)
) as unPvt;
Go


--PAGINATION
SELECT
	ProductID,
	ProductNumber,
	Name as ProductName,
	ListPrice
FROM Production.Product
ORDER BY ProductID
OFFSET 0 ROWS
FETCH NEXT 10 ROWS ONLY;


SELECT
	ProductID,
	ProductNumber,
	Name as ProductName,
	ListPrice
FROM Production.Product
ORDER BY ProductID
OFFSET 10 ROWS
FETCH NEXT 10 ROWS ONLY;


-- EXPRESSÕES PAG 28
SELECT
FirstName + ' ' + LastName as FullName
FROM Person.Person;


SELECT
	(SubTotal + TaxAmt) * 1.05 "TotalDue"
FROM Sales.SalesOrderHeader

SELECT
	Cast((SubTotal + TaxAmt) * 1.05 as numeric(8,2)) "TotalDue"
FROM Sales.SalesOrderHeader

--VARIAVEIS PAG 30

declare @variavel2 int = 30;

declare @variavel int
set @variavel = 20;

Select @variavel ProductID
from Production.Product
where ProductID is not null;


DECLARE @ProductId int = 1;

Select
	ProductID,
	ProductNumber,
	Name AS ProductName
FROM Production.Product
WHERE ProductID = @ProductId