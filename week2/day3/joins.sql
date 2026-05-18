**Schema (MySQL v8)**

    CREATE TABLE employees (
        emp_id INT PRIMARY KEY,
        emp_name VARCHAR(50),
        manager_id INT,
        dept_id INT
    );
    
    CREATE TABLE departments (
        dept_id INT PRIMARY KEY,
        dept_name VARCHAR(50)
    );
    
    CREATE TABLE projects (
        project_id INT PRIMARY KEY,
        project_name VARCHAR(50),
        emp_id INT
    );
    
    CREATE TABLE salary (
        emp_id INT,
        salary INT
    );
    
    CREATE TABLE contacts (
        emp_id INT,
        phone VARCHAR(15)
    );
    
    INSERT INTO departments VALUES
    (1, 'HR'),
    (2, 'IT'),
    (3, 'Finance'),
    (4, 'Marketing'),
    (5, 'Sales');
    
    INSERT INTO employees VALUES
    (1, 'Karthik', NULL, 1),
    (2, 'Ajay', 1, 1),
    (3, 'Vijay', 1, 2),
    (4, 'Vinay', 2, 2),
    (5, 'Meena', 3, 3),
    (6, 'Veer', NULL, 4),
    (7, 'Keerthi', 4, 5),
    (8, 'Priya', 4, 5);
    
    INSERT INTO projects VALUES
    (1, 'Project A', 1),
    (2, 'Project B', 2),
    (3, 'Project C', 3),
    (4, 'Project D', 4),
    (5, 'Project E', 5);

---

**Query #1**

    -- 1. Retrieve the names of employees and their corresponding managers from the employees table, including employees without managers
    SELECT e.emp_name, m.emp_name AS manager_name
    FROM employees e
    LEFT JOIN employees m 
    ON e.manager_id = m.emp_id;

| emp_name | manager_name |
| -------- | ------------ |
| Karthik  |              |
| Ajay     | Karthik      |
| Vijay    | Karthik      |
| Vinay    | Ajay         |
| Meena    | Vijay        |
| Veer     |              |
| Keerthi  | Vinay        |
| Priya    | Vinay        |

---
**Query #2**

    -- 2. Display all employees and their corresponding departments, including employees without departments
    SELECT e.emp_name, d.dept_name
    FROM employees e
    LEFT JOIN departments d ON e.dept_id = d.dept_id;

| emp_name | dept_name |
| -------- | --------- |
| Karthik  | HR        |
| Ajay     | HR        |
| Vijay    | IT        |
| Vinay    | IT        |
| Meena    | Finance   |
| Veer     | Marketing |
| Keerthi  | Sales     |
| Priya    | Sales     |

---
**Query #3**

    -- 3. List employees who report to a manager with manager name
    SELECT e.emp_name, m.emp_name AS manager_name
    FROM employees e
    INNER JOIN employees m ON e.manager_id = m.emp_id;

| emp_name | manager_name |
| -------- | ------------ |
| Ajay     | Karthik      |
| Vijay    | Karthik      |
| Vinay    | Ajay         |
| Meena    | Vijay        |
| Keerthi  | Vinay        |
| Priya    | Vinay        |

---
**Query #4**

    -- 4. Find total salary per employee with department (include departments with no employees)
    SELECT d.dept_name, e.emp_name, s.salary
    FROM departments d
    LEFT JOIN employees e ON d.dept_id = e.dept_id
    LEFT JOIN salary s ON e.emp_id = s.emp_id;

| dept_name | emp_name | salary |
| --------- | -------- | ------ |
| HR        | Ajay     |        |
| HR        | Karthik  |        |
| IT        | Vinay    |        |
| IT        | Vijay    |        |
| Finance   | Meena    |        |
| Marketing | Veer     |        |
| Sales     | Priya    |        |
| Sales     | Keerthi  |        |

---
**Query #5**

    -- 5. Employees who do not belong to any department
    SELECT emp_name
    FROM employees
    WHERE dept_id IS NULL;

There are no results to be displayed.

