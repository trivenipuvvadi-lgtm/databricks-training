**Query #1**

    -- Query 1: Use ROW_NUMBER() to assign a row number to employees ordered by salary descending.
    SELECT e.*,ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num
    FROM employees e;

| employee_id | employee_name | department | manager_id | salary  | hire_date  | row_num |
| ----------- | ------------- | ---------- | ---------- | ------- | ---------- | ------- |
| 4           | Diana Prince  | IT         | 3          | 95000.0 | 2018-11-11 | 1       |
| 3           | Charlie Brown | IT         |            | 90000.0 | 2019-07-01 | 2       |
| 7           | George Miller | Finance    |            | 85000.0 | 2017-09-18 | 3       |
| 8           | Hannah Lee    | Finance    | 7          | 82000.0 | 2021-08-30 | 4       |
| 1           | Alice Johnson | Sales      |            | 70000.0 | 2020-01-15 | 5       |
| 2           | Bob Smith     | Sales      | 1          | 65000.0 | 2021-03-20 | 6       |
| 5           | Ethan Hunt    | HR         |            | 60000.0 | 2022-02-10 | 7       |
| 6           | Fiona Green   | HR         | 5          | 58000.0 | 2023-05-12 | 8       |

---
**Query #2**

    -- Query 2:  Use RANK() to rank employees by salary.
    SELECT employee_name,salary,RANK() OVER (ORDER BY salary DESC) AS salary_rank
    FROM employees;

| employee_name | salary  | salary_rank |
| ------------- | ------- | ----------- |
| Diana Prince  | 95000.0 | 1           |
| Charlie Brown | 90000.0 | 2           |
| George Miller | 85000.0 | 3           |
| Hannah Lee    | 82000.0 | 4           |
| Alice Johnson | 70000.0 | 5           |
| Bob Smith     | 65000.0 | 6           |
| Ethan Hunt    | 60000.0 | 7           |
| Fiona Green   | 58000.0 | 8           |

---
**Query #3**

    -- Query 3:  Use DENSE_RANK() to rank employees by salary
    SELECT employee_name,salary,DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
    FROM employees;

| employee_name | salary  | salary_rank |
| ------------- | ------- | ----------- |
| Diana Prince  | 95000.0 | 1           |
| Charlie Brown | 90000.0 | 2           |
| George Miller | 85000.0 | 3           |
| Hannah Lee    | 82000.0 | 4           |
| Alice Johnson | 70000.0 | 5           |
| Bob Smith     | 65000.0 | 6           |
| Ethan Hunt    | 60000.0 | 7           |
| Fiona Green   | 58000.0 | 8           |

---
**Query #4**

    -- Query 4: Find the top 3 highest-paid employees using a window function.
    SELECT employee_id,employee_name,salary
    FROM(
      SELECT employee_id,employee_name,salary,ROW_NUMBER() OVER (ORDER BY salary DESC) AS rn  FROM employees
    ) AS t
    WHERE rn<=3;

| employee_id | employee_name | salary  |
| ----------- | ------------- | ------- |
| 4           | Diana Prince  | 95000.0 |
| 3           | Charlie Brown | 90000.0 |
| 7           | George Miller | 85000.0 |

---
**Query #5**

    -- Query 5: Rank employees within each department using PARTITION BY.
    SELECT *,
           RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS salary_rank
    FROM employees;

| employee_id | employee_name | department | manager_id | salary  | hire_date  | salary_rank |
| ----------- | ------------- | ---------- | ---------- | ------- | ---------- | ----------- |
| 7           | George Miller | Finance    |            | 85000.0 | 2017-09-18 | 1           |
| 8           | Hannah Lee    | Finance    | 7          | 82000.0 | 2021-08-30 | 2           |
| 5           | Ethan Hunt    | HR         |            | 60000.0 | 2022-02-10 | 1           |
| 6           | Fiona Green   | HR         | 5          | 58000.0 | 2023-05-12 | 2           |
| 4           | Diana Prince  | IT         | 3          | 95000.0 | 2018-11-11 | 1           |
| 3           | Charlie Brown | IT         |            | 90000.0 | 2019-07-01 | 2           |
| 1           | Alice Johnson | Sales      |            | 70000.0 | 2020-01-15 | 1           |
| 2           | Bob Smith     | Sales      | 1          | 65000.0 | 2021-03-20 | 2           |

