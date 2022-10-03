use master

select * from sys.master_files

Create Database bkBankAula10
ON primary
(
	Name = 'bkBankAula10',
	FileName = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BkBankAula10.mdf',
	Size = 10MB,MAXSIZE = 20,FILEGROWTH = 10%
)

LOG ON
(NAME = 'bkBankAula10_log',
FILENAME ='C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BkBankAula10_log.ldf',
Size = 10MB,MAXSIZE = 200,FILEGROWTH = 20%
);

--

ALTER Database bkBankAula10
	ADD FILEGROUP bkBankAula10Group1;

------------------

	ALTER Database bkBankAula10
	ADD FILE (
		NAME = 'bkBankAula10a',
		FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BkBankAula10a.ndf',
		SIZE = 10MB,
		MAXSIZE = 20,
		FILEGROWTH = 10%
	)TO FILEGROUP bkBankAula10Group1;

---------

USE bkBankAula10;

GO
CREATE SCHEMA Sales;

GO
CREATE SCHEMA HumanResources;

GO
----------------------------------------
Use bkBankAula10

Create Table HumanResources.Address(
AddressID int Constraint nnAddressAddressID NOT NULL IDENTITY(1,1),
StreetAddress	Varchar(125) Constraint nnAddressStreetAddress NOT NULL,
StreetAddress2  Varchar(75) Constraint nnAddressStreetAddress2 NOT NULL,
City			Varchar(100)Constraint nnAddressCity NOT NULL,
State			CHAR(2)Constraint nnAddressState NOT NULL,
EmployeeID		INT constraint nnAddressEmployed not null
)ON bkBankAula10Group1;

--
select * from sys.sysconstraints 
select * from sys.foreign_keys
select * from sys.key_constraints -- pk/uk
select * from sys.check_constraints
select * from sys.default_constraints
---------------
CREATE TABLE HumanResources.Employee(
	EmployeeID INT CONSTRAINT nnEmployeeEmployeeID NOT NULL IDENTITY(1,1),
	FirstName VARCHAR(50) CONSTRAINT nnEmployeeFirstName NOT NULL,
	MiddleName VARCHAR(50) NULL,
	LastName VARCHAR(50) CONSTRAINT nnEmployeeLastName NOT NULL
) ON bkBankAula10Group1;

ALTER TABLE HumanResources.Employee
	ADD GENDER CHAR(1) CONSTRAINT nnEmployeeGender NOT NULL;

--------

use bkBankAula10

ALTER TABLE HumanResources.Employee
	ADD FullName as LastName + ' ' + FirstName;

--
Use bkBankAula10
	ALTER TABLE HumanResources.Employee
	ADD	 SocialSecurityNumber Varchar(10)
		CONSTRAINT nnEmployeeSocialSecurityNumber NOT NULL;

	ALTER TABLE HumanResources.Employee
		ADD Active BIT
		CONSTRAINT nnEmployeeActive NOT NULL;

	ALTER TABLE HumanResources.Employee
	 ADD CONSTRAINT pkHumanResourceEmployeeID
		PRIMARY KEY(EmployeeID);
	
	ALTER TABLE HumanResources.Address
	  ADD CONSTRAINT pkHumanResourceAddressID
		PRIMARY KEY(AddressID);