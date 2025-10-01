 Introduction to SQL
SQL is a standard language for accessing and manipulating databases.

SQL is a standard language for storing, manipulating and retrieving data in databases.

What is SQL?
SQL stands for Structured Query Language
SQL lets you access and manipulate databases
SQL became a standard of the American National Standards Institute (ANSI) in 1986, and of the International Organization for 
Standardization (ISO) in 1987

What Can SQL do?
SQL can execute queries against a database
SQL can retrieve data from a database
SQL can insert records in a database
SQL can update records in a database
SQL can delete records from a database
SQL can create new databases
SQL can create new tables in a database
SQL can create stored procedures in a database
SQL can create views in a database
SQL can set permissions on tables, procedures, and views
SQL is a Standard - BUT....
Although SQL is an ANSI/ISO standard, there are different versions of the SQL language.

However, to be compliant with the ANSI standard, they all support at least the major commands (such as SELECT, UPDATE, DELETE, INSERT, WHERE) 
in a similar manner.

Note: Most of the SQL database programs also have their own proprietary extensions in addition to the SQL standard!

Using SQL in Your Web Site
To build a web site that shows data from a database, you will need:

An RDBMS database program (i.e. MS Access, SQL Server, MySQL)
To use a server-side scripting language, like PHP or ASP
To use SQL to get the data you want
To use HTML / CSS to style the page


--RDBMS
--RDBMS stands for Relational Database Management System.

--RDBMS is the basis for SQL, and for all modern database systems such as MS SQL Server, IBM DB2, Oracle, MySQL, and Microsoft Access.

--The data in RDBMS is stored in database objects called tables. A table is a collection of related data entries and it consists of columns and rows.

-Look at the "Customers" table:

--Example
SELECT * FROM Customers;
LIMIT 4

--Every table is broken up into smaller entities called fields. The fields in the Customers table consist of CustomerID, CustomerName, 
--ContactName, Address, City, PostalCode and Country. A field is a column in a table that is designed to maintain specific information about 
--every record in the table.

--A record, also called a row, is each individual entry that exists in a table. For example, there are 91 records in the above Customers table.
-- A record is a horizontal entity in a table.

--column is a vertical entity in a table that contains all information associated with a specific field in a table.



########################################################
########################################################

===
The SQL INSERT INTO Statement
---#############################################

--The INSERT INTO statement is used to insert new records in a table.

--INSERT INTO Syntax
--It is possible to write the INSERT INTO statement in two ways:

--1. Specify both the column names and the values to be inserted:

--INSERT INTO table_name (column1, column2, column3, ...)
--VALUES (value1, value2, value3, ...);

======
---2. If you are adding values for all the columns of the table, you do not need to specify the column names in the SQL query. 
--However, make sure the order of the values is in the same order as the columns in the table. Here, the INSERT INTO syntax would be as follows:

--INSERT INTO table_name
--VALUES (value1, value2, value3, ...);
======
--INSERT INTO Example
--The following SQL statement inserts a new record in the "Customers" table:

--Example

INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES ('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway');

--The CustomerID column is an auto-increment field and will be generated automatically when a new record is inserted into the table.
======

---Insert Data Only in Specified Columns
---It is also possible to only insert data in specific columns.

--The following SQL statement will insert a new record, but only insert data in the "CustomerName", "City", 
---and "Country" columns (CustomerID will be updated automatically):

--Example
INSERT INTO Customers (CustomerName, City, Country)
VALUES ('Cardinal', 'Stavanger', 'Norway');

=======
--Insert Multiple Rows
--It is also possible to insert multiple rows in one statement.

---To insert multiple rows of data, we use the same INSERT INTO statement, but with multiple values:

--Example

INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES
('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway'),
('Greasy Burger', 'Per Olsen', 'Gateveien 15', 'Sandnes', '4306', 'Norway'),
('Tasty Tee', 'Finn Egan', 'Streetroad 19B', 'Liverpool', 'L1 0AA', 'UK');

--Make sure you separate each set of values with a comma ,

