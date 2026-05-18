**Schema (MySQL v8)**

    CREATE TABLE Employees (
        emp_id INT,
        name VARCHAR(50),
        salary INT,
        bonus INT,
        manager_id INT
    );
    
    INSERT INTO Employees VALUES
    (1, 'Amit', 50000, NULL, 101),
    (2, 'John', NULL, 5000, 102),
    (3, 'Sara', 60000, NULL, NULL),
    (4, 'David', NULL, NULL, 103),
    (5, 'Priya', 45000, 3000, 101),
    (6, 'Kiran', NULL, NULL, NULL),
    (7, 'Ravi', 70000, 7000, 102),
    (8, 'Neha', NULL, 2000, NULL);
    
    CREATE TABLE Orders (
        order_id INT,
        customer_name VARCHAR(50),
        amount INT,
        discount INT,
        coupon_code VARCHAR(20)
    );
    
    INSERT INTO Orders VALUES
    (101, 'Amit', 1000, NULL, 'DISC10'),
    (102, 'John', NULL, 50, NULL),
    (103, 'Sara', 2000, NULL, 'DISC20'),
    (104, 'David', NULL, NULL, NULL),
    (105, 'Priya', 1500, 100, NULL),
    (106, 'Kiran', NULL, NULL, 'DISC5'),
    (107, 'Ravi', 3000, NULL, NULL),
    (108, 'Neha', NULL, 200, 'DISC15');
    
    CREATE TABLE Products (
        product_id INT,
        product_name VARCHAR(50),
        price INT,
        category VARCHAR(50),
        stock INT
    );
    
    INSERT INTO Products VALUES
    (1, 'Laptop', 50000, 'Electronics', 10),
    (2, 'Phone', NULL, 'Electronics', NULL),
    (3, 'Tablet', 30000, NULL, 5),
    (4, 'Headphones', NULL, NULL, NULL),
    (5, 'Monitor', 20000, 'Electronics', 0),
    (6, 'Keyboard', NULL, 'Accessories', 15),
    (7, 'Mouse', 500, NULL, NULL),
    (8, 'Printer', NULL, 'Electronics', 3);

---

**Query #1**

    -- LEVEL 1 (BASIC)
    -- =========================================
    
    -- 1. Show all employees whose salary is NULL
    SELECT *
    FROM Employees
    WHERE salary IS NULL;

| emp_id | name  | salary | bonus | manager_id |
| ------ | ----- | ------ | ----- | ---------- |
| 2      | John  |        | 5000  | 102        |
| 4      | David |        |       | 103        |
| 6      | Kiran |        |       |            |
| 8      | Neha  |        | 2000  |            |

---
**Query #2**

    -- 2. Show all orders where discount is NOT NULL
    SELECT *
    FROM Orders
    WHERE discount IS NOT NULL;

| order_id | customer_name | amount | discount | coupon_code |
| -------- | ------------- | ------ | -------- | ----------- |
| 102      | John          |        | 50       |             |
| 105      | Priya         | 1500   | 100      |             |
| 108      | Neha          |        | 200      | DISC15      |

---
**Query #3**

    -- 3. Get products where category is NULL
    SELECT *
    FROM Products
    WHERE category IS NULL;

| product_id | product_name | price | category | stock |
| ---------- | ------------ | ----- | -------- | ----- |
| 3          | Tablet       | 30000 |          | 5     |
| 4          | Headphones   |       |          |       |
| 7          | Mouse        | 500   |          |       |

---
**Query #4**

    -- 4. Count number of employees with NULL manager_id
    SELECT COUNT(*) AS null_manager_count
    FROM Employees
    WHERE manager_id IS NULL;

| null_manager_count |
| ------------------ |
| 3                  |

---
**Query #5**

    -- LEVEL 2 (IFNULL)
    -- =========================================
    
    -- 1. Replace NULL salary with 0
    SELECT name, IFNULL(salary, 0) AS salary
    FROM Employees;

| name  | salary |
| ----- | ------ |
| Amit  | 50000  |
| John  | 0      |
| Sara  | 60000  |
| David | 0      |
| Priya | 45000  |
| Kiran | 0      |
| Ravi  | 70000  |
| Neha  | 0      |

---
**Query #6**

    -- 2. Replace NULL bonus with 1000
    SELECT name, IFNULL(bonus, 1000) AS bonus
    FROM Employees;

