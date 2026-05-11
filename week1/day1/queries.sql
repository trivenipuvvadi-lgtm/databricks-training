--- BASIC QUERIES
-- Query 1: Select all columns from the Employee table
SELECT * FROM Employee;
-- Query 2: Select name and salary columns from the Employee table
SELECT name,salary FROM Employee;
-- Query 3: Select Employees who are older than 30
SELECT * FROM Employee WHERE age>30;
-- Query 4: Select the names of all departments
SELECT name FROM Department;
-- Query 5: Select employee who works in the IT department
SELECT * FROM Employee WHERE department_id=1;
--- STRING MATCHING QUERIES
-- Query 6: Select employees whose names starts with 'J'
SELECT * FROM Employee WHERE name LIKE 'J%';
-- Query 7: Select employees whose name end with 'e'
SELECT * FROM Employee WHERE name LIKE '%e';
-- Query 8: Select employees whose name contains 'a'
SELECT * FROM Employee WHERE name LIKE '%a%';
-- Query 9: Select employees whose names are exactly 9 characters long
SELECT * FROM Employee WHERE CHAR_LENGTH(name)=9;
-- Query 10: Select employees whose name have 'o' as the second character
SELECT * FROM Employee WHERE SUBSTR(name,2,1)='o';
--- DATE QUERIES
-- Query 11: Select employees hired in the year 2020
SELECT * FROM Employee WHERE YEAR(hire_date)=2020;
-- Query 12: Select employees hired in January of any year
SELECT * FROM Employee WHERE MONTH(hire_date)=01;
-- Query 13: Select employees hired before 2019
SELECT * FROM Employee WHERE YEAR(hire_date)<2019;
-- Query 14: Select employees hired on or after March 1,2021
SELECT * FROM Employee WHERE hire_date>=2021-03-01;
-- Query 15: Select employees hired in the last two years
SELECT * FROM Employee WHERE hire_date> ADDDATE(CURRENT_DATE,INTERVAL -2 YEAR);
--- AGGREGATE QUERIES
-- Query 16: Select the total salary of all employees
SELECT SUM(salary) FROM Employee;
-- Query 17: Select average salary of employees
SELECT AVG(salary) FROM Employee;
-- Query 18: Select the minimum salary in the employee table
SELECT MIN(salary) FROM Employee;
-- Query 19: Select the number of employees in each department
SELECT department_id,COUNT(*) FROM Employee GROUP BY department_id;
-- Query 20: Select the average salary of employees in each department
SELECT department_id,AVG(salary) FROM Employee GROUP BY department_id;
--- GROUP BY QUERIES
-- Query 21: Select the total salary for each department
SELECT department_id,SUM(salary) FROM Employee GROUP BY department_id;
-- Query 22: Select the average age of employees in each department
SELECT department_id,AVG(age) FROM Employee GROUP BY department_id;
-- Query 23: Select the number of employees hired in each year
SELECT YEAR(hire_date),COUNT(*) FROM Employee GROUP BY YEAR(hire_date);
-- Query 24: Select the highest salary in each department
SELECT department_id,MAX(salary) FROM Employee GROUP BY department_id;
-- Query 25: Select the department with highest average salary
SELECT department_id,AVG(salary) AS avg_sal FROM Employee GROUP BY department_id ORDER BY avg_sal DESC LIMIT 1;
--- HAVING QUERIES
-- Query 26: Select departments with more than 2 employees
SELECT department_id,COUNT(*) FROM Employee GROUP BY department_id HAVING COUNT(*)>2;
-- Query 27: Select departments with an average salary greater than 55000
SELECT department_id,AVG(salary) FROM Employee GROUP BY department_id HAVING AVG(salary)>55000;
-- Query 28: Select years with more than 1 employee hired
SELECT YEAR(hire_date),COUNT(*) AS employee_count FROM Employee GROUP BY YEAR(hire_date) HAVING COUNT(*)>1;
-- Query 29: Select departments with a total salary expense less than 100000
SELECT department_id,SUM(salary) FROM Employee GROUP BY department_id HAVING SUM(salary)<100000;
-- Query 30: Select departments with maximum salary above 75000
SELECT department_id,MAX(salary) FROM Employee GROUP BY department_id HAVING MAX(salary)>75000;
-- ORDER BY QUERIES
-- Query 31: Select all employees ordered by their salary in ascending order
SELECT * FROM Employee ORDER BY salary ASC;