#######################################################
#######################################################

SQL UPDATE Statement
--#####################################################

--The UPDATE statement is used to modify the existing records in a table.

UPDATE Syntax
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;

--Note: when updating records in a table! Notice the WHERE clause in the UPDATE statement. 
---The WHERE clause specifies which record(s) 
---that should be updated. If you omit the WHERE clause, all records in the table will be updated!

=====

--UPDATE Table
--The following SQL statement updates the first customer (CustomerID = 1) with a new contact person and a new city.

--Example

UPDATE Customers
SET ContactName = 'Alfred Schmidt', City= 'Frankfurt'
WHERE CustomerID = 1;
====

--UPDATE Multiple Records
--It is the WHERE clause that determines how many records will be updated.

--The following SQL statement will update the ContactName to "Juan" for all records where country is "Mexico":

Example:

UPDATE Customers
SET ContactName='Juan'
WHERE Country='Mexico';

=====
---Update Warning!
--Be careful when updating records. If you omit the WHERE clause, ALL records will be updated!

Example
UPDATE Customers
SET ContactName='Juan';



#######################################################
#######################################################


SQL SELECT DISTINCT Statement
--######################################################

--The SQL SELECT DISTINCT Statement

--The SELECT DISTINCT statement is used to return only distinct (different) values.

--Example
-- Select all the different countries from the "Customers" table:

-- SELECT DISTINCT Country FROM Customers;
-- Inside a table, a column often contains many duplicate values; and sometimes you only want to list the different (distinct) values.

--Syntax
SELECT DISTINCT column1, column2, ...
FROM table_name;



SELECT Example Without DISTINCT
--If you omit the DISTINCT keyword, the SQL statement returns the "Country" value from all the records of the "Customers" table:

--Example
SELECT Country,City FROM Customers;

--______________________________________________________________________
#######################################################
#######################################################
-The SQL WHERE Clause
--####################################################

--The WHERE clause is used to filter records.

--It is used to extract only those records that fulfill a specified condition.


--Select all customers from Germany:

SELECT * FROM Customers
WHERE Country='Germany';

--Note: The WHERE clause is not only used in SELECT statements, it is also used in UPDATE, DELETE, etc.!


--Text Fields vs. Numeric Fields
--SQL requires single quotes around text values (most database systems will also allow double quotes).

---However, numeric fields should not be enclosed in quotes:


SELECT * FROM Customers
WHERE CustomerID=1;


----Operators in The WHERE Clause
--You can use other operators than the = operator to filter the search.


---Select all customers with a CustomerID greater than 80:

SELECT * FROM Customers
WHERE CustomerID > 2;


--The following operators can be used in the WHERE clause:

--Operator	Description	Example
-- =	Equal	
-- >	Greater than	
--<	Less than	
-->=	Greater than or equal	
--<=	Less than or equal	
--<>	Not equal. Note: In some versions of SQL this operator may be written as !=	
-- BETWEEN	Between a certain range	
-- LIKE	Search for a pattern	
-- IN	To specify multiple possible values for a column

--_______________________________________________________________________________________

--SQL ORDER BY Keyword
--#################################################


--The SQL ORDER BY
--The ORDER BY keyword is used to sort the result-set in ascending or descending order.

--Example
--Sort the products by price:

SELECT * FROM Products
ORDER BY Price;


SELECT * FROM Products
ORDER BY Productname;

--Column using number
SELECT * FROM Products
ORDER BY 3

--Using two or more column
SELECT * FROM Products
ORDER BY Unit, Price

--Put Product in a decending order
SELECT * FROM Products
ORDER BY Unit, productname DESC

--Sort by
SELECT productID
FROM Products

SELECT Distinct productID
FROM Products

SELECT Distinct productID, ProductName, Unitprice, UnitsInstock
FROM Products

SELECT Distinct AS 'id', ProductID, ProductName AS 'Name', Unitprice, UnitsInstock
FROM Products


--Syntax
SELECT column1, column2, ...
FROM table_name
ORDER BY column1, column2, ... ASC|DESC;

