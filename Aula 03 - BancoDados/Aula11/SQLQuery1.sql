--Aula11   10/10/22
Use master;

Create Database RoomReservation;

use RoomReservation

CREATE TABLE dbo.Customer(

CustomerId    INT CONSTRAINT nnCustomerCustomerId NOT NULL,
FirstName     NVARCHAR(50) CONSTRAINT nnCustomerFirstName NOT NULL,
LastName      NVARCHAR(50) CONSTRAINT nnCustomerLastName NOT NULL,
Address1      NVARCHAR(100) CONSTRAINT nnCustomerAddress1 NOT NULL,
Address2      NVARCHAR(100)NULL,
PhoneNumber   NVARCHAR(22) CONSTRAINT nnCustomerPhoneNumber NOT NULL,
EmailAddress  VARCHAR(100) NULL,
City		  VARCHAR(100) CONSTRAINT nnCustomerCity NOT NULL,
StateProvince NVARCHAR(100) CONSTRAINT nnCustomerStateProvince NOT NULL,
PostalCode	  NVARCHAR(100) CONSTRAINT nnCustomerPostalCode NOT NULL
);

ALTER TABLE dbo.Customer
	ADD CONSTRAINT pk_Customer_CustomerId 
		PRIMARY KEY CLUSTERED (CustomerId);


CREATE TABLE dbo.Reservation(
ReservationId		INT		   CONSTRAINT nnReservationReservationId NOT NULL,
ArrivalDate			DATETIME   CONSTRAINT nnReservationArrivalDate NOT NULL,
DepartureDate		DATETIME   CONSTRAINT nnReservationDepartureDate NOT NULL,
DailyRate			SMALLMONEY CONSTRAINT nnReservationDailyRate NOT NULL,
ReservationStatusID INT        CONSTRAINT nnReservationReservationStatusId NOT NULL,
CustomerId			INT        CONSTRAINT nnReservationCustomerId NOT NULL,
RoomTypeId			INT        CONSTRAINT nnReservationRoomTypeId NOT NULL
);


ALTER TABLE dbo.Reservation
	ADD CONSTRAINT pk_Reservation_ReservationId 
		PRIMARY KEY CLUSTERED (ReservationId);

----

CREATE TABLE dbo.RoomType(
RoomTypeId		INT			  CONSTRAINT nnRoomTypeRoomTypeId NOT NULL,
RoomDesc		VARCHAR(1000) CONSTRAINT nnRoomTypeRoomTypeId NOT NULL
);

ALTER TABLE dbo.RoomType
	ADD CONSTRAINT pk_RoomType_RoomTypeId
		PRIMARY KEY CLUSTERED(RoomTypeId);


CREATE TABLE dbo.ReservationStatus(
ReservationStatusId		INT			CONSTRAINT nnReservationStatusReservationStatusId NOT NULL,
ReservationStatusDesc   NVARCHAR(50)CONSTRAINT nnReservationStatusResevationStatusDesc NOT NULL
);

ALTER TABLE dbo.ReservationStatus
	ADD CONSTRAINT pk_ReservationStatusReservationStatusId
		PRIMARY KEY (ReservationStatusId);


CREATE TABLE dbo.PaymentType(
PaymentTypeId			INT CONSTRAINT nnPaymentTypePaymentTypeId not null,
PaymentTypeDesc			NVARCHAR(50) CONSTRAINT nnPaymentTypePaymentTypeDesc NOT NULL
);

ALTER TABLE dbo.PaymentType
	ADD CONSTRAINT pk_PaymentTypePaymentTypeId 
		PRIMARY KEY CLUSTERED (PaymentTypeId)

CREATE TABLE CustomerPaymentType(
PaymentTypeId	INT			CONSTRAINT nnCustomerPaymentTypePaymentTypeId NOT NULL,
CustomerId		INT		    CONSTRAINT nnCustomerPaymentTypeCustomerId NOT NULL,
PaymentNotes	VARCHAR(2000) NULL
);

ALTER TABLE CustomerPaymentType
	ADD CONSTRAINT pk_CustomerPaymentTypePaymentTypeCustomerId
		PRIMARY KEY(PaymentTypeId,CustomerId)


ALTER TABLE dbo.Reservation
	ADD CONSTRAINT fk_ReservationCustomerId
		FOREIGN KEY(CustomerId) 
			REFERENCES dbo.Customer(CustomerId)

ALTER TABLE dbo.Reservation
	ADD CONSTRAINT fk_ReservationRoomTypeId
		FOREIGN KEY(RoomTypeId)
			REFERENCES dbo.RoomType(RoomTypeId);

ALTER TABLE dbo.Reservation
	ADD CONSTRAINT fk_ReservationReservationStatusId
		FOREIGN KEY (ReservationStatusId)
			REFERENCES dbo.ReservationStatus(ReservationStatusId);

ALTER TABLE dbo.CustomerPaymentType
	ADD CONSTRAINT fkCustomerPaymentTypePaymentTypeId
		FOREIGN KEY(PaymentTypeId)
			REFERENCES dbo.PaymentType (PaymentTypeId);

ALTER TABLE dbo.CustomerPaymentType
	ADD CONSTRAINT fkCustomerPaymentTypeCustomerId
		FOREIGN KEY (CustomerId)
			REFERENCES dbo.Customer(CustomerId);




GO 

SET NOCOUNT ON;

--INSERINDO REGISTROS NO PaymentType

use RoomReservation

INSERT INTO PaymentType
VALUES
(1,'Visa'),
(2,'MasterCard'),
(3,'American Express')


--Inserindo registo na Customer
INSERT INTO Customer
VALUES
(1,'Greg','Larsen','123 Some Place',NULL,'123-456-7890',Null,'MyCity','MA','12345');

--Inserindo registros na ReservationStatus

INSERT INTO ReservationStatus
VALUES
(1,'Blocked'),
(2,'Cancelled');

INSERT INTO RoomType
VALUES
(1,'KingSize'),
(2,'Queen'),
(3,'Double');

--Violando a restri��o NOT NULL

INSERT INTO Reservation
	VALUES(1,'2011-8-1 5:00 PM','2011-8-2 9:00 AM',150.99,NULL,1,1);

--Violando a restri��o Primary KEY 
INSERT INTO RoomType
VALUES(3,'Suite')

--VIOLANDO A RESTRI��O DE CHAVE ESTRANGEIRA
INSERT INTO CustomerPaymentType
VALUES(1,2,'Will need an internet connection');

--NOT NULL CONSTRAINT
INSERT INTO Reservation
VALUES(1,'2011-8-1 5:00 PM','2011-8-2 9:00 AM',150.99,1,1,1);

--PRIMARY KEY CONSTRAINT
INSERT INTO PaymentType
VALUES(4,'Suite')

--FOREIGN KEY CONSTRAINT
INSERT INTO CustomerPaymentType
VALUES
(1,1,'Will need an internet connection');

---SELECT 
use MyAdventureWorks

SELECT DepartmentID,Name,Groupname,ModifiedDate 
FROM HumanResources.Department;

SELECT ProductCategoryID,Name
FROM Production.ProductCategory
where ProductCategoryID <2

SELECT * FROM HumanResources.Department;

SELECT *
FROM Production.Product
WHERE Color = 'Blue'
AND ProductID > 900;

SELECT  *
FROM Production.Product
WHERE ProductID > 900
AND(Color ='Blue' OR COLOR = 'Green');


SELECT  *
FROM Production.Product
WHERE ProductID > 900
AND NOT (Color ='Blue' OR COLOR = 'Green');





