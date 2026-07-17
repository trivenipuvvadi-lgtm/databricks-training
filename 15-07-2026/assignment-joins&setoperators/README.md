# SQL Joins & Set Operators Assignment

This repository contains SQL queries demonstrating the use of **Joins** and **Set Operators** using sample Employee, Department, Project, Customer, and Order tables. The assignment covers basic, intermediate, and advanced SQL concepts commonly used in database management and real-world applications.

> **Note:** This project is designed for **MySQL (DB Fiddle)**. Since MySQL does not support `FULL OUTER JOIN`, `EXCEPT`, and `INTERSECT`, equivalent MySQL solutions using `UNION`, `NOT EXISTS`, and `INNER JOIN` are used where applicable.

---

# 📚 Topics Covered

## SQL Joins

- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- FULL OUTER JOIN (MySQL Equivalent)
- LEFT ANTI JOIN
- RIGHT ANTI JOIN
- FULL ANTI JOIN
- Self Join

## SQL Set Operators

- UNION
- UNION ALL
- EXCEPT (MySQL Equivalent)
- INTERSECT (MySQL Equivalent)

---

# 🗂️ Database Tables

## Join Tables

- Departments
- Employees
- Projects
- EmployeeProjects

## Set Operator Tables

- CurrentEmployees
- FormerEmployees
- DomesticCustomers
- InternationalCustomers
- OnlineOrders
- StoreOrders

---

# 📌 Assignment Overview

## SQL Joins

### INNER JOIN
Retrieve only matching records from two or more tables.

Examples:
- Employee and Department details
- Employee and Project details
- Department-wise employee information
- Salary with department location
- Employee-project assignments

### LEFT JOIN
Retrieve all records from the left table and matching records from the right table.

Examples:
- Employees without departments
- Employees without projects
- Departments including employees
- Projects with department details

### RIGHT JOIN
Retrieve all records from the right table and matching records from the left table.

Examples:
- Departments without employees
- Projects without employees
- Employee count by department
- Departments with projects

### FULL OUTER JOIN (MySQL Alternative)
Retrieve all matching and non-matching records from both tables using `LEFT JOIN` + `RIGHT JOIN` + `UNION`.

Examples:
- Employees and Departments
- Departments and Projects
- Employee and Project records

### LEFT ANTI JOIN
Retrieve records that exist only in the left table.

Examples:
- Employees without departments
- Employees without projects
- Departments without projects
- Projects without departments

### RIGHT ANTI JOIN
Retrieve records that exist only in the right table.

Examples:
- Departments without employees
- Projects without employees
- Departments without projects

### FULL ANTI JOIN
Retrieve unmatched records from both tables.

Examples:
- Unmatched Employees and Departments
- Unmatched Projects and Departments
- Orphan Records

### Advanced Join Queries

Examples:
- Highest-paid employee by department
- Department with highest average salary
- Highest-budget project employee
- Managers and Employees
- Employees with multiple projects
- Departments without managers
- Employees hired before their managers
- Complete employee report

---

# SQL Set Operators

## UNION
Combines multiple SELECT statements while removing duplicate records.

Examples:
- Employee names
- Customer names
- Departments
- Salaries
- IDs
- Cities
- Order amounts

## UNION ALL
Combines multiple SELECT statements while retaining duplicate records.

Examples:
- Employee records
- Customer records
- Order records
- Source-based records
- Salary lists

## EXCEPT (MySQL Alternative)

**Alternative Used:** `NOT EXISTS`

Used to retrieve records that exist in one table but not another.

Examples:
- Employees only in CurrentEmployees
- Customers only in DomesticCustomers
- Orders only in OnlineOrders
- Departments unique to a table

## INTERSECT (MySQL Alternative)

**Alternative Used:** `INNER JOIN`

Used to retrieve common records between tables.

Examples:
- Common employees
- Common departments
- Common customers
- Common salaries
- Common order IDs

---

# 💻 Technologies Used

- SQL
- MySQL
- DB Fiddle

---

# 🎯 Learning Outcomes

After completing this assignment, you will be able to:

- Understand different SQL Join operations
- Differentiate INNER, LEFT, RIGHT, and FULL JOIN
- Work with Self Joins and Anti Joins
- Retrieve matched and unmatched records
- Combine result sets using Set Operators
- Understand the difference between UNION and UNION ALL
- Find common and unique records efficiently
- Write optimized SQL queries
- Use MySQL alternatives for unsupported operators
- Solve real-world relational database problems

---

# ⚠️ MySQL Compatibility

| Feature | MySQL Support | Alternative Used |
|----------|---------------|------------------|
| INNER JOIN | ✅ | INNER JOIN |
| LEFT JOIN | ✅ | LEFT JOIN |
| RIGHT JOIN | ✅ | RIGHT JOIN |
| FULL OUTER JOIN | ❌ | LEFT JOIN + RIGHT JOIN + UNION |
| LEFT ANTI JOIN | ❌ | LEFT JOIN ... IS NULL |
| RIGHT ANTI JOIN | ❌ | RIGHT JOIN ... IS NULL |
| FULL ANTI JOIN | ❌ | LEFT JOIN + RIGHT JOIN + UNION |
| UNION | ✅ | UNION |
| UNION ALL | ✅ | UNION ALL |
| EXCEPT | ❌ | NOT EXISTS |
| INTERSECT | ❌ | INNER JOIN |

---

# 🚀 How to Run

1. Create the required database.
2. Create all tables.
3. Insert the sample data.
4. Execute the JOIN queries.
5. Execute the Set Operator queries.
6. Verify the output for each query.

---

# 📂 Repository Structure

```text
SQL-Joins-SetOperators/
│── README.md
│── joins.sql
│── set_operators.sql
```

---

# ⭐ Author

**Triveni Puvvadi**
