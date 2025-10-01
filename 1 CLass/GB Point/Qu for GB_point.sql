USE GB_POINT;

SELECT MAX(Price)
FROM Products;

SELECT MIN(Price) AS SmallestPrice FROM Products;

SELECT MIN(Price) AS SmallestPrice, CategoryID FROM Products

GROUP BY CategoryID;


SELECT MAX(week_1)
FROM petty_Cash
WHERE week_1> 3000;

SELECT MIN(week_1)
FROM petty_Cash
WHERE week_1 <2500;

SELECT DISTINCT DESCRIPTION, week_3, week_1
FROM petty_Cash;

SELECT Country FROM Customers;

SELECT * FROM Customers
WHERE CustomerID=43;

SELECT * FROM Customers
WHERE ContactName = 'John Steel';


SELECT * FROM Customers
WHERE Country='Germany';

SELECT * FROM Products
ORDER BY Price;

SELECT * FROM Products
ORDER BY Price DESC;

SELECT * FROM Products
ORDER BY ProductName DESC;

SELECT * FROM Customers
ORDER BY Country, CustomerName;

SELECT * FROM Customers
ORDER BY Country ASC, CustomerName DESC;

SELECT *
FROM Customers
WHERE Country = 'Spain' AND CustomerName LIKE 'G%';
-- Being specific
SELECT * FROM Customers
WHERE Country = 'Germany'
AND City = 'Berlin'
AND PostalCode > 12000;

SELECT * FROM Customers
WHERE Country = 'Spain' AND (CustomerName LIKE 'G%' OR CustomerName LIKE 'R%');

SELECT * FROM Categories
WHERE CategoryID= 1; 


SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
FROM Orders
INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;

SELECT ProductID, ProductName, CategoryName
FROM Products
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID;




select Employee.employeeid, orders.orderid, orders.OrderDate
from Employee
inner join Orders
On Employee.EmployeeID =orders.EmployeeID
order by Employee.EmployeeID;


SELECT Orders.OrderID, Customers.CustomerName, Shippers.ShipperName
FROM ((Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID)
INNER JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID);