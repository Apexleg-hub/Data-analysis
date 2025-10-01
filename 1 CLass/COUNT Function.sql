--The SQL COUNT() Function
--The COUNT() function returns the number of rows that matches a specified criterion.

--Example
--Find the total number of rows in the Products table:

SELECT COUNT(*) FROM ProductS;

--Syntax
SELECT COUNT(column_name) FROM table_name WHERE condition;
===
--Specify Column
--You can specify a column name instead of the asterix symbol (*).

--If you specify a column name instead of (*), NULL values will not be counted.

--Example
--Find the number of products where the ProductName is not null:

SELECT COUNT(ProductName)FROM Products;
===
--Add a WHERE Clause
--You can add a WHERE clause to specify conditions:

--Example
--Find the number of products where Price is higher than 20:

SELECT COUNT(ProductID) FROM Products WHERE Price > 20;

=====
----Ignore Duplicates
--You can ignore duplicates by using the DISTINCT keyword in the COUNT() function.

--If DISTINCT is specified, rows with the same value for the specified column will be counted as one.

--Example
--How many different prices are there in the Products table:

SELECT COUNT(DISTINCT Price)FROM Products;
====

--Use an Alias
--Give the counted column a name by using the AS keyword.

--Example
--Name the column "Number of records":

SELECT COUNT(*) AS [Number of records] FROM Products;

====
--Use COUNT() with GROUP BY
--Here we use the COUNT() function and the GROUP BY clause, to return the number of records for each category in the Products table:

--Example
SELECT COUNT(*) AS [Number of records], CategoryID FROM Products GROUP BY CategoryID;

SELECT COUNT(DISTINCT Price) FROM Products;