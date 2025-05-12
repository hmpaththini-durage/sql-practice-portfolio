--Top 5 most expensive products
SELECT TOP 5 ProductName, UnitPrice 
FROM Products 
ORDER BY UnitPrice DESC;

--Customers who placed more than 5 orders
SELECT c.CustomerID, c.CompanyName, COUNT(o.OrderID) AS OrderCount 
FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID 
GROUP BY c.CustomerID, c.CompanyName HAVING COUNT(o.OrderID) > 5;

--Total sales (unit price × quantity) per product
SELECT p.ProductName, SUM(od.UnitPrice * od.Quantity) AS TotalSales 
FROM OrderDetails od JOIN Products p ON od.ProductID = p.ProductID 
GROUP BY p.ProductName ORDER BY TotalSales DESC;

--Products never ordered
SELECT ProductName FROM Products WHERE ProductID NOT IN 
(SELECT DISTINCT ProductID FROM OrderDetails);

--Each employee's number of orders handled
SELECT e.EmployeeID, e.FirstName

--Customers who never placed an order
SELECT CustomerID, CompanyName FROM Customers WHERE CustomerID NOT IN 
(SELECT DISTINCT CustomerID FROM Orders WHERE CustomerID IS NOT NULL);

--Average unit price of products per category
SELECT c.CategoryName, AVG(p.UnitPrice) AS AvgPrice 
FROM Products p JOIN Categories c ON p.CategoryID = c.CategoryID 
GROUP BY c.CategoryName ORDER BY AvgPrice DESC;

--Orders in 1997 with customer and employee names
SELECT o.OrderID, o.OrderDate, c.CompanyName AS Customer, e.FirstName

--Top 3 customers by number of orders
SELECT c.CustomerID, c.CompanyName, COUNT(o.OrderID) AS OrderCount 
FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID 
GROUP BY c.CustomerID, c.CompanyName ORDER BY OrderCount DESC LIMIT 3;

--Product with the highest total revenue
SELECT p.ProductName, SUM(od.UnitPrice * od.Quantity) AS TotalRevenue 
FROM OrderDetails od JOIN Products p ON od.ProductID = p.ProductID 
GROUP BY p.ProductName ORDER BY TotalRevenue DESC LIMIT 1;
