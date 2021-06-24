USE [master]
GO

/****** Object:  Database [OrganicShop]  ******/
CREATE DATABASE OrganicShop
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OrganicShop', FILENAME = N'D:\Workplace\SQL Files\MDFs\OrganicShop.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'OrganicShop_log', FILENAME = N'D:\Workplace\SQL Files\LDFs\OrganicShop_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

/************************************* TABLES *******************************/

CREATE TABLE Categories
(
	CategoryId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	CategoryName NVARCHAR(100) NOT NULL,
	CategoryDetail NVARCHAR(500) NULL,
)
GO

CREATE TABLE Products
(
	ProductId  INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	CategoryId INT NOT NULL,
	ProductName NVARCHAR(100) NOT NULL,
	ProductDetail NVARCHAR(500),
	SalesPrice DECIMAL(10, 2),
	ImagePath NVARCHAR(200)
	FOREIGN KEY (CategoryId) REFERENCES Categories(CategoryId)
)
GO

CREATE TABLE SalesOrders
(
	SalesOrderId  INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	ItemsCount INT NOT NULL,
	SOTotal DECIMAL(10, 2) NOT NULL,
	OrderDate DATETIME NOT NULL DEFAULT GETDATE()
)
GO

CREATE TABLE SalesOrderDetail
(
	SODetailId  INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	SalesOrderId  INT NOT NULL,
	ProductId  INT NOT NULL,
	UnitPrice DECIMAL(10, 2) NOT NULL,
	Quantity INT NOT NULL,
	Total DECIMAL(10, 2) NOT NULL,
	FOREIGN KEY (SalesOrderId) REFERENCES SalesOrders(SalesOrderId),
	FOREIGN KEY (ProductId) REFERENCES Products(ProductId)
)
GO

CREATE TABLE SalesOrderShipments
(
	ShipmentId  INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	SalesOrderId  INT NOT NULL,
	CustomerName  NVARCHAR(250) NOT NULL,
	AddressLine1 NVARCHAR(250),
	AddressLine2 NVARCHAR(250),
	City NVARCHAR(50),
	CreateDate DATETIME NOT NULL DEFAULT GETDATE(),
	FOREIGN KEY (SalesOrderId) REFERENCES SalesOrders(SalesOrderId)
)
GO

-- End of File