-- Query 32: Select all employees ordered by their age in descending order
SELECT * FROM Employee ORDER BY age DESC;

-- Query 33: Select all employees ordered by their hire date in ascending order
SELECT * FROM Employee ORDER BY hire_date ASC;

-- Query 34: Select employees ordered by their department and then by their salary
SELECT * FROM Employee ORDER BY department_id ASC, salary ASC;

-- Query 35: Select departments ordered by the total salary of their employees
SELECT department_id, SUM(salary) AS total_salary
FROM Employee
GROUP BY department_id
ORDER BY total_salary DESC;

--- JOIN QUERIES
-- Query 36: Select employee names along with their department names
SELECT E.name AS employee_name, D.name AS department_name
FROM Employee E
INNER JOIN Department D
ON E.department_id = D.department_id;

-- Query 37: Select project names along with the department names they belong to
SELECT P.name AS project_name, D.name AS department_name
FROM Project P
INNER JOIN Department D
ON P.department_id = D.department_id;

-- Query 38: Select employee names and their corresponding project names
SELECT E.name AS employee_name, P.name AS project_name
FROM Employee E
INNER JOIN Project P
ON E.department_id = P.department_id;

-- Query 39: Select all employees and their departments, including those without a department
SELECT E.name AS employee_name, D.name AS department_name
FROM Employee E
LEFT JOIN Department D
ON E.department_id = D.department_id;

-- Query 40: Select all departments and their employees, including departments without employees
SELECT D.name AS department_name, E.name AS employee_name
FROM Department D
LEFT JOIN Employee E
ON D.department_id = E.department_id;

-- Query 41: Select employees who are not assigned to any project
SELECT E.name AS employee_name
FROM Employee E
LEFT JOIN Project P
ON E.department_id = P.department_id
WHERE P.project_id IS NULL;

-- Query 42: Select employees and the number of projects their department is working on
SELECT E.name AS employee_name, COUNT(P.project_id) AS project_count
FROM Employee E
LEFT JOIN Project P
ON E.department_id = P.department_id
GROUP BY E.emp_id, E.name
ORDER BY E.name;

-- Query 43: Select the departments that have no employees
SELECT D.name AS department_name
FROM Department D
LEFT JOIN Employee E
ON D.department_id = E.department_id
WHERE E.emp_id IS NULL;

-- Query 44: Select employee names who share the same department with 'John Doe'
SELECT E.name AS employee_name
FROM Employee E
WHERE E.department_id = (
    SELECT department_id
    FROM Employee
    WHERE name = 'John Doe'
);

-- Query 45: Select the department name with the highest salary
SELECT D.name AS department_name,AVG(E.salary) AS avg_salary 
FROM Employee E 
INNER JOIN Department D 
ON E.department_id=D.department_id
GROUP BY D.department_id,D.name
ORDER BY avg_salary DESC
LIMIT 1;

-- Query 46: Select the employee with the highest salary
SELECT name, salary
FROM Employee
WHERE salary = (
    SELECT MAX(salary)
    FROM Employee
);

-- Query 47: Select employees whose salary is above the average salary
SELECT name,salary FROM Employee
WHERE salary>(
  SELECT AVG(salary)
  FROM Employee
);

-- Query 48: Select the second highest salary from the employee table
SELECT salary
FROM Employee
WHERE salary<(
  SELECT MAX(salary)
  FROM Employee
)
ORDER BY salary DESC
LIMIT 1;

-- Query 49: Select the department with the most employees
SELECT department_id,COUNT(*) AS employee_count
FROM Employee
GROUP BY department_id
ORDER BY employee_count DESC
LIMIT 1;

