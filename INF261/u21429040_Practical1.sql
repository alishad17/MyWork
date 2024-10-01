-- Question 1 --

USE master

If Exists (SELECT * FROM sys.databases where name = 'StoreDB')
Drop Database StoreDB
GO
Create Database StoreDB
GO

USE StoreDB

CREATE TABLE Customer
(
CustomerID int identity(1,1) Primary Key not null,
Customer_FirstName varchar (255) not null,
Customer_LastName varchar (255) not null,
Customer_Address varchar (255) not null,
Customer_Email varchar (255) not null
)
GO

CREATE TABLE [Order]
(
OrderID int identity (1,1) Primary Key not null,
OrderDate Date not null,
TotalAmount float (20) not null,
Customer_ID int references Customer(CustomerID),
)
GO

CREATE TABLE Product
(
ProductID int identity (1,1) Primary Key not null,
ProductName varchar (255) not null,
Price float (12) not null,
[Description] varchar (255) not null
)

CREATE TABLE ProductStatus
(
StatusID int identity (1,1) Primary Key not null,
StatusDescription varchar (255) not null
)

CREATE TABLE OrderItem
(
OrderID int references [Order](OrderID),
ProductID int references Product(ProductID),
OrderItemID int identity (1,1) Primary Key not null,
Quantity Int not null,
Subtotal float (12) not null,
StatusID int references ProductStatus(StatusID),
)

-- Question 2 --

insert into Customer values ('John', 'Doe','123 Main St','john.doe@example.com')
insert into [Order] values ('2023-07-05',100.50,1)
insert into Product values ('Widget',19.99,'A useful widget for everyday tasks')
insert into ProductStatus values ('Processing')
insert into OrderItem values (1,1,2,39.98,1)

-- Question 3 --
SELECT c.CustomerID, c.Customer_FirstName, c.Customer_LastName,c.Customer_Address,c.Customer_Email,
o.OrderID,o.OrderDate,o.TotalAmount,
p.ProductID,p.ProductName,p.Price,p.[Description],
i.OrderItemID,i.Quantity,i.Subtotal,
s.StatusID,s.StatusDescription
FROM Customer AS C
INNER JOIN [Order] AS O
ON c.CustomerID = o.Customer_ID
INNER JOIN OrderItem AS I
ON o.OrderID = i.OrderID
INNER JOIN ProductStatus AS S
ON s.StatusID = i.StatusID
INNER JOIN Product AS P
ON p.ProductID = i.ProductID

-- Question 4 --

CREATE PROCEDURE spAddCustomer 
@Customer_FirstName Varchar(255), 
@Customer_LastName Varchar(255),
@Customer_Address Varchar(255),
@Customer_Email Varchar(255)
AS
BEGIN TRY
BEGIN TRANSACTION
INSERT INTO Customer VALUES(@Customer_FirstName, @Customer_LastName, @Customer_Address, @Customer_Email)
COMMIT
PRINT 'Customer Added'
END TRY
BEGIN CATCH
ROLLBACK TRANSACTION
PRINT 'Transaction Rolled Back'
END CATCH


-- Question 5 --
EXEC spAddCustomer 'Jane', 'Doe', '123 Main St', 'jane.doe@example.com'
SELECT * FROM Customer