---
**Query #6**

    -- Query 6: Display the highest salary in each department using a window function
    SELECT employee_id,employee_name,department,salary
    FROM (
      SELECT employee_id,employee_name,department,salary,
        RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rn 
      FROM employees
    ) AS t
    WHERE rn=1;

| employee_id | employee_name | department | salary  |
| ----------- | ------------- | ---------- | ------- |
| 7           | George Miller | Finance    | 85000.0 |
| 5           | Ethan Hunt    | HR         | 60000.0 |
| 4           | Diana Prince  | IT         | 95000.0 |
| 1           | Alice Johnson | Sales      | 70000.0 |

---
**Query #7**

    -- Query 7: Calculate the running total of order amounts ordered by order_date.
    SELECT order_id, order_date, total_amount,
           SUM(total_amount) OVER (ORDER BY order_date) AS running_total
    FROM orders;

| order_id | order_date | total_amount | running_total |
| -------- | ---------- | ------------ | ------------- |
| 101      | 2024-01-10 | 500.0        | 500.0         |
| 102      | 2024-01-11 | 700.0        | 1200.0        |
| 103      | 2024-01-15 | 1200.0       | 2400.0        |
| 104      | 2024-01-18 | 300.0        | 2700.0        |
| 105      | 2024-01-20 | 900.0        | 3600.0        |
| 106      | 2024-01-25 | 1500.0       | 5100.0        |
| 107      | 2024-02-01 | 650.0        | 5750.0        |
| 108      | 2024-02-05 | 1100.0       | 6850.0        |
| 109      | 2024-02-10 | 400.0        | 7250.0        |
| 110      | 2024-02-15 | 950.0        | 8200.0        |
| 111      | 2024-02-20 | 2000.0       | 10200.0       |
| 112      | 2024-02-25 | 750.0        | 10950.0       |

---
**Query #8**

    -- Query 8: Calculate the cumulative sales amount for each employee.
    SELECT employee_id, order_id, order_date, total_amount,
        SUM(total_amount) OVER (PARTITION BY employee_id ORDER BY order_date) AS cumulative_sales
    FROM orders;

| employee_id | order_id | order_date | total_amount | cumulative_sales |
| ----------- | -------- | ---------- | ------------ | ---------------- |
| 1           | 101      | 2024-01-10 | 500.0        | 500.0            |
| 1           | 103      | 2024-01-15 | 1200.0       | 1700.0           |
| 1           | 107      | 2024-02-01 | 650.0        | 2350.0           |
| 1           | 111      | 2024-02-20 | 2000.0       | 4350.0           |
| 2           | 102      | 2024-01-11 | 700.0        | 700.0            |
| 2           | 106      | 2024-01-25 | 1500.0       | 2200.0           |
| 2           | 110      | 2024-02-15 | 950.0        | 3150.0           |
| 3           | 104      | 2024-01-18 | 300.0        | 300.0            |
| 3           | 108      | 2024-02-05 | 1100.0       | 1400.0           |
| 4           | 105      | 2024-01-20 | 900.0        | 900.0            |
| 4           | 109      | 2024-02-10 | 400.0        | 1300.0           |
| 4           | 112      | 2024-02-25 | 750.0        | 2050.0           |

---
**Query #9**

    -- Query 9: Use LAG() to show the previous order amount for each customer.
    SELECT customer_id,order_id,order_date,total_amount, LAG(total_amount) OVER (PARTITION BY customer_id ORDER BY order_date) AS prev_order_amount
    FROM orders
    ORDER BY customer_id,order_date;

