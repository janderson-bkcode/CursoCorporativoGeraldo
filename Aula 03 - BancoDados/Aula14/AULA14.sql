USE MyAdventureWorks

--  AULA 14 30/10/2022 PAGE 5 FUNÇÕES DE DATA

SELECT GETDATE() AS GETDATE,
SYSDATETIME() AS SYSDATETIME

--PAGE 6
SELECT 
	DAY(GETDATE()) AS DAY,
	MONTH(GETDATE()) AS MONTH,
	YEAR(GETDATE()) AS YEAR,
	DATENAME(WEEKDAY,GETDATE()) AS DATENAMEWeekDay,
	DATEPART(M,GETDATE()) AS DATEPART,
	DATEPART(WEEKDAY,GETDATE()) AS DatePartWeekDay,
	DATEPART(MONTH,GETDATE()) AS DateNameMonth;

--PAGE 11

SELECT
	DATEFROMPARTS(1972,5,26) AS DATEFROMPARTS,
	DATETIME2FROMPARTS(1972,5,26,7,14,16,10,3)AS DATETIME2FROMPARTS,
	DATETIMEFROMPARTS(1972,5,26,7,14,16,10)AS DATETIMEFROMPARTS,
	DATETIMEOFFSETFROMPARTS(1972,5,26,7,14,16,10,12,0,3)AS DATETIMEOFFSETFROMPARTS,
	SMALLDATETIMEFROMPARTS(1972,5,26,7,14) AS SMALLDATETIMEFROMPARTS,
	TIMEFROMPARTS(7,14,16,10,3) AS TIMEFROMPARTS

-- PAGE 13

SELECT 
  DATEDIFF(dd,GETDATE(),'14/6/2023') as DaysUntilMyBirthday,
  DATEADD(Y,1,GETDATE()) AS DateAdd,
  EOMONTH(GETDATE()) AS EOMonth, -- New function,
  ISDATE(GETDATE()) AS IsValidDate,
  ISDATE('1/13/2122') AS InvalidDate;

--PAGE 14 CONVERSÃO 

SELECT TOP(10)
	SalesOrderNumber,
	TotalDue,
	CAST(Totaldue as decimal(10,2))AS TotalDueCast,
	OrderDate,
	CAST(OrderDate AS date) AS OrderDateCast
FROM Sales.SalesOrderHeader;


-- PAGE 18
select
CONVERT(VARCHAR(20), GETDATE()) AS [Default],
CONVERT(VARCHAR(20),GETDATE(),100) AS DefaultWithStyle,
CONVERT(VARCHAR(20),GETDATE(),103) AS BritishFrenchStyle,
CONVERT(varchar(20),GETDATE(),105) AS ItalianStyle,
CONVERT(VARCHAR(20),GETDATE(),105) AS ISOSTyle,
CONVERT(varchar(20),CAST('111111.22' AS MONEY),1) as MoneyWithCommas


-- PAGE 22

SELECT 
TRY_CAST('jose da silva' as int) trycast,
TRY_CONVERT(datetime,'2/13/2999',112) AS TRYCONVERT,
PARSE('Saturday,26 May 2012' AS datetime USING 'en-US') as parse,
TRY_PARSE('Jose da silva Birthday' as datetime using 'en-US') as tryparse

--PAGE 25 FUNÇÕES DE STRING

SELECT
	'LEBLANC'+ ',' + 'PATRICK' RawValues,
	RTRIM('LEBLANC  ') + ',' + LTRIM('   PATRICK') TrimValue,
	LEFT('PATRICKDTOMORR',7)[Left],
	RIGHT('DTOMORRLEBLANC',7) [Right],
	SUBSTRING('DTOMORRPATRICK',8,LEN('DTOMORRPATRICK'))[Substring],
	'12/' + CAST(1 As VARCHAR) + '2012' WithoutConcat,
	CONCAT('12/',1,'2012') WithConcat


--PAGE 26
DECLARE @choosevar int =3

select
	CHOOSE(@choosevar,'ONE','TWO','PATRICK','THREE') [Choose],
	IIF(DATENAME(MONTH,GETDATE()) = 'July',
'The 4th is this month','No Fireworks') as [IIF]

--PAGE 28 07/11/2022
SELECT
	SUM(poh.TotalDue) as TotalDue
FROM Purchasing.PurchaseOrderHeader poh


SELECT
	SUM(poh.TotalDue) as [TotalDue],
	AVG(poh.TotalDue) as [Average TotalDue],
	COUNT(poh.EmployeeID)[NumberOfEmployees],
	COUNT(Distinct(poh.EmployeeID)) [DistinctNumberOfEmployees]
FROM Purchasing.PurchaseOrderHeader poh;


--Page 37
SELECT
	sm.Name as ShippingMethod,
	SUM(poh.TotalDue) as [TotalDue],
	AVG(poh.TotalDue) as [Average TotalDue],
	COUNT(poh.EmployeeID)[NumberOfEmployees],
	COUNT(Distinct(poh.EmployeeID)) [DistinctNumberOfEmployees]
FROM Purchasing.PurchaseOrderHeader poh
INNER JOIN Purchasing.ShipMethod sm
	ON(poh.ShipMethodID = sm.ShipMethodID)
GROUP BY sm.Name;

--
SELECT 
sm.Name as ShippingMethod,
	YEAR(poh.orderDate) as OrderYear,
	SUM(poh.TotalDue) as [TotalDue],
	AVG(poh.TotalDue) as [Average TotalDue],
	COUNT(poh.EmployeeID)[NumberOfEmployees],
	COUNT(Distinct(poh.EmployeeID)) [DistinctNumberOfEmployees]
