
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


-- EXPRESS�ES PAG 28
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

Select @variavel, ProductID
from Production.Product
where ProductID is not null;


DECLARE @ProductId int = 1;

Select
	ProductID,
	ProductNumber,
	Name AS ProductName
FROM Production.Product
WHERE ProductID = @ProductId


--PAG 36
INSERT INTO HumanResources.Department(Name,GroupName,ModifiedDate)
VALUES
('Payroll','Executive General and Administration','06/02/2012');


Select DepartmentID,Name,GroupName,ModifiedDate
from HumanResources.Department
order by DepartmentID DESC


--PAG 39 INSERINDO DESABILITANDO O IDENTITY

SET IDENTITY_INSERT HumanResources.Department ON  --DESABILITANDO O IDENTITY

INSERT INTO HumanResources.Department(DepartmentID,Name,GroupName,ModifiedDate)
VALUES
(18,'International Marketing','Sales and Marketing','05/06/2012');
SET IDENTITY_INSERT HumanResources.Department OFF --HABILITANDO NOVAMENTE O IDENTITY

SELECT DepartmentID,Name,GroupName,ModifiedDate
FROM HumanResources.Department
ORDER BY DepartmentID  DESC

-- PAGINA 44 SEQUENCE

CREATE SEQUENCE HumanResources.SequenciaTeste
AS INT
START WITH 1
INCREMENT BY 1
NO CYCLE 
MINVALUE 1
MAXVALUE 99999;

-- EXEMPLO SEQUENCE 

GO 
IF (OBJECT_ID('dbo.States')) IS NOT NULL
	DROP TABLE dbo.States

GO
CREATE TABLE dbo.States(
StateId		int CONSTRAINT pkStatesStatesId PRIMARY KEY,
StateName	varchar(50),
StateAbbrev	char(2)
);
GO

GO 
CREATE SEQUENCE dbo.StateSeq
AS INT
START WITH 1
INCREMENT BY 1
GO


INSERT INTO dbo.States(StateId,StateAbbrev,StateName)
VALUES
(NEXT VALUE FOR dbo.StateSeq,'LA','Louisiana')

INSERT INTO dbo.States(StateId,StateAbbrev,StateName)
VALUES
(NEXT VALUE FOR dbo.StateSeq,'TX','Texas')
INSERT INTO dbo.States(StateId,StateAbbrev,StateName)
VALUES
(NEXT VALUE FOR dbo.StateSeq,'FL','Florida')

SELECT * FROM dbo.States

INSERT INTO HumanResources.Department
VALUES
('International Sales','Sales and Marketing','26/05/2012'),
('Media Control','Quality Assurance','26/05/2012');

SELECT * from HumanResources.Department
ORDER BY 1 DESC


INSERT INTO HumanResources.Department(Name,GroupName,ModifiedDate)
SELECT
	Name + ' USA',GroupName,ModifiedDate
FROM HumanResources.Department
WHERE DepartmentID IN(22,21);

select * from HumanResources.Department
order by 1 desc

--PAGE 52 SELECT INTO CRIANDO TABELA
SELECT
	DepartmentID,Name,GroupName,ModifiedDate
INTO dbo.Departament
FROM HumanResources.Department

SELECT * from dbo.Departament

--PAGE 54 UPDATE
UPDATE HumanResources.Department
	SET Name = Name + ' Europe'
WHERE DepartmentID = 19

UPDATE HumanResources.Department
	SET Name = Name + 'Europe'
WHERE DepartmentID = 19
and Name not like '% Europe'


UPDATE Production.Product
	SET ListPrice = ListPrice * 1.05
FROM Production.Product p
INNER JOIN Production.ProductSubcategory ps 
	ON(p.ProductSubcategoryID = ps.ProductSubcategoryID)
where
ps.Name = 'Socks';




SELECT * FROM HumanResources.Department
where DepartmentID  = 19

--Procedure
GO
CREATE PROCEDURE [dbo].[sp_generateAuthorizationId]
@ClientId INTEGER,
@OperationTypeId INTEGER,
@PaysmartOperationId VARCHAR(100),
@AuthorizationId INT OUTPUT
AS
BEGIN  

DECLARE @max INT = 1000;
DECLARE @min INT = 999999;

SET @AuthorizationId = round(((@max - @min -1) * rand() + @min), 0)

INSERT INTO HumanResources.Department
VALUES(@AuthorizationId, @ClientId, 0, GETDATE(), @OperationTypeId, @PaysmartOperationId);

END
GO


-----60
use MyAdventureWorks
 DELETE
 FROM HumanResources.Department
 WHERE DepartmentID = 22;

--page 62
DELETE FROM HumanResources.Department
FROM HumanResources.Department d
LEFT OUTER JOIN HumanResources.EmployeeDepartmentHistory ed
	ON(d.DepartmentID = ed.DepartmentID)
WHERE ed.DepartmentID is null;

--PAGE 63 TRUNCATE
TRUNCATE TABLE dbo.Departament

--PAGE 64 DELETE +  ROOLBACK
SELECT JobCandidateID
FROM HumanResources.JobCandidate
WHERE JobCandidateID = 13

BEGIN TRANSACTION;
DELETE
FROM HumanResources.JobCandidate
WHERE JobCandidateID =13;

ROLLBACK;

-- PAGE 65 MERGE
MERGE dbo.Departament destination
	USING HumanResources.Department source
		ON(destination.Name = source.Name)
	WHEN MATCHED THEN
		UPDATE
			SET destination.Name = source.Name,
			destination.GroupName = source.GroupName,
			destination.ModifiedDate = source.ModifiedDate
	WHEN NOT MATCHED BY TARGET THEN
		INSERT(Name,GroupName,ModifiedDate)
		VALUES
		(source.Name,source.GroupName,source.ModifiedDate);

select * from dbo.Departament
select * from HumanResources.Department

--PAGE 70 OUTPUT

INSERT INTO HumanResources.Department
	OUTPUT inserted.DepartmentID, inserted.Name,inserted.GroupName,inserted.ModifiedDate
VALUES('International Marketing Output','Sales and Marketing','26/05/2012');

--PAGE 71
UPDATE HumanResources.Department
	SET Name = Name + ' Europe'
	OUTPUT
		deleted.Name as OldName,
		inserted.Name AS UpdateName
	WHERE DepartmentID != 25;

---PAGE 72 CRIANDO TABELA DE AUDITORIA 
CREATE TABLE dbo.Department_Audit(
DepartmentID		INT NOT NULL,
Name				NVARCHAR(50) NOT NULL,
GroupName			NVARCHAR(50) NOT NULL,
DeleteDate			DATETIME NOT NULL
	CONSTRAINT dfDepartamentAUdit_DeleteDate_Today DEFAULT(GETDATE())
);

--PAGE 74 USANDO DELETE E ALIMENTANDO TABELA DE AUDITORIA
DELETE
	FROM dbo.Departament
	OUTPUT deleted.DepartmentID,deleted.Name,deleted.GroupName
	INTO dbo.Department_Audit(DepartmentID,Name,GroupName)
WHERE DepartmentID = 16;

Select * from dbo.Department_Audit
SELECT * FROM dbo.Departament