---
**Query #6**

    -- 6. Employees and their projects (NULL if no project)
    SELECT e.emp_name, p.project_name
    FROM employees e
    LEFT JOIN projects p ON e.emp_id = p.emp_id;

| emp_name | project_name |
| -------- | ------------ |
| Karthik  | Project A    |
| Ajay     | Project B    |
| Vijay    | Project C    |
| Vinay    | Project D    |
| Meena    | Project E    |
| Veer     |              |
| Keerthi  |              |
| Priya    |              |

---
**Query #7**

    -- 7. Employees who have at least one project
    SELECT DISTINCT e.emp_name, p.project_name
    FROM employees e
    INNER JOIN projects p ON e.emp_id = p.emp_id;

| emp_name | project_name |
| -------- | ------------ |
| Karthik  | Project A    |
| Ajay     | Project B    |
| Vijay    | Project C    |
| Vinay    | Project D    |
| Meena    | Project E    |

---
**Query #8**

    -- 8. All projects with employees (include projects without employees)
    SELECT p.project_name, e.emp_name
    FROM projects p
    LEFT JOIN employees e ON p.emp_id = e.emp_id;

| project_name | emp_name |
| ------------ | -------- |
| Project A    | Karthik  |
| Project B    | Ajay     |
| Project C    | Vijay    |
| Project D    | Vinay    |
| Project E    | Meena    |

---
**Query #9**

    -- 9. Employees with salary (NULL if no salary)
    SELECT e.emp_name, s.salary
    FROM employees e
    LEFT JOIN salary s ON e.emp_id = s.emp_id;

| emp_name | salary |
| -------- | ------ |
| Karthik  |        |
| Ajay     |        |
| Vijay    |        |
| Vinay    |        |
| Meena    |        |
| Veer     |        |
| Keerthi  |        |
| Priya    |        |

---
**Query #10**

    -- 10. Employees with departments (including NULL departments)
    SELECT e.emp_name, d.dept_name
    FROM employees e
    LEFT JOIN departments d ON e.dept_id = d.dept_id;

| emp_name | dept_name |
| -------- | --------- |
| Karthik  | HR        |
| Ajay     | HR        |
| Vijay    | IT        |
| Vinay    | IT        |
| Meena    | Finance   |
| Veer     | Marketing |
| Keerthi  | Sales     |
| Priya    | Sales     |

---
**Query #11**

    -- 11. All departments with employees (including empty departments)
    SELECT d.dept_name, e.emp_name
    FROM departments d
    LEFT JOIN employees e ON d.dept_id = e.dept_id;

| dept_name | emp_name |
| --------- | -------- |
| HR        | Ajay     |
| HR        | Karthik  |
| IT        | Vinay    |
| IT        | Vijay    |
| Finance   | Meena    |
| Marketing | Veer     |
| Sales     | Priya    |
| Sales     | Keerthi  |

---
**Query #12**

    -- 12. Employees with contact info (including missing contacts)
    SELECT e.emp_name, c.phone
    FROM employees e
    LEFT JOIN contacts c ON e.emp_id = c.emp_id;

| emp_name | phone |
| -------- | ----- |
| Karthik  |       |
| Ajay     |       |
| Vijay    |       |
| Vinay    |       |
| Meena    |       |
| Veer     |       |
| Keerthi  |       |
| Priya    |       |

---
**Query #13**

    -- 13. Employees + departments + departments without employees
    SELECT e.emp_name, d.dept_name
    FROM employees e
    LEFT JOIN departments d ON e.dept_id = d.dept_id
    UNION
    SELECT e.emp_name, d.dept_name
    FROM departments d
    LEFT JOIN employees e ON d.dept_id = e.dept_id;

| emp_name | dept_name |
| -------- | --------- |
| Karthik  | HR        |
| Ajay     | HR        |
| Vijay    | IT        |
| Vinay    | IT        |
| Meena    | Finance   |
| Veer     | Marketing |
| Keerthi  | Sales     |
| Priya    | Sales     |

---
**Query #14**

    -- 14. Employees with no projects
    SELECT e.emp_name
    FROM employees e
    LEFT JOIN projects p ON e.emp_id = p.emp_id
    WHERE p.project_id IS NULL;

