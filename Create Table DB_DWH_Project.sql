CREATE TABLE DimCustomer (
	CustomerID [int] NOT NULL,
	CustomerName [varchar](100) NOT NULL,
	Age [int] NOT NULL,
	Gender [varchar](50) NOT NULL,
	City [varchar](50) NOT NULL,
	NoHP [varchar](50) NOT NULL,
	Primary Key (CustomerID)
);

CREATE TABLE DimProduct (
	ProductID [int] NOT NULL,
	ProductName [varchar](255) NOT NULL,
	ProductCategory [varchar](255) NOT NULL,
	ProductUnitPrice [int] NOT NULL,
	Primary Key (ProductID)
 );

CREATE TABLE DimStatusOrder (
	StatusID [int] NOT NULL,
	StatusOrder [varchar](50) NOT NULL,
	StatusOrderDesc [varchar](50) NOT NULL,
	Primary Key (StatusID)
);

CREATE TABLE FactSalesOrder (
	OrderID [int] NOT NULL,
	CustomerID [int] NOT NULL,
	ProductID [int] NOT NULL,
	Quantity [int] NOT NULL,
	Amount [int] NOT NULL,
	StatusID [int] NOT NULL,
	OrderDate [date] NOT NULL,
	Primary Key (OrderID),
	FOREIGN KEY (StatusID) REFERENCES DimStatusOrder (StatusID),
	FOREIGN KEY (ProductID) REFERENCES DimProduct (ProductID),
	FOREIGN KEY (CustomerID) REFERENCES DimCustomer (CustomerID)
);