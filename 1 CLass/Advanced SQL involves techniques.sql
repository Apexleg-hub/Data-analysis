/*Advanced SQL involves techniques that go beyond basic queries, enabling complex data manipulation and analysis. Below, I�ll explain **String Patterns, Ranges, and Sets**,
**Sorting Result Sets**, and **Grouping Result Sets** with detailed explanations, examples, and practical use cases. 
I'll assume familiarity with basic SQL (e.g., SELECT, WHERE, JOIN) and focus on advanced concepts.*/

---

--### 1. String Patterns, Ranges, and Sets

/*These techniques allow filtering and matching data based on patterns, ranges, or specific sets of values. They are commonly used in WHERE clauses to refine query results.

#### **String Patterns**
String patterns are used to match substrings or patterns in text data, primarily with the `LIKE` operator or regular expressions (in some databases like PostgreSQL).

- **LIKE Operator**:
  - Uses `%` (matches any sequence of characters) and `_` (matches a single character).
  - Example: Find employees whose names start with 'J'.*/
    
    SELECT first_name
    FROM employees
    WHERE first_name LIKE 'J%';
    
    --Result: Matches names like "John", "Jane", etc.

  -- Example: Find names with exactly 5 characters, starting with 'A'.
    
    SELECT first_name
    FROM employees
    WHERE first_name LIKE 'A____';
    
    --Result: Matches "Alice", "Aaron", etc.

/*- **Regular Expressions (REGEXP)**:
  - Supported in databases like PostgreSQL, MySQL, and Oracle.
  - More powerful than LIKE, allowing complex pattern matching.
  - Example: Find emails ending with '.com'.*/
    
    SELECT email
    FROM users
    WHERE email ~ '\.com$';  -- PostgreSQL syntax
    
    --Result: Matches "user@domain.com".