| name  | bonus |
| ----- | ----- |
| Amit  | 1000  |
| John  | 5000  |
| Sara  | 1000  |
| David | 1000  |
| Priya | 3000  |
| Kiran | 1000  |
| Ravi  | 7000  |
| Neha  | 2000  |

---
**Query #7**

    -- 3. Show order amount, if NULL replace with 500
    SELECT customer_name, IFNULL(amount, 500) AS amount
    FROM Orders;

| customer_name | amount |
| ------------- | ------ |
| Amit          | 1000   |
| John          | 500    |
| Sara          | 2000   |
| David         | 500    |
| Priya         | 1500   |
| Kiran         | 500    |
| Ravi          | 3000   |
| Neha          | 500    |

---
**Query #8**

    -- 4. Replace NULL stock with 0
    SELECT product_name, IFNULL(stock, 0) AS stock
    FROM Products;

| product_name | stock |
| ------------ | ----- |
| Laptop       | 10    |
| Phone        | 0     |
| Tablet       | 5     |
| Headphones   | 0     |
| Monitor      | 0     |
| Keyboard     | 15    |
| Mouse        | 0     |
| Printer      | 3     |

---
**Query #9**

    -- LEVEL 3 (COALESCE)
    -- =========================================
    
    -- 1. Show employee earnings using salary, if NULL use bonus
    SELECT name, COALESCE(salary, bonus) AS earnings
    FROM Employees;

| name  | earnings |
| ----- | -------- |
| Amit  | 50000    |
| John  | 5000     |
| Sara  | 60000    |
| David |          |
| Priya | 45000    |
| Kiran |          |
| Ravi  | 70000    |
| Neha  | 2000     |

---
**Query #10**

    -- 2. Show first available value: salary -> bonus -> 0
    SELECT name, COALESCE(salary, bonus, 0) AS income
    FROM Employees;

| name  | income |
| ----- | ------ |
| Amit  | 50000  |
| John  | 5000   |
| Sara  | 60000  |
| David | 0      |
| Priya | 45000  |
| Kiran | 0      |
| Ravi  | 70000  |
| Neha  | 2000   |

---
**Query #11**

    -- 3. Show product price: price -> 1000 (default)
    SELECT product_name, COALESCE(price, 1000) AS final_price
    FROM Products;

| product_name | final_price |
| ------------ | ----------- |
| Laptop       | 50000       |
| Phone        | 1000        |
| Tablet       | 30000       |
| Headphones   | 1000        |
| Monitor      | 20000       |
| Keyboard     | 1000        |
| Mouse        | 500         |
| Printer      | 1000        |

---
**Query #12**

    -- 4. Get customer payment: amount -> discount -> 0
    SELECT customer_name, COALESCE(amount, discount, 0) AS payment
    FROM Orders;

| customer_name | payment |
| ------------- | ------- |
| Amit          | 1000    |
| John          | 50      |
| Sara          | 2000    |
| David         | 0       |
| Priya         | 1500    |
| Kiran         | 0       |
| Ravi          | 3000    |
| Neha          | 200     |

---
**Query #13**

    -- LEVEL 4 (NULLIF)
    -- =========================================
    
    -- 1. Convert salary to NULL if salary = 0
    SELECT name, NULLIF(salary, 0) AS salary
    FROM Employees;

| name  | salary |
| ----- | ------ |
| Amit  | 50000  |
| John  |        |
| Sara  | 60000  |
| David |        |
| Priya | 45000  |
| Kiran |        |
| Ravi  | 70000  |
| Neha  |        |

---
**Query #14**

    -- 2. Convert discount to NULL if discount = 0
    SELECT customer_name, NULLIF(discount, 0) AS discount
    FROM Orders;

| customer_name | discount |
| ------------- | -------- |
| Amit          |          |
| John          | 50       |
| Sara          |          |
| David         |          |
| Priya         | 100      |
| Kiran         |          |
| Ravi          |          |
| Neha          | 200      |

---
**Query #15**

    -- 3. Use NULLIF to avoid divide by zero
    SELECT amount / NULLIF(discount, 0)
    FROM Orders;

| amount / NULLIF(discount, 0) |
| ---------------------------- |
|                              |
|                              |
|                              |
|                              |
| 15.0                         |
|                              |
|                              |
|                              |

