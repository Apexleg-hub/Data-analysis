use GB_Point212;

select * from customers;
select * from Products;
select * from Categories;
 select * from OrderDetails
 select * from Orders
 select * from prices;
  
SELECT * FROM Products
WHERE ProductName BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'
ORDER BY ProductName;

SELECT * FROM Orders
WHERE OrderDate BETWEEN 07/01/1996 AND 07/31/1996;

SELECT CustomerID AS ID
FROM Customers;

SELECT count(*) as hold, AVG(price) as Middle, SUM(price) as Number from products;

SELECT Orders., Customers.CustomerName, Orders.OrderDate
FROM Categories;
INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;