/* **Case Sensitivity**:
  - `LIKE` is case-insensitive in some databases (e.g., SQL Server) but case-sensitive in others (e.g., PostgreSQL). Use `ILIKE` (PostgreSQL) for case-insensitive matching*/
    
    SELECT first_name
    FROM employees
    WHERE first_name ILIKE 'john%';
    ```

--#### **Ranges**
/*Ranges filter data within a specified interval, often using `BETWEEN` or 
comparison operators (`>`, `<`, `>=`, `<=`).*/

/*- **BETWEEN**:
  - Inclusive range for numbers, dates, or strings.
  - Example: Find orders placed in 2023.*/
    
    SELECT order_id, order_date
    FROM orders
    WHERE order_date BETWEEN '2023-01-01' AND '2023-12-31';
    
   -- Equivalent to:
    
    WHERE order_date >= '2023-01-01' AND order_date <= '2023-12-31';*/
    

/*- **Comparison Operators**:
  - Useful for open-ended ranges.
  - Example: Find products priced above $100.*/
    
    SELECT product_name, price
    FROM products
    WHERE price > 100;
    

/*- **Date Ranges**:
  - Often used with date functions (e.g., `DATE_TRUNC`, `EXTRACT`).
  - Example: Find orders from the current month.*/
    SELECT order_id
    FROM orders
    WHERE order_date >= DATE_TRUNC('month', CURRENT_DATE)
      AND order_date < DATE_TRUNC('month', CURRENT_DATE + INTERVAL '1 month');
    

/*#### **Sets**
Sets filter data based on membership in a list of values, using `IN`, `NOT IN`, or subqueries.*/

/*- **IN Operator**:
  - Matches values in a predefined list.
  - Example: Find orders from specific regions.*/
    
    SELECT order_id, region
    FROM orders
    WHERE region IN ('North', 'South', 'East');
    

/*- **NOT IN**:
  - Excludes values in a list.
  - Example: Exclude certain product categories.*/
    
    SELECT product_name
    FROM products
    WHERE category NOT IN ('Electronics', 'Clothing');
    

/*- **Subqueries with IN**:
  - Dynamically generate the set.
  - Example: Find customers who placed orders in 2023.*/
    
    SELECT customer_name
    FROM customers
    WHERE customer_id IN (
        SELECT customer_id
        FROM orders
        WHERE YEAR(order_date) = 2023
    );
    

/*- **Performance Note**:
  - For large sets, consider using `JOIN` instead of `IN` for better performance.*/
    
    SELECT c.customer_name
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    WHERE YEAR(o.order_date) = 2023;
    

---

/*### 2. Sorting Result Sets

Sorting organizes query results using the `ORDER BY` clause, which can sort by one or more columns in ascending (`ASC`) or descending (`DESC`) order.*/

/*#### **Basic Sorting**
- Example: Sort employees by salary in descending order.*/
  
  SELECT first_name, salary
  FROM employees
  ORDER BY salary DESC;
  

/*- Sort by multiple columns:
  - Example: Sort by department, then salary within each department.*/
    
    SELECT first_name, department, salary
    FROM employees
    ORDER BY department ASC, salary DESC;
    

/*#### **Advanced Sorting**
- **Sorting by Expressions**:
  - Sort based on computed values.
  - Example: Sort products by discounted price (10% off).*/
    
    SELECT product_name, price
    FROM products
    ORDER BY price * 0.9 DESC;
    

/*- **Sorting with NULLs**:
  - NULLs are sorted first (ASC) or last (DESC) by default in most databases.
  - Control NULLs explicitly (SQL Server, PostgreSQL):*/
    
    SELECT first_name, commission
    FROM employees
    ORDER BY commission DESC NULLS LAST;  -- PostgreSQL
    
    --SQL Server equivalent:
    
    SELECT first_name, commission
    FROM employees
    ORDER BY CASE WHEN commission IS NULL THEN 1 ELSE 0 END, commission DESC;
    

/*- **Sorting by Position**:
  - Use `CASE` for custom sort orders.
  - Example: Sort regions in a specific order (e.g., West, East, North, South).*/
    
    SELECT region, sales
    FROM sales_data
    ORDER BY CASE region
        WHEN 'West' THEN 1
        WHEN 'East' THEN 2
        WHEN 'North' THEN 3
        WHEN 'South' THEN 4
        ELSE 5
    END;
    

/*- **Performance Tip**:
  - Ensure indexes exist on columns used in `ORDER BY` for large datasets to avoid slow sorts.*/

---

/*### 3. Grouping Result Sets

Grouping aggregates data based on one or more columns using `GROUP BY`, often 
paired with aggregate functions (`COUNT`, `SUM`, `AVG`, `MIN`, `MAX`).*/

/*#### **Basic Grouping**
- Example: Count orders per customer.*/
 
  SELECT customer_id, COUNT(order_id) AS order_count
  FROM orders
  GROUP BY customer_id;
  

/*- Multiple columns:
  - Example: Sum sales by region and year*/
    
    SELECT region, YEAR(order_date) AS order_year, SUM(amount) AS total_sales
    FROM orders
    GROUP BY region, YEAR(order_date);
    

#### **Rules for GROUP BY**
- All non-aggregated columns in the `SELECT` clause must appear in the `GROUP BY` clause.
- Example (invalid):
  ```sql
  SELECT customer_id, order_date, COUNT(*)
  FROM orders
  GROUP BY customer_id;  -- Error: order_date not in GROUP BY or aggregate
  ```
  Fix:
  ```sql
  SELECT customer_id, COUNT(*) AS order_count
  FROM orders
  GROUP BY customer_id;
  ```

#### **Filtering Grouped Results with HAVING**
- `HAVING` filters groups after aggregation (unlike `WHERE`, which filters rows before).
- Example: Find customers with more than 5 orders.*/

  SELECT customer_id, COUNT(order_id) AS order_count
  FROM orders
  GROUP BY customer_id
  HAVING COUNT(order_id) > 5;
 

/*- Combine with WHERE:
  - Example: Count 2023 orders per customer, only for those with >10 orders.*/
    
    SELECT customer_id, COUNT(order_id) AS order_count
    FROM orders
    WHERE YEAR(order_date) = 2023
    GROUP BY customer_id
    HAVING COUNT(order_id) > 10;
    

/*#### **Advanced Grouping**
- **ROLLUP, CUBE, and GROUPING SETS**:
  - These extensions generate subtotals and grand totals.
  - **ROLLUP**:
    - Creates hierarchical subtotals.
    - Example: Total sales by region and year, with subtotals for each region and grand total.*/
      
      SELECT region, YEAR(order_date) AS order_year, SUM(amount) AS total_sales
      FROM orders
      GROUP BY ROLLUP(region, YEAR(order_date));
      
     /* Output includes:
      - Sales by region and year.
      - Subtotal for each region (all years).
      - Grand total (all regions, all years).*/

  /*- **CUBE**:
    - Generates all possible combinations of subtotals.
    - Example:*/
      
      SELECT region, YEAR(order_date) AS order_year, SUM(amount) AS total_sales
      FROM orders
      GROUP BY CUBE(region, YEAR(order_date));
      
      --Adds subtotals for each year across all regions.

  /*- **GROUPING SETS**:
    - Specify exact grouping combinations.
    - Example: Group by region and year separately.*/

      SELECT region, YEAR(order_date) AS order_year, SUM(amount) AS total_sales
      FROM orders
      GROUP BY GROUPING SETS((region), (YEAR(order_date)));
      

/*- **Identifying Subtotal Rows**:
  - Use `GROUPING` function to detect NULLs in subtotals.*/

    SELECT region, YEAR(order_date) AS order_year, SUM(amount) AS total_sales,
           GROUPING(region) AS is_region_total,
           GROUPING(YEAR(order_date)) AS is_year_total
    FROM orders
    GROUP BY ROLLUP(region, YEAR(order_date));
    

/*#### **Performance Considerations**
- Indexes on `GROUP BY` columns and columns used in aggregate functions can improve performance.
- Avoid unnecessary columns in `GROUP BY` to reduce processing.*/

---

/*### Practical Example Combining All Concepts

Scenario: Analyze a sales database to find high-value customers in specific regions, sorted by total sales, with pattern-based filtering.*/


SELECT 
    c.customer_name,
    o.region,
    SUM(o.amount) AS total_sales,
    COUNT(o.order_id) AS order_count
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE 
    c.customer_name LIKE 'A%'  -- String pattern: Names starting with 'A'
    AND o.region IN ('North', 'South')  -- Set: Specific regions
    AND o.order_date BETWEEN '2023-01-01' AND '2023-12-31'  -- Range: 2023 orders
GROUP BY 
    c.customer_name, o.region
HAVING 
    SUM(o.amount) > 10000  -- Group filter: Total sales > $10,000
ORDER BY 
    total_sales DESC, customer_name ASC;  -- Sort by sales (desc), then name (asc)


/**Explanation**:
- Filters customers with names starting with 'A' in 'North' or 'South' regions for 2023.
- Groups by customer and region, calculating total sales and order count.
- Only includes groups with sales > $10,000.
- Sorts results by total sales (highest first) and customer name alphabetically.

---

### Database-Specific Notes
- **PostgreSQL**: Supports `ILIKE`, `~` (regex), and `DISTINCT ON` for unique sorting.
- **MySQL**: Case-insensitive `LIKE` by default; limited support for `ROLLUP`.
- **SQL Server**: Uses `WITH ROLLUP` (older syntax); no regex but supports `PATINDEX`.
- **Oracle**: Strong regex support with `REGEXP_LIKE`; `GROUPING SETS` since 11g.

---

This covers the core advanced SQL concepts for string patterns, ranges, sets, sorting, and grouping. 
If you need deeper dives into specific areas (e.g., regex optimization, window functions as a grouping alternative), let me know!