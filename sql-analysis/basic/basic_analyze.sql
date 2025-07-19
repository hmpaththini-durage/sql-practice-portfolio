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


--Top 5 most expensive products
	SELECT TOP 5 ProductName, UnitPrice 
	FROM Products 
	ORDER BY UnitPrice DESC;

--Customers who placed more than 5 orders
	SELECT c.CustomerID, c.CompanyName, COUNT(o.OrderID) AS OrderCount FROM Customers c 
		JOIN Orders o ON c.CustomerID = o.CustomerID GROUP BY c.CustomerID, c.CompanyName HAVING COUNT(o.OrderID) > 5;

--Total sales (unit price × quantity) per product
SELECT p.ProductName, SUM(od.UnitPrice * od.Quantity) AS TotalSales FROM OrderDetails od JOIN Products p ON od.ProductID = p.ProductID GROUP BY p.ProductName ORDER BY TotalSales DESC;

--Products never ordered
SELECT ProductName FROM Products WHERE ProductID NOT IN (SELECT DISTINCT ProductID FROM OrderDetails);

--Each employee's number of orders handled
SELECT e.EmployeeID, e.FirstName

--Customers who never placed an order
SELECT CustomerID, CompanyName FROM Customers WHERE CustomerID NOT IN (SELECT DISTINCT CustomerID FROM Orders WHERE CustomerID IS NOT NULL);

--Average unit price of products per category
SELECT c.CategoryName, AVG(p.UnitPrice) AS AvgPrice FROM Products p JOIN Categories c ON p.CategoryID = c.CategoryID GROUP BY c.CategoryName ORDER BY AvgPrice DESC;

--Orders in 1997 with customer and employee names
SELECT o.OrderID, o.OrderDate, c.CompanyName AS Customer, e.FirstName

--Top 3 customers by number of orders
SELECT c.CustomerID, c.CompanyName, COUNT(o.OrderID) AS OrderCount FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID GROUP BY c.CustomerID, c.CompanyName ORDER BY OrderCount DESC LIMIT 3;

--Product with the highest total revenue
SELECT p.ProductName, SUM(od.UnitPrice * od.Quantity) AS TotalRevenue FROM OrderDetails od JOIN Products p ON od.ProductID = p.ProductID GROUP BY p.ProductName ORDER BY TotalRevenue DESC LIMIT 1;