-- Query 50: Select employees who earn more than average salary of their department
SELECT E1.name
FROM Employee E1
WHERE E1.salary > (
    SELECT AVG(E2.salary)
    FROM Employee E2
    WHERE E2.department_id = E1.department_id
);

-- Query 51: Select the nth highest salary (for example, 3rd highest)
SELECT DISTINCT salary
FROM Employee
ORDER BY salary DESC
LIMIT 1 OFFSET 2;

-- Query 52: Select employees who are older than all employees in HR department
SELECT *
FROM Employee E1
WHERE E1.age > ALL (
    SELECT E2.age
    FROM Employee E2
    JOIN Department D
    ON E2.department_id = D.department_id
    WHERE D.name = 'HR'
);

-- Query 53: Select departments where the average salary is greater than 55000
SELECT department_id,AVG(salary) AS avg_salary
FROM Employee
GROUP BY department_id
HAVING avg_salary>55000;

-- Query 54: Select employees who work in a department with atleast 2 projects
SELECT E.name
FROM Employee E
WHERE E.department_id IN (
    SELECT P.department_id
    FROM Project P
    GROUP BY P.department_id
    HAVING COUNT(*) >= 2
);

-- Query 55: Select employees who were hired on the same day as 'Jane smith'
SELECT E.name
FROM Employee E
WHERE E.hire_date = (
    SELECT hire_date
    FROM Employee
    WHERE name = 'Jane Smith'
);

--- COMBINED MODERATE DIFFICULTY QUERIES
-- Query 56: Select the total salary of employees hired in the year 2020
SELECT SUM(salary) AS total_salary 
FROM Employee
WHERE YEAR(hire_date)=2020;
-- Query 57: Select the average salary of the employees in each department , ordered by the average salary in descending order
SELECT department_id,AVG(salary) AS avg_salary
FROM Employee 
GROUP BY department_id
ORDER BY avg_salary DESC
-- Query 58: Select departments with more than 1 employee and an average salary greater than 55000
SELECT department_id,AVG(salary) AS avg_salary
FROM Employee
GROUP BY department_id
HAVING COUNT(*)>1 AND avg_salary>55000
-- Query 59: Select employees hired in the last 2 years , ordered by their hired date
SELECT * FROM Employee
WHERE hire_date >= DATE_SUB(CURDATE(),INTERVAL 2 YEAR) 
ORDER BY hire_date;
-- Query 60: Select the total number of employees and the average salary for departments with more than 2 employees
SELECT department_id,COUNT(*) AS employee_count, AVG(salary) AS avg_salary
FROM Employee
GROUP BY department_id
HAVING COUNT(*)>2;
-- Query 61: Select the name and salary of employees whose salary is above the average salary of their department
SELECT name,salary
FROM Employee
WHERE salary>(
  SELECT AVG(salary)
  FROM Employee
  WHERE department_id = Employee.department_id
);
-- Query 62: Select the names of employees who are hired on the same date as the oldest employee in the company
SELECT name
FROM Employee
WHERE hire_date = (
    SELECT MIN(hire_date)
    FROM Employee
);
-- Query 63: Select the department names along with the total number of projects they are working on,ordered by the number of projects
SELECT d.name AS department_name, COUNT(p.project_id) AS total_projects
FROM Department d
JOIN Project p ON d.department_id = p.department_id
GROUP BY d.department_id, d.name
ORDER BY total_projects;
-- Query 64: Select the employee name with the highest salary in each department
SELECT e.department_id, e.name, e.salary AS highest_salary
FROM Employee e
WHERE e.salary = (
    SELECT MAX(salary)
    FROM Employee
    WHERE department_id = e.department_id
);
-- Query 65: Select the names and salaries of employees who are older than the average age of employees in their department
SELECT e.name AS employee_name, e.salary
FROM Employee e
WHERE e.age > (
    SELECT AVG(age)
    FROM Employee
    WHERE department_id = e.department_id
);
