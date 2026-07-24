1. Create Employee DataFrame


employee_data = [
    (101, "Alice", 25, "HR", 45000, "Chennai", "2022-01-15", 201),
    (102, "Bob", 30, "IT", 70000, "Bangalore", "2021-06-20", 202),
    (103, "Charlie", None, "IT", None, "Chennai", "2023-03-12", 202),
    (104, "David", 28, "Finance", 65000, "Mumbai", "2020-09-18", 203),
    (105, "Eva", 35, "HR", 80000, None, "2019-05-25", 201),
    (106, "Frank", 29, "Marketing", 55000, "Hyderabad", None, 204),
    (107, "Grace", 31, "Finance", None, "Pune", "2022-12-01", 203),
    (108, "Henry", 26, "IT", 60000, "Bangalore", "2024-01-10", None)
]

employee_columns = [
    "emp_id",
    "name",
    "age",
    "department",
    "salary",
    "city",
    "joining_date",
    "manager_id"
]

employee_df = spark.createDataFrame(employee_data, employee_columns)

employee_df.show()
employee_df.printSchema()

2. Create Department DataFrame

department_data = [
    ("HR", "Chennai"),
    ("IT", "Bangalore"),
    ("Finance", "Mumbai"),
    ("Marketing", "Hyderabad"),
    ("Sales", "Delhi")
]

department_columns = [
    "dept_name",
    "location"
]

department_df = spark.createDataFrame(department_data, department_columns)

department_df.show()
department_df.printSchema()

3. Create Manager DataFrame


manager_data = [
    (201, "Robert"),
    (202, "Jennifer"),
    (203, "Michael"),
    (204, "Sophia")
]

manager_columns = [
    "manager_id",
    "manager_name"
]

manager_df = spark.createDataFrame(manager_data, manager_columns)

manager_df.show()
manager_df.printSchema()

4. Additional Employee DataFrame (For Union Questions)


new_employee_data = [
    (109, "Irene", 27, "HR", 52000, "Chennai", "2024-03-11", 201),
    (110, "Jack", 34, "Sales", 72000, "Delhi", "2021-11-20", 205)
]

new_employee_df = spark.createDataFrame(
    new_employee_data,
    employee_columns
)

new_employee_df.show()