| customer_id | order_id | order_date | total_amount | prev_order_amount |
| ----------- | -------- | ---------- | ------------ | ----------------- |
| 1           | 101      | 2024-01-10 | 500.0        |                   |
| 1           | 103      | 2024-01-15 | 1200.0       | 500.0             |
| 1           | 108      | 2024-02-05 | 1100.0       | 1200.0            |
| 1           | 112      | 2024-02-25 | 750.0        | 1100.0            |
| 2           | 102      | 2024-01-11 | 700.0        |                   |
| 2           | 107      | 2024-02-01 | 650.0        | 700.0             |
| 3           | 104      | 2024-01-18 | 300.0        |                   |
| 3           | 109      | 2024-02-10 | 400.0        | 300.0             |
| 4           | 105      | 2024-01-20 | 900.0        |                   |
| 4           | 110      | 2024-02-15 | 950.0        | 900.0             |
| 5           | 106      | 2024-01-25 | 1500.0       |                   |
| 5           | 111      | 2024-02-20 | 2000.0       | 1500.0            |

---
**Query #10**

    -- Query 10: Use LEAD() to show the next order amount for each customer.
    SELECT customer_id,order_id,order_date,total_amount, LEAD(total_amount) OVER (PARTITION BY customer_id ORDER BY order_date) AS next_order_amount
    FROM orders
    ORDER BY customer_id,order_date;

| customer_id | order_id | order_date | total_amount | next_order_amount |
| ----------- | -------- | ---------- | ------------ | ----------------- |
| 1           | 101      | 2024-01-10 | 500.0        | 1200.0            |
| 1           | 103      | 2024-01-15 | 1200.0       | 1100.0            |
| 1           | 108      | 2024-02-05 | 1100.0       | 750.0             |
| 1           | 112      | 2024-02-25 | 750.0        |                   |
| 2           | 102      | 2024-01-11 | 700.0        | 650.0             |
| 2           | 107      | 2024-02-01 | 650.0        |                   |
| 3           | 104      | 2024-01-18 | 300.0        | 400.0             |
| 3           | 109      | 2024-02-10 | 400.0        |                   |
| 4           | 105      | 2024-01-20 | 900.0        | 950.0             |
| 4           | 110      | 2024-02-15 | 950.0        |                   |
| 5           | 106      | 2024-01-25 | 1500.0       | 2000.0            |
| 5           | 111      | 2024-02-20 | 2000.0       |                   |

---
**Query #11**

    -- Query 11: Find the difference between the current order amount and previous order amount
    SELECT 
      order_id,
      customer_id,
      total_amount,
      total_amount - LAG(total_amount) OVER(
        PARTITION BY customer_id       
        ORDER BY order_date
      ) AS amount_diff
    FROM orders
    ORDER BY customer_id, order_date;

| order_id | customer_id | total_amount | amount_diff |
| -------- | ----------- | ------------ | ----------- |
| 101      | 1           | 500.0        |             |
| 103      | 1           | 1200.0       | 700.0       |
| 108      | 1           | 1100.0       | -100.0      |
| 112      | 1           | 750.0        | -350.0      |
| 102      | 2           | 700.0        |             |
| 107      | 2           | 650.0        | -50.0       |
| 104      | 3           | 300.0        |             |
| 109      | 3           | 400.0        | 100.0       |
| 105      | 4           | 900.0        |             |
| 110      | 4           | 950.0        | 50.0        |
| 106      | 5           | 1500.0       |             |
| 111      | 5           | 2000.0       | 500.0       |

---
**Query #12**

    -- Query 12: Calculate a moving average of the last 3 orders.
    SELECT 
      order_id,
      order_date,
      total_amount,
      AVG(total_amount) OVER(
        ORDER BY order_date
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
      ) AS moving_avg_3_orders
    FROM orders;

| order_id | order_date | total_amount | moving_avg_3_orders |
| -------- | ---------- | ------------ | ------------------- |
| 101      | 2024-01-10 | 500.0        | 500.0               |
| 102      | 2024-01-11 | 700.0        | 600.0               |
| 103      | 2024-01-15 | 1200.0       | 800.0               |
| 104      | 2024-01-18 | 300.0        | 733.333333          |
| 105      | 2024-01-20 | 900.0        | 800.0               |
| 106      | 2024-01-25 | 1500.0       | 900.0               |
| 107      | 2024-02-01 | 650.0        | 1016.666667         |
| 108      | 2024-02-05 | 1100.0       | 1083.333333         |
| 109      | 2024-02-10 | 400.0        | 716.666667          |
| 110      | 2024-02-15 | 950.0        | 816.666667          |
| 111      | 2024-02-20 | 2000.0       | 1116.666667         |
| 112      | 2024-02-25 | 750.0        | 1233.333333         |

