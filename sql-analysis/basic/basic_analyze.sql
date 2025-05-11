--Show a list of all products with their unit price
SELECT ProductName, UnitPrice FROM Products;

--List customers and their contact names
SELECT CompanyName, ContactName FROM Customers;

--List all employees and their titles
SELECT FirstName, LastName, Title FROM Employees;

--Show orders with order date and ship country
SELECT OrderID, OrderDate, ShipCountry FROM Orders;

--Get all products that cost more than $50
SELECT ProductName, UnitPrice FROM Products WHERE UnitPrice > 50;

--List employees who live in London
SELECT FirstName, LastName, City FROM Employees WHERE City = 'London';

--Join orders with customers to show OrderID, CustomerName
SELECT o.OrderID, c.CompanyName FROM Orders o JOIN Customers c ON o.CustomerID = c.CustomerID;

--Join products with suppliers to list ProductName and SupplierName
SELECT p.ProductName, s.CompanyName AS Supplier FROM Products p JOIN Suppliers s ON p.SupplierID = s.SupplierID;

--Show number of products in each category
SELECT c.CategoryName, COUNT(p.ProductID) AS ProductCount FROM Products p JOIN Categories c ON p.CategoryID = c.CategoryID GROUP BY c.CategoryName;

--List all orders and which employee processed them
SELECT o.OrderID, e.FirstName + ' ' + e.LastName AS Employee FROM Orders o JOIN Employees e ON o.EmployeeID = e.EmployeeID;