--------
SELECT * FROM Products


--Demo Database
--Below is a selection from the Products table used in the examples:

--DESC
--The ORDER BY keyword sorts the records in ascending order by default. To sort the records in descending order, 
use the DESC keyword.

--Example
--Sort the products from highest to lowest price:

SELECT * FROM Products
ORDER BY Price DESC;

--Order Alphabetically
--For string values the ORDER BY keyword will order alphabetically:

--Example
--Sort the products alphabetically by ProductName:

SELECT * FROM Products
ORDER BY ProductName;

--Alphabetically DESC
--To sort the table reverse alphabetically, use the DESC keyword:

--Example
--Sort the products by ProductName in reverse order:

SELECT * FROM Products
ORDER BY ProductName DESC;

--ORDER BY Several Columns
--The following SQL statement selects all customers from the "Customers" table, sorted by the "Country" and the 
--"CustomerName" column. This means that it orders by Country, but if some rows have the same Country, it orders them by CustomerName:

--Example
SELECT * FROM Customers
ORDER BY Country, CustomerName;

--Using Both ASC and DESC
--The following SQL statement selects all customers from the "Customers" table, sorted ascending by the "Country" and 
--descending by the "CustomerName" column:

--Example
SELECT * FROM Customers
ORDER BY Country ASC, CustomerName DESC;
--______________________________________________________________________________


--The SQL COUNT() Function
--######################################################

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
--===========================================================================

########################################################
########################################################

SQL AND Operator
--##################################################

--The SQL AND Operator
--The WHERE clause can contain one or many AND operators.

--The AND operator is used to filter records based on more than one condition, like if you want to return all customers 
from Spain that starts with the letter 'G':

--Example

Select all customers from Spain that starts with the letter 'G':
SELECT *
FROM Customers
WHERE Country = 'Spain' AND CustomerName LIKE 'G%';

Syntax
SELECT column1, column2, ...
FROM table_name
WHERE condition1 AND condition2 AND condition3 ...;

AND vs OR
The AND operator displays a record if all the conditions are TRUE.

The OR operator displays a record if any of the conditions are TRUE.

--Demo Database
--Below is a selection from the Customers table used in the examples:

CustomerID	CustomerName	ContactName	Address	City	PostalCode	Country
1

Alfreds Futterkiste	Maria Anders	Obere Str. 57	Berlin	12209	Germany
2	Ana Trujillo Emparedados y helados	Ana Trujillo	Avda. de la Constitución 2222	México D.F.	05021	Mexico
3	Antonio Moreno Taquería	Antonio Moreno	Mataderos 2312	México D.F.	05023	Mexico
4

Around the Horn	Thomas Hardy	120 Hanover Sq.	London	WA1 1DP	UK
5	Berglunds snabbköp	Christina Berglund	Berguvsvägen 8	Luleå	S-958 22	Sweden


--All Conditions Must Be True
--The following SQL statement selects all fields from Customers where Country is "Germany" AND City is "Berlin" AND PostalCode is higher than 12000:

--Example

SELECT * FROM Customers
WHERE Country = 'Germany'
AND City = 'Berlin'
AND PostalCode > 12000;


Combining AND and OR
You can combine the AND and OR operators.

--The following SQL statement selects all customers from Spain that starts with a "G" or an "R".

--Make sure you use parenthesis to get the correct result.

--Example
--Select all Spanish customers that starts with either "G" or "R":

SELECT * FROM Customers
WHERE Country = 'Spain' AND (CustomerName LIKE 'G%' OR CustomerName LIKE 'R%');

--Without parenthesis, the select statement will return all customers from Spain that starts with a "G", plus all customers that starts with
-- an "R", regardless of the country value:

--Example
Select all customers that either:
are from Spain and starts with either "G", or
starts with the letter "R":

SELECT * FROM Customers
WHERE Country = 'Spain' AND CustomerName LIKE 'G%' OR CustomerName LIKE 'R%';

########################################################
########################################################

SQL OR Operator
---#######################################

