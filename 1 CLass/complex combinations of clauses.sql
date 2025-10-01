--Here are some additional variations of SQL queries, including more complex 
--combinations of clauses.  

---

--### **More Individual Examples:**  

-- #### **1. SELECT with DISTINCT**  

SELECT DISTINCT department FROM employees;

-- Retrieves unique department names from the `employees` table.  
 
-- #### **2. GROUP BY with COUNT and SUM**  

SELECT department, COUNT(*) AS total_employees, SUM(salary) AS total_salary 
FROM employees 
GROUP BY department;

- Counts employees and sums salaries per department.  

--#### **3. ORDER BY Multiple Columns**  

SELECT name, department, salary 
FROM employees 
ORDER BY department ASC, salary DESC;

-- Sorts first by `department` (ascending) and then by `salary` (descending).  

-- #### **4. OFFSET**  

SELECT name, salary FROM employees ORDER BY salary;

-- Skips the top 3 highest-paid employees and returns the next 5.  

-- #### **5. NOT IN with Multiple Conditions**  

SELECT name FROM employees WHERE department NOT IN ('HR', 'Finance') AND age NOT BETWEEN 20 AND 30;

-- Excludes employees from HR and Finance who are also **not** aged between 20 and 30.  

--#### **6. BETWEEN with Dates**  

SELECT name, hire_date FROM employees WHERE hire_date BETWEEN '2020-01-01' AND '2023-12-31';
SELECT * from order

-- Retrieves employees hired between January 1, 2020, and December 31, 2023.  

--#### **7. HAVING with COUNT and GROUP BY Multiple Columns**  

SELECT department, job_title, COUNT(*) AS total_employees 
FROM employees 
GROUP BY department, job_title 
HAVING COUNT(*) > 2;

-- Groups by `department` and `job_title`, keeping only groups with more than 2 employees.  

---

--### **More Complex Combination Example:**  

SELECT department, job_title, AVG(salary) AS avg_salary, COUNT(*) AS employee_count 
FROM employees 
WHERE age BETWEEN 30 AND 50 
AND department NOT IN ('HR', 'Legal') 
GROUP BY department, job_title 
HAVING AVG(salary) > 60000 AND COUNT(*) >= 5 
ORDER BY avg_salary DESC, employee_count ASC 



**Explanation:**  
1. Filters employees aged **between 30 and 50**.  
2. Excludes employees from **HR** and **Legal** departments.  
3. Groups results by `department` and `job_title`.  
4. Keeps only groups where the **average salary is greater than 60,000** and at least **5 employees** exist.  
5. Sorts by **average salary in descending order**, and then by **employee count in ascending order**.  
6. Skips the **top 2 results** and returns the **next 5**.  