| emp_name |
| -------- |
| Veer     |
| Keerthi  |
| Priya    |

---
**Query #15**

    -- 15. Employees and projects (including NULL projects)
    SELECT e.emp_name, p.project_name
    FROM employees e
    LEFT JOIN projects p ON e.emp_id = p.emp_id;

| emp_name | project_name |
| -------- | ------------ |
| Karthik  | Project A    |
| Ajay     | Project B    |
| Vijay    | Project C    |
| Vinay    | Project D    |
| Meena    | Project E    |
| Veer     |              |
| Keerthi  |              |
| Priya    |              |

---
**Query #16**

    -- 16. All projects with employees (including unassigned projects)
    SELECT p.project_name, e.emp_name
    FROM projects p
    LEFT JOIN employees e ON p.emp_id = e.emp_id;

| project_name | emp_name |
| ------------ | -------- |
| Project A    | Karthik  |
| Project B    | Ajay     |
| Project C    | Vijay    |
| Project D    | Vinay    |
| Project E    | Meena    |

---
**Query #17**

    -- 17. Employees with manager and at least one project
    SELECT e.emp_name, m.emp_name AS manager_name, p.project_name
    FROM employees e
    INNER JOIN employees m ON e.manager_id = m.emp_id
    INNER JOIN projects p ON e.emp_id = p.emp_id;

| emp_name | manager_name | project_name |
| -------- | ------------ | ------------ |
| Ajay     | Karthik      | Project B    |
| Vijay    | Karthik      | Project C    |
| Vinay    | Ajay         | Project D    |
| Meena    | Vijay        | Project E    |

---
**Query #18**

    -- 18. Employees with departments only (exclude NULL departments)
    SELECT e.emp_name, d.dept_name
    FROM employees e
    INNER JOIN departments d ON e.dept_id = d.dept_id;

| emp_name | dept_name |
| -------- | --------- |
| Karthik  | HR        |
| Ajay     | HR        |
| Vijay    | IT        |
| Vinay    | IT        |
| Meena    | Finance   |
| Veer     | Marketing |
| Keerthi  | Sales     |
| Priya    | Sales     |

---
**Query #19**

    -- 19. Employees with departments (standard join)
    SELECT e.emp_name, d.dept_name
    FROM employees e
    JOIN departments d ON e.dept_id = d.dept_id;

| emp_name | dept_name |
| -------- | --------- |
| Karthik  | HR        |
| Ajay     | HR        |
| Vijay    | IT        |
| Vinay    | IT        |
| Meena    | Finance   |
| Veer     | Marketing |
| Keerthi  | Sales     |
| Priya    | Sales     |

---
**Query #20**

    -- 20. All departments with employees
    SELECT d.dept_name, e.emp_name
    FROM departments d
    LEFT JOIN employees e ON d.dept_id = e.dept_id;

| dept_name | emp_name |
| --------- | -------- |
| HR        | Ajay     |
| HR        | Karthik  |
| IT        | Vinay    |
| IT        | Vijay    |
| Finance   | Meena    |
| Marketing | Veer     |
| Sales     | Priya    |
| Sales     | Keerthi  |

---
**Query #21**

    -- 21. Employees with projects but no department
    SELECT e.emp_name, p.project_name
    FROM employees e
    INNER JOIN projects p ON e.emp_id = p.emp_id
    WHERE e.dept_id IS NULL;

There are no results to be displayed.

---
**Query #22**

    -- 22. Department-wise employee count (including empty departments)
    SELECT d.dept_name, COUNT(e.emp_id) AS employee_count
    FROM departments d
    LEFT JOIN employees e ON d.dept_id = e.dept_id
    GROUP BY d.dept_id,d.dept_name;

| dept_name | employee_count |
| --------- | -------------- |
| HR        | 2              |
| IT        | 2              |
| Finance   | 1              |
| Marketing | 1              |
| Sales     | 2              |

