--NOTES ON SQL
================

--SQL Comments

--SQL Comments
--Comments are used to explain sections of SQL statements, or to prevent execution of SQL statements.

--Note: Comments are not supported in Microsoft Access databases!

--Single Line Comments
--Single line comments start with --.

--Any text between -- and the end of the line will be ignored (will not be executed).

--The following example uses a single-line comment as an explanation:
=================================
--Example
-- Select all:

SELECT * FROM Customers;
========================================

--The following example uses a single-line comment to ignore the end of a line:
=========================================
--Example

SELECT * FROM Customers -- WHERE City='Berlin';

--The following example uses a single-line comment to ignore a statement:

--Example

-- SELECT * FROM Customers;

SELECT * FROM Products;
==========================================

--Multi-line Comments
--Multi-line comments start with /* and end with */.

--Any text between /* and */ will be ignored.

--The following example uses a multi-line comment as an explanation:

--Example

/*Select all the columns
of all the records
in the Customers table:*/
SELECT * FROM Customers;

--The following example uses a multi-line comment to ignore many statements:

--Example

/*SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM Categories;*/
SELECT * FROM Suppliers;

--To ignore just a part of a statement, also use the /* */ comment.

--The following example uses a comment to ignore part of a line:

--Example

SELECT CustomerName, /*City,*/ Country FROM Customers;

--The following example uses a comment to ignore part of a statement:

--Example

SELECT * FROM Customers WHERE (CustomerName LIKE 'L%'
OR CustomerName LIKE 'R%' /*OR CustomerName LIKE 'S%'
OR CustomerName LIKE 'T%'*/ OR CustomerName LIKE 'W%')
AND Country='USA'
ORDER BY CustomerName;
-----------------------------------------------------------------
-----------------------------------------------------------------


--The SQL CREATE TABLE Statement
--The CREATE TABLE statement is used to create a new table in a database.

--Syntax

CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    column3 datatype,
   ....
);
--The column parameters specify the names of the columns of the table.

--The datatype parameter specifies the type of data the column can hold (e.g. varchar, integer, date, etc.).

--Tip: For an overview of the available data types, go to our complete Data Types Reference.

=======
--SQL CREATE TABLE Example
--The following example creates a table called "Persons" that contains five columns: PersonID, LastName, FirstName, Address, and City:

--Example

CREATE TABLE Persons (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    PersonAddress varchar(255),
    City varchar(255)
);
--The PersonID column is of type int and will hold an integer.

--The LastName, FirstName, Address, and City columns are of type varchar and will hold characters, and the maximum length for these fields is 255 characters.

--The empty "Persons" table will now look like this:


Tip: The empty "Persons" table can now be filled with data with the SQL INSERT INTO statement.


=======
--Create Table Using Another Table
--A copy of an existing table can also be created using CREATE TABLE.

--The new table gets the same column definitions. All columns or specific columns can be selected.

--If you create a new table using an existing table, the new table will be filled with the existing values from the old table.

--Syntax
CREATE TABLE new_table_name AS
    SELECT column1, column2,...
    FROM existing_table_name
    WHERE ....;

--The following SQL creates a new table called "TestTables" (which is a copy of the "Customers" table): 

--Example
CREATE TABLE TestTable AS
SELECT customername, contactname
FROM customers;

=========
=========

--The SQL DROP TABLE Statement
--The DROP TABLE statement is used to drop an existing table in a database.

--Syntax
DROP TABLE table_name;
Note: Be careful before dropping a table. Deleting a table will result in loss of complete information stored in the table!

--SQL DROP TABLE Example
T--he following SQL statement drops the existing table "Shippers":

--Example
DROP TABLE Shippers;

======
--SQL TRUNCATE TABLE
--The TRUNCATE TABLE statement is used to delete the data inside a table, but not the table itself.

==Syntax
TRUNCATE TABLE table_name;

=========
=========
--SQL ALTER TABLE Statement
--The ALTER TABLE statement is used to add, delete, or modify columns in an existing table.

--The ALTER TABLE statement is also used to add and drop various constraints on an existing table.

--ALTER TABLE - ADD Column
--To add a column in a table, use the following syntax:

ALTER TABLE table_name
ADD column_name datatype;


--The following SQL adds an "Email" column to the "Customers" table:

--Example
ALTER TABLE Customers
ADD Email varchar(255);

