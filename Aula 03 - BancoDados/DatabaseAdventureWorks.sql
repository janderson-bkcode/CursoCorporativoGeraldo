USE master;

CREATE DATABASE MyAdventureWorks   
    ON (FILENAME = 'D:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\AdventureWorks_Data.mdf')    
    FOR ATTACH;  

USE MyAdventureWorks;