The SQL OR Operator
The WHERE clause can contain one or more OR operators.

The OR operator is used to filter records based on more than one condition, like if you want to 
return all customers from Germany but also those from Spain:

Example
Select all customers from Germany or Spain:

SELECT *
FROM Customers
WHERE Country = 'Germany' OR Country = 'Spain';

Syntax
SELECT column1, column2, ...
FROM table_name
WHERE condition1 OR condition2 OR condition3 ...;

OR vs AND
The OR operator displays a record if any of the conditions are TRUE.

The AND operator displays a record if all the conditions are TRUE.

Demo Database
Below is a selection from the Customers table used in the examples:

CustomerID	CustomerName	ContactName	Address	City	PostalCode	Country
1

Alfreds Futterkiste	Maria Anders	Obere Str. 57	Berlin	12209	Germany
2	Ana Trujillo Emparedados y helados	Ana Trujillo	Avda. de la Constitución 2222	México D.F.	05021	Mexico
3	Antonio Moreno Taquería	Antonio Moreno	Mataderos 2312	México D.F.	05023	Mexico
4   Around the Horn	Thomas Hardy	120 Hanover Sq.	London	WA1 1DP	UK
5	Berglunds snabbköp	Christina Berglund	Berguvsvägen 8	Luleå	S-958 22	Sweden


At Least One Condition Must Be True
The following SQL statement selects all fields from Customers where either City is "Berlin", CustomerName starts with the letter "G" or Country is "Norway":

Example

SELECT * FROM Customers
WHERE City = 'Berlin' OR CustomerName LIKE 'G%' OR Country = 'Norway';

Combining AND and OR
You can combine the AND and OR operators.

The following SQL statement selects all customers from Spain that starts with a "G" or an "R".

Make sure you use parenthesis to get the correct result.

Example
Select all Spanish customers that starts with either "G" or "R":

SELECT * FROM Customers
WHERE Country = 'Spain' AND (CustomerName LIKE 'G%' OR CustomerName LIKE 'R%');

Without parenthesis, the select statement will return all customers from Spain that starts with a "G", plus all customers that 
starts with an "R", regardless of the country value:

Example
Select all customers that either:
are from Spain and starts with either "G", or
starts with the letter "R":

SELECT * FROM Customers
WHERE Country = 'Spain' AND CustomerName LIKE 'G%' OR CustomerName LIKE 'R%';


########################################################
########################################################

The NOT Operator
--###################################################
--The NOT operator is used in combination with other operators to give the opposite result, also called the negative result.

-- In the select statement below we want to return all customers that are NOT from Spain:

--Example            
--Select only the customers that are NOT from Spain:

SELECT * FROM Customers
WHERE NOT Country = 'Spain';

select * from Products
Where unitprice > 10 AND NOT UnitsInstock >=100

select * from Products
Where unitprice > 10 AND UnitsInstock >100
 
select * from Products
Where unitprice > 10 OR UnitsInstock >100

########################################################
########################################################
--SQL Aggregate Functions
--An aggregate function is a function that performs a calculation on a set of values, and returns a single value.

--Aggregate functions are often used with the GROUP BY clause of the SELECT statement. 
The GROUP BY clause splits the result-set into groups of values and the aggregate function 
can be used to return a single value for each group.

--The most commonly used SQL aggregate functions are:

--MIN() - returns the smallest value within the selected column
--MAX() - returns the largest value within the selected column
--COUNT() - returns the number of rows in a set
--SUM() - returns the total sum of a numerical column
--AVG() - returns the average value of a numerical column
--Aggregate functions ignore null values (except for COUNT()).

#####################################################
#####################################################

--The SQL MIN() and MAX() Functions
--The MIN() function returns the smallest value of the selected column.

--The MAX() function returns the largest value of the selected column.

--MIN Example
--Find the lowest price in the Price column:

SELECT MIN(Price)
FROM Products;

=====

---MAX Example
--Find the highest price in the Price column:

SELECT MAX(Price)
FROM Products;

--Syntax
SELECT MIN(column_name)
FROM table_name
WHERE condition;