==========
--ALTER TABLE - DROP COLUMN
--To delete a column in a table, use the following syntax (notice that some database systems don't allow deleting a column):

ALTER TABLE table_name
DROP COLUMN column_name;

========
--The following SQL deletes the "Email" column from the "Customers" table:

--Example
ALTER TABLE Customers
DROP COLUMN Email;

======
--ALTER TABLE - RENAME COLUMN
--To rename a column in a table, use the following syntax:

ALTER TABLE table_name
RENAME COLUMN old_name to new_name;

--To rename a column in a table in SQL Server, use the following syntax:

--SQL Server:

EXEC sp_rename 'table_name.old_name',  'new_name', 'COLUMN';

===========

--ALTER TABLE - ALTER/MODIFY DATATYPE
--To change the data type of a column in a table, use the following syntax:

--SQL Server / MS Access:

ALTER TABLE table_name
ALTER COLUMN column_name datatype;

---My SQL / Oracle (prior version 10G):

ALTER TABLE table_name
MODIFY COLUMN column_name datatype;

--Oracle 10G and later:

ALTER TABLE table_name
MODIFY column_name datatype;

==========
--SQL ALTER TABLE Example
--Look at the "Persons" table:

ID	LastName	FirstName	Address	City
1	Hansen	Ola	Timoteivn 10	Sandnes
2	Svendson	Tove	Borgvn 23	Sandnes
3	Pettersen	Kari	Storgt 20	Stavanger
--Now we want to add a column named "DateOfBirth" in the "Persons" table.

--We use the following SQL statement:

ALTER TABLE Persons
ADD DateOfBirth date;

=====
--Notice that the new column, "DateOfBirth", is of type date and is going to hold a date. The data type specifies what type of data the column can hold. For a complete reference of all the data types available in MS Access, MySQL, and SQL Server, go to our complete Data Types reference.

--The "Persons" table will now look like this:

ID	LastName	FirstName	Address	City	DateOfBirth
1	Hansen	Ola	Timoteivn 10	Sandnes	 
2	Svendson	Tove	Borgvn 23	Sandnes	 
3	Pettersen	Kari	Storgt 20	Stavanger	 

==========
--Change Data Type Example
--Now we want to change the data type of the column named "DateOfBirth" in the "Persons" table.

--We use the following SQL statement:

ALTER TABLE Persons
ALTER COLUMN DateOfBirth year;

---Notice that the "DateOfBirth" column is now of type year and is going to hold a year in a two- or four-digit format.

====
--DROP COLUMN Example
--Next, we want to delete the column named "DateOfBirth" in the "Persons" table.

--We use the following SQL statement:

ALTER TABLE Persons
DROP COLUMN DateOfBirth;

--The "Persons" table will now look like this:

ID	LastName	FirstName	Address	City
1	Hansen	Ola	Timoteivn 10	Sandnes
2	Svendson	Tove	Borgvn 23	Sandnes
3	Pettersen	Kari	Storgt 20	Stavanger

=======
=========
--SQL Constraints
--SQL constraints are used to specify rules for data in a table.

--SQL Create Constraints
--Constraints can be specified when the table is created with the CREATE TABLE statement, or after the table is created with the ALTER TABLE statement.

--Syntax
CREATE TABLE table_name (
    column1 datatype constraint,
    column2 datatype constraint,
    column3 datatype constraint,
    
);
=======
--SQL Constraints
--SQL constraints are used to specify rules for the data in a table.

--Constraints are used to limit the type of data that can go into a table. This ensures the accuracy and reliability of the data in the table. If there is any violation between the constraint and the data action, the action is aborted.

--Constraints can be column level or table level. Column level constraints apply to a column, and table level constraints apply to the whole table.

--The following constraints are commonly used in SQL:

--NOT NULL - Ensures that a column cannot have a NULL value
-- UNIQUE - Ensures that all values in a column are different
--PRIMARY KEY - A combination of a NOT NULL and UNIQUE. Uniquely identifies each row in a table
--FOREIGN KEY - Prevents actions that would destroy links between tables
--CHECK - Ensures that the values in a column satisfies a specific condition
--DEFAULT - Sets a default value for a column if no value is specified
--CREATE INDEX - Used to create and retrieve data from the database very quickly

=======
=======

--SQL NOT NULL Constraint
--By default, a column can hold NULL values.

--The NOT NULL constraint enforces a column to NOT accept NULL values.

--This enforces a field to always contain a value, which means that you cannot insert a new record, or update a record without adding a value to this field.

--SQL NOT NULL on CREATE TABLE
--The following SQL ensures that the "ID", "LastName", and "FirstName" columns will NOT accept NULL values when the "Persons" table is created:

--Example
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255) NOT NULL,
    Age int
);

--SQL NOT NULL on ALTER TABLE
--To create a NOT NULL constraint on the "Age" column when the "Persons" table is already created, use the following SQL:
=======
--SQL Server / MS Access:

ALTER TABLE Persons
ALTER COLUMN Age int NOT NULL;

--My SQL / Oracle (prior version 10G):

ALTER TABLE Persons
MODIFY COLUMN Age int NOT NULL;