---
**Query #13**

    -- Query 13: Use NTILE(4) to divide employees into salary quartiles.
    SELECT employee_id,employee_name,salary,
      NTILE(4) OVER (ORDER BY salary DESC) as salary_quartiles
    FROM employees;

| employee_id | employee_name | salary  | salary_quartiles |
| ----------- | ------------- | ------- | ---------------- |
| 4           | Diana Prince  | 95000.0 | 1                |
| 3           | Charlie Brown | 90000.0 | 1                |
| 7           | George Miller | 85000.0 | 2                |
| 8           | Hannah Lee    | 82000.0 | 2                |
| 1           | Alice Johnson | 70000.0 | 3                |
| 2           | Bob Smith     | 65000.0 | 3                |
| 5           | Ethan Hunt    | 60000.0 | 4                |
| 6           | Fiona Green   | 58000.0 | 4                |

---
**Query #14**

    -- Query 14: Find the first order placed by each customer using ROW_NUMBER().
    SELECT order_id, customer_id, order_date, total_amount
    FROM (
        SELECT order_id, customer_id, order_date, total_amount,
               ROW_NUMBER() OVER (
                   PARTITION BY customer_id
                   ORDER BY order_date
               ) AS rn
        FROM orders
    ) AS t
    WHERE rn = 1;

| order_id | customer_id | order_date | total_amount |
| -------- | ----------- | ---------- | ------------ |
| 101      | 1           | 2024-01-10 | 500.0        |
| 102      | 2           | 2024-01-11 | 700.0        |
| 104      | 3           | 2024-01-18 | 300.0        |
| 105      | 4           | 2024-01-20 | 900.0        |
| 106      | 5           | 2024-01-25 | 1500.0       |

---
**Query #15**

    -- Query 15: Find the latest order placed by each customer.
    SELECT order_id,customer_id,order_date,total_amount
    FROM(
      SELECT order_id,customer_id,order_date,total_amount,
        ROW_NUMBER() OVER(
          PARTITION BY customer_id
          ORDER BY order_date DESC
        ) AS rn
      FROM orders
    ) AS t
    WHERE rn=1;

| order_id | customer_id | order_date | total_amount |
| -------- | ----------- | ---------- | ------------ |
| 112      | 1           | 2024-02-25 | 750.0        |
| 107      | 2           | 2024-02-01 | 650.0        |
| 109      | 3           | 2024-02-10 | 400.0        |
| 110      | 4           | 2024-02-15 | 950.0        |
| 111      | 5           | 2024-02-20 | 2000.0       |

---
**Query #16**

    -- Query 16: Display employee salaries along with department average salary.
    SELECT employee_id,employee_name,department,salary,
      AVG(salary) OVER(partition by department) AS   dept_avg_salary
    FROM employees;

| employee_id | employee_name | department | salary  | dept_avg_salary |
| ----------- | ------------- | ---------- | ------- | --------------- |
| 7           | George Miller | Finance    | 85000.0 | 83500.0         |
| 8           | Hannah Lee    | Finance    | 82000.0 | 83500.0         |
| 5           | Ethan Hunt    | HR         | 60000.0 | 59000.0         |
| 6           | Fiona Green   | HR         | 58000.0 | 59000.0         |
| 3           | Charlie Brown | IT         | 90000.0 | 92500.0         |
| 4           | Diana Prince  | IT         | 95000.0 | 92500.0         |
| 1           | Alice Johnson | Sales      | 70000.0 | 67500.0         |
| 2           | Bob Smith     | Sales      | 65000.0 | 67500.0         |