SELECT MAX(column_name)
FROM table_name
WHERE condition;
======

--Set Column Name (Alias)
---When you use MIN() or MAX(), the returned column will not have a descriptive name. To give the column a descriptive name, use the AS keyword:

--Example
SELECT MIN(Price) AS SmallestPrice
FROM Products;
=====
--Use MIN() with GROUP BY
--Here we use the MIN() function and the GROUP BY clause, to return the smallest price for each category in the Products table:

--Example
SELECT MIN(Price) AS SmallestPrice, CategoryID
FROM Products
GROUP BY CategoryID;

#####################################################
#####################################################

The SQL COUNT() Function
--#########################################
--The COUNT() function returns the number of rows that matches a specified criterion.

--Example
--Find the total number of rows in the Products table:

SELECT COUNT(*)
FROM Products;

--Syntax
SELECT COUNT(column_name)
FROM table_name
WHERE condition;
===
--Specify Column
--You can specify a column name instead of the asterix symbol (*).

--If you specify a column name instead of (*), NULL values will not be counted.

--Example
--Find the number of products where the ProductName is not null:

SELECT COUNT(ProductName)
FROM Products;
===
--Add a WHERE Clause
--You can add a WHERE clause to specify conditions:

--Example
--Find the number of products where Price is higher than 20:

SELECT COUNT(ProductID)
FROM Products
WHERE Price > 20;
=====
----Ignore Duplicates
--You can ignore duplicates by using the DISTINCT keyword in the COUNT() function.

--If DISTINCT is specified, rows with the same value for the specified column will be counted as one.

--Example
--How many different prices are there in the Products table:

SELECT COUNT(DISTINCT Price)
FROM Products;
====

--Use an Alias
--Give the counted column a name by using the AS keyword.

--Example
--Name the column "Number of records":

SELECT COUNT(*) AS [Number of records]
FROM Products;

====
--Use COUNT() with GROUP BY
--Here we use the COUNT() function and the GROUP BY clause, to return the number of records for each category in the Products table:

--Example
SELECT COUNT(*) AS [Number of records], CategoryID
FROM Products
GROUP BY CategoryID;

#####################################################
#####################################################

The SQL SUM() Function
--#############################################

--The SUM() function returns the total sum of a numeric column.

--Example
--Return the sum of all Quantity fields in the OrderDetails table:

SELECT SUM(Quantity)
FROM OrderDetails;

--Syntax
SELECT SUM(column_name)
FROM table_name
WHERE condition;

======
--Add a WHERE Clause
--You can add a WHERE clause to specify conditions:

--Example
--Return the sum of the Quantity field for the product with ProductID 11:

SELECT SUM(Quantity)
FROM OrderDetails
WHERE ProductId = 11;
=====
--Use an Alias
---Give the summarized column a name by using the AS keyword.

--Example
--Name the column "total":

SELECT SUM(Quantity) AS total
FROM OrderDetails;
=====

--Use SUM() with GROUP BY
--Here we use the SUM() function and the GROUP BY clause, to return the Quantity for each OrderID in the OrderDetails table:

--Example

SELECT OrderID, SUM(Quantity) AS [Total Quantity]
FROM OrderDetails
GROUP BY OrderID;
========
--SUM() With an Expression
--The parameter inside the SUM() function can also be an expression.

--If we assume that each product in the OrderDetails column costs 10 dollars, we can find the total earnings
--in dollars by multiply each quantity with 10:

--Example
--Use an expression inside the SUM() function:

SELECT SUM(Quantity * 10)
FROM OrderDetails;
====
--We can also join the OrderDetails table to the Products table to find the actual amount, instead of assuming it is 10 dollars:

--Example
--Join OrderDetails with Products, and use SUM() to find the total amount:

SELECT SUM(Price * Quantity)
FROM OrderDetails
LEFT JOIN Products ON OrderDetails.ProductID = Products.ProductID;

#####################################################
#####################################################

The SQL AVG() Function
--##################################################### 
--The AVG() function returns the average value of a numeric column.

