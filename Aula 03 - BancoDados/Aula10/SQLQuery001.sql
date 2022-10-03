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

drop database bkBankAula10