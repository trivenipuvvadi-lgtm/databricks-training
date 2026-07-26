
# PySpark Assignment

## Assignment Overview

This repository contains my **PySpark Assignment** completed using **Databricks Community Edition**. The assignment provides hands-on practice with PySpark DataFrame operations, transformations, joins, aggregations, string functions, date functions, and window functions.

The assignment uses manually created DataFrames to understand and implement various PySpark concepts.

---

## Platform

- Databricks Community Edition

---

## DataFrames Used

The assignment includes the following DataFrames:

- Employee DataFrame
- Department DataFrame
- Manager DataFrame
- New Employee DataFrame (for Union Operations)

---

## Assignment Topics

### Part A – DataFrame Creation
- Create Employee DataFrame
- Create Department DataFrame
- Create Manager DataFrame
- Display Schema
- Display Records

### Part B – Select Operations
- Select specific columns
- Alias columns
- Calculate updated salary
- Filter records

### Part C – withColumn()
- Add new columns
- Calculate bonus
- Calculate annual salary
- Conditional columns using `when()`
- Add constant values using `lit()`

### Part D – withColumnRenamed()
- Rename DataFrame columns

### Part E – Filter Operations
- `filter()`
- `where()`
- `isNull()`
- `isNotNull()`
- `between()`
- `startswith()`

### Part F – Sorting Operations
- `orderBy()`
- `sort()`
- Ascending and Descending sorting
- `limit()`

### Part G – Handling Missing Values
- `fillna()`
- `dropna()`
- Replace NULL values
- Remove NULL values

### Part H – Date Functions
- `to_date()`
- `current_date()`
- `current_timestamp()`
- `year()`
- `month()`
- `dayofmonth()`
- `date_add()`
- `date_sub()`
- `datediff()`
- `add_months()`
- `dayofweek()`

### Part I – Joins
- Inner Join
- Left Join
- Right Join
- Full Outer Join
- Left Anti Join

### Part J – Union Operations
- `union()`
- `unionByName()`
- `dropDuplicates()`

### Part K – Other Transformations
- `distinct()`
- `groupBy()`
- `count()`
- `avg()`
- `sum()`
- `max()`
- `min()`
- `drop()`

### Part L – String Functions
- `lower()`
- `upper()`
- `length()`
- `substring()`
- `concat()`
- `regexp_replace()`

### Part M – Aggregations
- Total Salary
- Average Salary
- Highest Salary
- Lowest Salary
- Employee Count

### Part N – Advanced Operations
- Department Average Salary
- Salary Grades
- Employee ID Generation
- Sorting by Joining Date
- Experience Calculation
- Replace NULL Values

### Challenge Questions
- Window Functions
- `row_number()`
- `rank()`
- `dense_rank()`
- Department-wise Ranking
- Top Salaries
- Final Employee Report
- Bonus Calculation
- Annual Salary Calculation
- Tax Calculation

---

## Key PySpark Functions Practiced

- `select()`
- `filter()`
- `where()`
- `withColumn()`
- `withColumnRenamed()`
- `when()`
- `otherwise()`
- `lit()`
- `groupBy()`
- `agg()`
- `join()`
- `union()`
- `unionByName()`
- `dropDuplicates()`
- `fillna()`
- `dropna()`
- `orderBy()`
- `sort()`
- `regexp_replace()`
- `substring()`
- `concat()`
- `current_date()`
- `current_timestamp()`
- `datediff()`
- `date_add()`
- `date_sub()`
- `add_months()`
- `dayofweek()`
- `row_number()`
- `rank()`
- `dense_rank()`

---

## Repository Structure

```text
pyspark_assignment/
│── PySpark_Assignment.ipynb
│── dataframe_creation.py
│── Pyspark_AssignmentQuestions.docx
└── README.md
```

---

## Learning Outcomes

Through this assignment, I learned how to:

- Create and manipulate PySpark DataFrames.
- Perform DataFrame transformations using PySpark functions.
- Filter, sort, and aggregate data.
- Handle missing (NULL) values.
- Work with date and time functions.
- Perform different types of joins and union operations.
- Apply string functions for data transformation.
- Use window functions for ranking and analytical operations.
- Build reports using PySpark DataFrame transformations.

---

## Repository Contents

- **PySpark_Assignment.ipynb** – Complete PySpark assignment notebook.
- **dataframe_creation.py** – Code for creating all DataFrames used in the assignment.
- **Pyspark_AssignmentQuestions.docx** – Assignment question document.
- **README.md** – Assignment documentation.

---

## Conclusion

This assignment strengthened my understanding of PySpark DataFrame operations and provided practical experience with transformations, filtering, joins, aggregations, date functions, string functions, and window functions using Databricks Community Edition.

---

## Author

**Triveni Puvvadi**