--Example
---Find the average price of all products:

SELECT AVG(Price)
FROM Products;
======
--Note: NULL values are ignored.

Syntax
SELECT AVG(column_name)
FROM table_name
WHERE condition;
======
--Add a WHERE Clause
--You can add a WHERE clause to specify conditions:

--Example
--Return the average price of products in category 1:

SELECT AVG(Price)
FROM Products
WHERE CategoryID = 1;
=====
--Use an Alias
--Give the AVG column a name by using the AS keyword.

--Example
--Name the column "average price":

SELECT AVG(Price) AS [average price]
FROM Products;

==========
---Higher Than Average
--To list all records with a higher price than average, we can use the AVG() function in a sub query:

--Example
--Return all products with a higher price than the average price:

SELECT * FROM Products
WHERE price > (SELECT AVG(price) FROM Products);
=======
--Use AVG() with GROUP BY
--Here we use the AVG() function and the GROUP BY clause, to return the average price for each category in the Products table:

--Example

SELECT AVG(Price) AS AveragePrice, CategoryID
FROM Products
GROUP BY CategoryID;

#####################################################
#####################################################

--The SQL LIKE Operator
--The LIKE operator is used in a WHERE clause to search for a specified pattern in a column.

--There are two wildcards often used in conjunction with the LIKE operator:

-- The percent sign % represents zero, one, or multiple characters
 --The underscore sign _ represents one, single character
--You will learn more about wildcards in the next chapter.

--Example
--Select all customers that starts with the letter "a":

SELECT * FROM Customers
WHERE CustomerName LIKE 'a%';
======

---The Syntax
SELECT column1, column2, ...
FROM table_name
WHERE columnN LIKE pattern;
======

--The _ Wildcard
--The _ wildcard represents a single character.

--It can be any character or number, but each _ represents one, and only one, character.

--Example
--Return all customers from a city that starts with 'L' followed by one wildcard character, then 'nd' and then two wildcard characters:

SELECT * FROM Customers
WHERE city LIKE 'L_nd__';

====
---The % Wildcard
--The % wildcard represents any number of characters, even zero characters.

---Example
--Return all customers from a city that contains the letter 'L':

SELECT * FROM Customers
WHERE city LIKE '%L%';
=====

----Starts With
--To return records that starts with a specific letter or phrase, add the % at the end of the letter or phrase.

--Example
--Return all customers that starts with 'La':

SELECT * FROM Customers
WHERE CustomerName LIKE 'La%';
=====
--Tip: You can also combine any number of conditions using AND or OR operators.

--Example
--Return all customers that starts with 'a' or starts with 'b':

SELECT * FROM Customers
WHERE CustomerName LIKE 'a%' OR CustomerName LIKE 'b%';
========
---Ends With
--To return records that ends with a specific letter or phrase, add the % at the beginning of the letter or phrase.

--Example
--Return all customers that ends with 'a':

SELECT * FROM Customers
WHERE CustomerName LIKE '%a';
====
--Note: You can also combine "starts with" and "ends with":

--Example
--Return all customers that starts with "b" and ends with "s":

SELECT * FROM Customers
WHERE CustomerName LIKE 'b%s';
========
--Contains
--To return records that contains a specific letter or phrase, add the % both before and after the letter or phrase.

--Example
--Return all customers that contains the phrase 'or'

SELECT * FROM Customers
WHERE CustomerName LIKE '%or%';
======
--Combine Wildcards
--Any wildcard, like % and _ , can be used in combination with other wildcards.

--Example
--Return all customers that starts with "a" and are at least 3 characters in length:

SELECT * FROM Customers
WHERE CustomerName LIKE 'a__%';
=====
--Example
--Return all customers that have "r" in the second position:

SELECT * FROM Customers
WHERE CustomerName LIKE '_r%';
======
--Without Wildcard
--If no wildcard is specified, the phrase has to have an exact match to return a result.

--Example
--Return all customers from Spain:

SELECT * FROM Customers
WHERE Country LIKE 'Spain';