---
**Query #17**

    -- Query 17: Find employees earning above their department average salary.
    SELECT employee_id, employee_name, department, salary
    FROM employees e
    WHERE salary > (
        SELECT AVG(salary)
        FROM employees e2
        WHERE e2.department = e.department
    );

| employee_id | employee_name | department | salary  |
| ----------- | ------------- | ---------- | ------- |
| 1           | Alice Johnson | Sales      | 70000.0 |
| 4           | Diana Prince  | IT         | 95000.0 |
| 5           | Ethan Hunt    | HR         | 60000.0 |
| 7           | George Miller | Finance    | 85000.0 |

---
**Query #18**

    -- Query 18: Use SUM() OVER(PARTITION BY department) to calculate department payroll.
    SELECT DISTINCT department,
      SUM(salary) OVER (PARTITION BY department) AS dept_payroll
    FROM employees;

| department | dept_payroll |
| ---------- | ------------ |
| Finance    | 167000.0     |
| HR         | 118000.0     |
| IT         | 185000.0     |
| Sales      | 135000.0     |

---
**Query #19**

    -- Query 19: Find the percentage contribution of each employee salary within their department.
    SELECT
        employee_id,
        employee_name,
        department,
        salary,
        ROUND(
            salary * 100.0 / SUM(salary) OVER (PARTITION BY department),2
        ) AS salary_pct
    FROM employees;

| employee_id | employee_name | department | salary  | salary_pct |
| ----------- | ------------- | ---------- | ------- | ---------- |
| 7           | George Miller | Finance    | 85000.0 | 50.9       |
| 8           | Hannah Lee    | Finance    | 82000.0 | 49.1       |
| 5           | Ethan Hunt    | HR         | 60000.0 | 50.85      |
| 6           | Fiona Green   | HR         | 58000.0 | 49.15      |
| 3           | Charlie Brown | IT         | 90000.0 | 48.65      |
| 4           | Diana Prince  | IT         | 95000.0 | 51.35      |
| 1           | Alice Johnson | Sales      | 70000.0 | 51.85      |
| 2           | Bob Smith     | Sales      | 65000.0 | 48.15      |

---
**Query #20**
  
    -- Query 20: Use COUNT() OVER() to show total number of employees alongside each row.
    SELECT employee_id, employee_name, department, salary,
           COUNT(*) OVER () AS total_employees
    FROM employees;

| employee_id | employee_name | department | salary  | total_employees |
| ----------- | ------------- | ---------- | ------- | --------------- |
| 1           | Alice Johnson | Sales      | 70000.0 | 8               |
| 2           | Bob Smith     | Sales      | 65000.0 | 8               |
| 3           | Charlie Brown | IT         | 90000.0 | 8               |
| 4           | Diana Prince  | IT         | 95000.0 | 8               |
| 5           | Ethan Hunt    | HR         | 60000.0 | 8               |
| 6           | Fiona Green   | HR         | 58000.0 | 8               |
| 7           | George Miller | Finance    | 85000.0 | 8               |
| 8           | Hannah Lee    | Finance    | 82000.0 | 8               |

---
**Query #21**

    -- Query 21: Create a CTE to calculate total sales per employee
    WITH employee_sales AS(
      SELECT employee_id,SUM(total_amount) AS total_sales
      FROM orders
      GROUP BY employee_id
    )
    SELECT * FROM employee_sales;

| employee_id | total_sales |
| ----------- | ----------- |
| 1           | 4350.0      |
| 2           | 3150.0      |
| 3           | 1400.0      |
| 4           | 2050.0      |

---
    
**Query #22**

    -- Query 22: Use a CTE to find employees whose sales exceed the company average.
    WITH employee_sales AS(
      SELECT employee_id,SUM(total_amount) AS total_sales
      FROM orders
      GROUP BY employee_id
    ),
    company_avg AS (
        SELECT AVG(total_sales) AS avg_sales
        FROM employee_sales
    )
    SELECT es.employee_id, es.total_sales
    FROM employee_sales es
    CROSS JOIN company_avg c
    WHERE es.total_sales > c.avg_sales;

| employee_id | total_sales |
| ----------- | ----------- |
| 1           | 4350.0      |
| 2           | 3150.0      |

---
