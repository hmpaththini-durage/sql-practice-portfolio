-- Create Customer Tabel 
CREATE TABLE Customers (
    CustomerID VARCHAR(5) PRIMARY KEY,
    CompanyName VARCHAR(100),
    ContactName VARCHAR(100),
    ContactTitle VARCHAR(100),
    Address VARCHAR(150),
    City VARCHAR(100),
    Region VARCHAR(100),
    PostalCode VARCHAR(20),
    Country VARCHAR(50),
    Phone VARCHAR(50),
    Fax VARCHAR(50)
);

-- Create Employees Tabel 
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    LastName VARCHAR(50),
    FirstName VARCHAR(50),
    Title VARCHAR(100),
    TitleOfCourtesy VARCHAR(50),
    BirthDate DATE,
    HireDate DATE,
    Address VARCHAR(150),
    City VARCHAR(100),
    Region VARCHAR(50),
    Country VARCHAR(50),
    HomePhone VARCHAR(50),
    Salary DECIMAL(10, 2)
);

-- Create Region Tabel 
CREATE TABLE Region (
    RegionID INT PRIMARY KEY,
    RegionDescription VARCHAR(100)
);

-- Create Territories Tabel 
CREATE TABLE Territories (
    TerritoryID VARCHAR(10) PRIMARY KEY,
    TerritoryDescription VARCHAR(100),
    RegionID INT,
    FOREIGN KEY (RegionID) REFERENCES Region(RegionID)
);

-- Create EmployeeTerritories Tabel 
CREATE TABLE EmployeeTerritories (
    EmployeeID INT,
    TerritoryID VARCHAR(10),
    PRIMARY KEY (EmployeeID, TerritoryID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (TerritoryID) REFERENCES Territories(TerritoryID)
);

-- Create Suppliers Tabel 
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    CompanyName VARCHAR(100),
    ContactName VARCHAR(100),
    ContactTitle VARCHAR(100),
    Address VARCHAR(150),
    City VARCHAR(100),
    Region VARCHAR(50),
    PostalCode VARCHAR(20),
    Country VARCHAR(50),
    Phone VARCHAR(50),
    Fax VARCHAR(50),
    HomePage TEXT
);

-- Create Shippers Tabel 
CREATE TABLE Shippers (
    ShipperID INT PRIMARY KEY,
    CompanyName VARCHAR(100),
    Phone VARCHAR(50)
);

-- Create Categories Tabel 
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100),
    Description TEXT
);

-- Create Products Tabel 
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    SupplierID INT,
    CategoryID INT,
    QuantityPerUnit VARCHAR(50),
    UnitPrice DECIMAL(10, 4),
    UnitsInStock INT,
    UnitsOnOrder INT,
    ReorderLevel INT,
    Discontinued BIT,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Create Orders Tabel 
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID VARCHAR(5),
    EmployeeID INT,
    OrderDate DATETIME,
    RequiredDate DATETIME,
    ShippedDate DATETIME,
    ShipVia INT,
    Freight DECIMAL(10, 4),
    ShipName VARCHAR(100),
    ShipAddress VARCHAR(150),
    ShipCity VARCHAR(100),
    ShipRegion VARCHAR(50),
    ShipPostalCode VARCHAR(20),
    ShipCountry VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ShipVia) REFERENCES Shippers(ShipperID)
);

-- Create OrderDetails Tabel 
CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    UnitPrice DECIMAL(10, 4),
    Quantity INT,
    Discount DECIMAL(4, 2),
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);