--Oracle 10G and later:

ALTER TABLE Persons
MODIFY Age int NOT NULL;

=======


##################################
The end of database
################################


--SQL Operators

--SQL Arithmetic Operators

--Operator	Description	Example
+	Add	
-	Subtract	
*	Multiply	
/	Divide	
%	Modulo	

-SQL Bitwise Operators

--Operator	Description
&	Bitwise AND
|	Bitwise OR
^	Bitwise exclusive OR

--SQL Comparison Operators

Operator	Description	Example
=	Equal to	
>	Greater than	
<	Less than	
>=	Greater than or equal to	
<=	Less than or equal to	
<>	Not equal to	


SQL Compound Operators

Operator	Description
+=	Add equals
-=	Subtract equals
*=	Multiply equals
/=	Divide equals
%=	Modulo equals
&=	Bitwise AND equals
^-=	Bitwise exclusive equals
|*=	Bitwise OR equals

SQL Logical Operators

Operator	Description	Example
ALL	TRUE if all of the subquery values meet the condition	
AND	TRUE if all the conditions separated by AND is TRUE	
ANY	TRUE if any of the subquery values meet the condition	
BETWEEN	TRUE if the operand is within the range of comparisons	
EXISTS	TRUE if the subquery returns one or more records	
IN	TRUE if the operand is equal to one of a list of expressions	
LIKE	TRUE if the operand matches a pattern	
NOT	Displays a record if the condition(s) is NOT TRUE	
OR	TRUE if any of the conditions separated by OR is TRUE	
SOME	TRUE if any of the subquery values meet the condition	


#################################33

The end of Opereator

#################################



-----------------------------------------------------------------
-----------------------------------------------------------------


--The SQL INSERT INTO Statement

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

INSERT INTO Customers (CustomerName, ContactName, customerAddress, City, PostalCode, Country)
VALUES
('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway'),
('Greasy Burger', 'Per Olsen', 'Gateveien 15', 'Sandnes', '4306', 'Norway'),
('Tasty Tee', 'Finn Egan', 'Streetroad 19B', 'Liverpool', 'L1 0AA', 'UK');

-----------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------

--SQL UPDATE Statement

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
------------------------------------------------------
------------------------------------------------------

---The SQL DELETE Statement

--The DELETE statement is used to delete existing records in a table.

--DELETE Syntax (Example)

DELETE FROM table_name WHERE condition;

--Note: Be careful when deleting records in a table! Notice the WHERE clause in the DELETE statement. 
--The WHERE clause specifies which record(s) should be deleted. If you omit the WHERE clause, all records in the table will be deleted!
=====
--SQL DELETE Example
--The following SQL statement deletes the customer "Alfreds Futterkiste" from the "Customers" table:

--Example

DELETE FROM Customers WHERE CustomerName='Alfreds Futterkiste';

=====
--Delete All Records
--It is possible to delete all rows in a table without deleting the table. This means that the table structure, attributes, and indexes will be intact:

DELETE FROM table_name;

---The following SQL statement deletes all rows in the "Customers" table, without deleting the table:

--Example

DELETE FROM Customers;
=========
--Delete a Table
--To delete the table completely, use the DROP TABLE statement:

--Example
--Remove the Customers table:

DROP TABLE Customers;
-----------------------------------------------------------------------
----------------------------------------------------------------------


--Make sure you separate each set of values with a comma ,
--the SQL HAVING Clause
use GB_Point
--The HAVING clause was added to SQL because the WHERE keyword cannot 
be used with aggregate functions.

--HAVING Syntax

SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
HAVING condition
ORDER BY column_name(s);



--Demo Database


--SQL HAVING Examples
--The following SQL statement lists the number of customers in each country. Only include countries with more than 5 customers:

--Example
SELECT COUNT(CustomerID), CountryFROM Customers GROUP BY Country
HAVING COUNT(CustomerID) > 5;

--The following SQL statement lists the number of customers in each country, sorted high to low (Only include countries with more than 5 customers):

--Example
SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5
ORDER BY COUNT(CustomerID) DESC;



--Demo Database




--More HAVING Examples
--The following SQL statement lists the employees that have registered more than 10 orders:

--Example

SELECT Employees.LastName, COUNT(Orders.OrderID) AS NumberOfOrders
FROM (Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID)
GROUP BY LastName
HAVING COUNT(Orders.OrderID) > 10;

--The following SQL statement lists if the employees "Davolio" or "Fuller" have registered more than 25 orders:

--Example

SELECT Employees.LastName, COUNT(Orders.OrderID) AS NumberOfOrders
FROM Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE LastName = 'Davolio' OR LastName = 'Fuller'
GROUP BY LastName
HAVING COUNT(Orders.OrderID) > 25;