FROM Purchasing.PurchaseOrderHeader poh
INNER JOIN Purchasing.ShipMethod sm
	ON(sm.ShipMethodID = poh.ShipMethodID)
GROUP BY sm.Name,YEAR(poh.OrderDate)

--Page 43

GO 
WITH ProductQty as(

SELECT TOP (10)
	p.ProductID,
	SUM(OrderQty) as orderQty
FROM Sales.SalesOrderDetail as sod
INNER JOIN Production.Product AS p
on (sod.ProductID = p.ProductID)
GROUP BY p.ProductID
)

SELECT 
	p.Name as ProductionName,
	pq.OrderQty,
	ROW_NUMBER() OVER (ORDER BY pq.OrderQty DESC) RowNUmber,
	RANK() OVER(ORDER BY pq.OrderQty DESC)[Rank],
	DENSE_RANK() OVER(ORDER BY pq.OrderQty DESC)[DenseRank]
FROM ProductQty as pq 
INNER JOIN Production.Product AS p
	ON(pq.ProductID = p.ProductID);


--- USANDO HAVING COM FILTRO DO AGRUPAMENTO
SELECT
sm.Name as ShippingMethod,
	YEAR(poh.orderDate) as OrderYear,
	SUM(poh.TotalDue) as [TotalDue],
	AVG(poh.TotalDue) as [Average TotalDue],
	COUNT(poh.EmployeeID)[NumberOfEmployees],
	COUNT(Distinct(poh.EmployeeID)) [DistinctNumberOfEmployees]
FROM Purchasing.PurchaseOrderHeader poh
INNER JOIN Purchasing.ShipMethod sm
	ON (poh.ShipMethodID = sm.ShipMethodID)
GROUP BY sm.Name , YEAR(poh.OrderDate)
HAVING SUM(poh.TotalDue) > 5000000;


--OBJETOS TEMPORÁRIOS PAGE 52

WITH EmployeePOs(EmployeeId,[Total Due])
as
(
	SELECT 
		poh.EmployeeID,CONVERT(varchar(20),SUM(poh.totalDue),1)
	FROM Purchasing.PurchaseOrderHeader poh
	GROUP BY poh.EmployeeID
)
SELECT * FROM EmployeePOS;


WITH EmployeePOS(EmployeeId,[Total Due])
as
(
	SELECT 
		poh.EmployeeID,CONVERT(varchar(20),SUM(poh.totalDue),1)
	FROM Purchasing.PurchaseOrderHeader poh
	GROUP BY poh.EmployeeID
)
SELECT ep.EmployeeId,
		p.FirstName,
		p.LastName,
		ep.[Total Due]
	FROM EmployeePOS ep
	INNER JOIN Person.Person p
	ON(ep.EmployeeId = p.BusinessEntityID);

-- VARIÁVEIS DE TABELA TEMPORÁRIA

DECLARE @EmployeePos AS TABLE (

Employee INT,TotalDue MONEY
)

INSERT INTO @EmployeePos
SELECT
	poh.EmployeeID,
	CONVERT(varchar(20),SUM(poh.TotalDue),1)
	FROM Purchasing.PurchaseOrderHeader poh
GROUP BY poh.EmployeeID;

select * from @EmployeePos

-- 
DECLARE @EEmployeePOS AS TABLE (

EmployeeID INT,TotalDue MONEY
)

INSERT INTO @EEmployeePOS
SELECT
	poh.EmployeeID,
	CONVERT(varchar(20),SUM(poh.TotalDue),1)
	FROM Purchasing.PurchaseOrderHeader poh
GROUP BY poh.EmployeeID;

SELECT ep.EmployeeID,
		p.FirstName,
		p.LastName,
		ep.[TotalDue]
from @EEmployeePOS ep
inner join Person.Person p
ON (ep.EmployeeID = p.BusinessEntityID);
	


--CRIAÇÃO DE TABELA TEMPORÁRIA

CREATE TABLE #EmployyePOS(
EmployeeID int,
TotalDue money
);

INSERT INTO #EmployyePOS
	SELECT poh.EmployeeID,
	CONVERT(varchar(20),SUM(poh.TotalDue))
	from Purchasing.PurchaseOrderHeader poh
	GROUP BY poh.EmployeeID;

SELECT * FROM #EmployyePOS



-- PAGE 75 TRATAMENTO DE ERROS

BEGIN TRY
	SELECT 1/0; --DIVISÃO POR ZERO
	END TRY

	BEGIN CATCH
	THROW
	END CATCH

BEGIN TRY
	SELECT 1/0; --DIVISÃO POR ZERO
	END TRY

	BEGIN CATCH
	THROW 51000,'Você dividiu por zero !!!!',1;
	END CATCH


--TSQ-L
BEGIN 
	DECLARE @StartingHireDate DateTime = '31/12/2001'

	SELECT e.BusinessEntityID,p.FirstName,p.LastName,e.HireDate
	FROM HumanResources.Employee e
	INNER JOIN Person.Person p
	ON (p.BusinessEntityID = e.BusinessEntityID)
	where HireDate <=@StartingHireDate
END

-- IF ELSE
IF(DATENAME(M,GETDATE()) = 'December')
BEGIN
	SELECT 'Chegando Natal' Results
END
ELSE
BEGIN
	SELECT 'Não, ainda não é dezembro :C' Results
END


--WHILE

DECLARE @count INT = 0
WHILE (@count <10)
BEGIN
	SET @count = @count +1;
	IF(@count <5)
		begin
		SELECT @count as Counter
		CONTINUE;
	END
	ELSE
		BREAK;
END
--