---
**Query #16**

    -- 4. Replace coupon_code with NULL if it is 'DISC10'
    SELECT customer_name, NULLIF(coupon_code, 'DISC10') AS coupon_code
    FROM Orders;

| customer_name | coupon_code |
| ------------- | ----------- |
| Amit          |             |
| John          |             |
| Sara          | DISC20      |
| David         |             |
| Priya         |             |
| Kiran         | DISC5       |
| Ravi          |             |
| Neha          | DISC15      |

---
**Query #17**

    -- LEVEL 5 (REAL-TIME SCENARIOS)
    -- =========================================
    
    -- 1. Calculate total earnings: salary + bonus (handle NULL properly)
    SELECT name,
           IFNULL(salary, 0) + IFNULL(bonus, 0) AS total_earnings
    FROM Employees;

| name  | total_earnings |
| ----- | -------------- |
| Amit  | 50000          |
| John  | 5000           |
| Sara  | 60000          |
| David | 0              |
| Priya | 48000          |
| Kiran | 0              |
| Ravi  | 77000          |
| Neha  | 2000           |

---
**Query #18**

    -- 2. Show employees where both salary AND bonus are NULL
    SELECT *
    FROM Employees
    WHERE salary IS NULL
    AND bonus IS NULL;

| emp_id | name  | salary | bonus | manager_id |
| ------ | ----- | ------ | ----- | ---------- |
| 4      | David |        |       | 103        |
| 6      | Kiran |        |       |            |

---
**Query #19**

    -- 3. Show products where price is NULL but category is NOT NULL
    SELECT *
    FROM Products
    WHERE price IS NULL
    AND category IS NOT NULL;

| product_id | product_name | price | category    | stock |
| ---------- | ------------ | ----- | ----------- | ----- |
| 2          | Phone        |       | Electronics |       |
| 6          | Keyboard     |       | Accessories | 15    |
| 8          | Printer      |       | Electronics | 3     |

---
**Query #20**

    -- 4. Show orders where both amount and discount are NULL
    SELECT *
    FROM Orders
    WHERE amount IS NULL
    AND discount IS NULL;

| order_id | customer_name | amount | discount | coupon_code |
| -------- | ------------- | ------ | -------- | ----------- |
| 104      | David         |        |          |             |
| 106      | Kiran         |        |          | DISC5       |

---
**Query #21**

    -- LEVEL 6 (ADVANCED)
    -- =========================================
    
    -- 1. Show employee income: COALESCE(salary, bonus, 1000)
    SELECT name,
           COALESCE(salary, bonus, 1000) AS income
    FROM Employees;

| name  | income |
| ----- | ------ |
| Amit  | 50000  |
| John  | 5000   |
| Sara  | 60000  |
| David | 1000   |
| Priya | 45000  |
| Kiran | 1000   |
| Ravi  | 70000  |
| Neha  | 2000   |

---
**Query #22**

    -- 2. Replace empty discount with NULL using NULLIF
    SELECT customer_name,
           NULLIF(discount, 0) AS discount
    FROM Orders;

| customer_name | discount |
| ------------- | -------- |
| Amit          |          |
| John          | 50       |
| Sara          |          |
| David         |          |
| Priya         | 100      |
| Kiran         |          |
| Ravi          |          |
| Neha          | 200      |

---
**Query #23**

    -- 3. Show final payable amount: amount - discount (handle NULL)
    SELECT customer_name,
           IFNULL(amount, 0) - IFNULL(discount, 0) AS final_amount
    FROM Orders;

| customer_name | final_amount |
| ------------- | ------------ |
| Amit          | 1000         |
| John          | -50          |
| Sara          | 2000         |
| David         | 0            |
| Priya         | 1400         |
| Kiran         | 0            |
| Ravi          | 3000         |
| Neha          | -200         |

---
**Query #24**

    -- 4. Find employees where salary is NULL but manager exists
    SELECT *
    FROM Employees
    WHERE salary IS NULL
    AND manager_id IS NOT NULL;

| emp_id | name  | salary | bonus | manager_id |
| ------ | ----- | ------ | ----- | ---------- |
| 2      | John  |        | 5000  | 102        |
| 4      | David |        |       | 103        |

---

[View on DB Fiddle](https://www.db-fiddle.com/)