---
**Query #23**

    -- 23. Employees who report to a manager
    SELECT e.emp_name, m.emp_name AS manager_name
    FROM employees e
    INNER JOIN employees m ON e.manager_id = m.emp_id;

| emp_name | manager_name |
| -------- | ------------ |
| Ajay     | Karthik      |
| Vijay    | Karthik      |
| Vinay    | Ajay         |
| Meena    | Vijay        |
| Keerthi  | Vinay        |
| Priya    | Vinay        |

---
**Query #24**

    -- 24. Employees with managers (including NULL managers)
    SELECT e.emp_name, m.emp_name AS manager_name
    FROM employees e
    LEFT JOIN employees m ON e.manager_id = m.emp_id;

| emp_name | manager_name |
| -------- | ------------ |
| Karthik  |              |
| Ajay     | Karthik      |
| Vijay    | Karthik      |
| Vinay    | Ajay         |
| Meena    | Vijay        |
| Veer     |              |
| Keerthi  | Vinay        |
| Priya    | Vinay        |

---
**Query #25**

    -- 25. Department-wise employee count
    SELECT d.dept_name, COUNT(e.emp_id) AS employee_count
    FROM departments d
    LEFT JOIN employees e ON d.dept_id = e.dept_id
    GROUP BY d.dept_id,d.dept_name;

| dept_name | employee_count |
| --------- | -------------- |
| HR        | 2              |
| IT        | 2              |
| Finance   | 1              |
| Marketing | 1              |
| Sales     | 2              |

---
**Query #26**

    -- 26. All employees with departments (including empty departments)
    SELECT e.emp_name, d.dept_name
    FROM departments d
    LEFT JOIN employees e ON d.dept_id = e.dept_id;

| emp_name | dept_name |
| -------- | --------- |
| Ajay     | HR        |
| Karthik  | HR        |
| Vinay    | IT        |
| Vijay    | IT        |
| Meena    | Finance   |
| Veer     | Marketing |
| Priya    | Sales     |
| Keerthi  | Sales     |

---
**Query #27**

    -- 27. Employees without salary records
    SELECT e.emp_name
    FROM employees e
    LEFT JOIN salary s ON e.emp_id = s.emp_id
    WHERE s.emp_id IS NULL;

| emp_name |
| -------- |
| Karthik  |
| Ajay     |
| Vijay    |
| Vinay    |
| Meena    |
| Veer     |
| Keerthi  |
| Priya    |

---
**Query #28**

    -- 28. Employees with projects (including no project)
    SELECT e.emp_name, p.project_name
    FROM employees e
    LEFT JOIN projects p ON e.emp_id = p.emp_id;

| emp_name | project_name |
| -------- | ------------ |
| Karthik  | Project A    |
| Ajay     | Project B    |
| Vijay    | Project C    |
| Vinay    | Project D    |
| Meena    | Project E    |
| Veer     |              |
| Keerthi  |              |
| Priya    |              |

---
**Query #29**

    -- 29. Employees with department and project details
    SELECT e.emp_name, d.dept_name, p.project_name
    FROM employees e
    LEFT JOIN departments d ON e.dept_id = d.dept_id
    LEFT JOIN projects p ON e.emp_id = p.emp_id;

| emp_name | dept_name | project_name |
| -------- | --------- | ------------ |
| Karthik  | HR        | Project A    |
| Ajay     | HR        | Project B    |
| Vijay    | IT        | Project C    |
| Vinay    | IT        | Project D    |
| Meena    | Finance   | Project E    |
| Veer     | Marketing |              |
| Keerthi  | Sales     |              |
| Priya    | Sales     |              |

---
**Query #30**

    -- 30. Employees with departments (including NULL departments)
    SELECT e.emp_name, d.dept_name
    FROM employees e
    LEFT JOIN departments d ON e.dept_id = d.dept_id;

| emp_name | dept_name |
| -------- | --------- |
| Karthik  | HR        |
| Ajay     | HR        |
| Vijay    | IT        |
| Vinay    | IT        |
| Meena    | Finance   |
| Veer     | Marketing |
| Keerthi  | Sales     |
| Priya    | Sales     |

---
