# Databricks notebook source
# MAGIC %md
# MAGIC
# MAGIC ### pyspark assignment_1

# COMMAND ----------

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

# COMMAND ----------

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


# COMMAND ----------

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


# COMMAND ----------

new_employee_data = [
    (109, "Irene", 27, "HR", 52000, "Chennai", "2024-03-11", 201),
    (110, "Jack", 34, "Sales", 72000, "Delhi", "2021-11-20", 205)
]

new_employee_df = spark.createDataFrame(
    new_employee_data,
    employee_columns
)

new_employee_df.show()

# COMMAND ----------

print("Employee DataFrame Schema")
employee_df.printSchema()

print("Department DataFrame Schema")
department_df.printSchema()

print("Manager DataFrame Schema")
manager_df.printSchema()

# COMMAND ----------

print("Employee DataFrame")
employee_df.display(5)

print("Department DataFrame")
department_df.display(5)

print("Manager DataFrame")
manager_df.display(5)

# COMMAND ----------

from pyspark.sql.functions import col
employee_df.select(col("emp_id"),col("salary")).display()

# COMMAND ----------

employee_df.select(col("department")=="IT").display()

# COMMAND ----------

employee_df.select(col("city").isin("Bangalore","Chennai")).display()

# COMMAND ----------

employee_df.withColumn("Annual_Salary",
    col("salary")
).display()

# COMMAND ----------

from pyspark.sql.functions import when

employee_df.withColumn("experience_bonus",
    when(col("salary") > 55000, 5000).otherwise(2000)
).display()

# COMMAND ----------

employee_df.withColumn("bonus", col("salary") * 0.20).display()

# COMMAND ----------

from pyspark.sql.functions import upper
employee_df.select(upper(col("name"))).display()

# COMMAND ----------

from pyspark.sql.functions import lit
employee_df.withColumn( "Country",lit("India")).display()

# COMMAND ----------

employee_df.withColumnRenamed("department", "dept").display()

# COMMAND ----------

employee_df.withColumnRenamed("salary", "monthly_salary").display()

# COMMAND ----------

(employee_df
    .withColumnRenamed("name", "emp_name")
    .withColumnRenamed("department", "dept")
    .display())

# COMMAND ----------

employee_df.filter(employee_df.salary>60000).display()

# COMMAND ----------

employee_df.filter(employee_df.age>30).display()

# COMMAND ----------

employee_df.filter(col("salary")>57000).display()

# COMMAND ----------

employee_df.filter(col("salary").isNull()).display()

# COMMAND ----------

employee_df.filter(col("department") == "HR").display()

# COMMAND ----------

employee_df.filter(col("salary").isNotNull()).display()

# COMMAND ----------


employee_df.filter(col("name").startswith("A")).show()

# COMMAND ----------


employee_df.sort(col("salary").asc()).display()

# COMMAND ----------

employee_df.sort(col("salary").desc()).display()

# COMMAND ----------

employee_df.sort(col("age").desc()).display()

# COMMAND ----------

employee_df.limit(3).display()

# COMMAND ----------

employee_df.sort(col("department"), col("salary")).display()

# COMMAND ----------

employee_df.fillna(30000,subset=["salary"]).display()

# COMMAND ----------

employee_df.fillna("unknown",subset=["city"]).display()

# COMMAND ----------

(employee_df.fillna(30000,subset=["salary"])
          .fillna("unknown",subset=["age"])
          .display())

# COMMAND ----------

employee_df.fillna("avg_age",subset=["age"]).display()

# COMMAND ----------

employee_df.dropna("any").display()

# COMMAND ----------

employee_df.dropna(subset=["salary"]).display()

# COMMAND ----------

employee_df.dropna("all").display()

# COMMAND ----------

from pyspark.sql.functions import *
df_crr = employee_df.withColumn('curr_date',current_date())
df_crr.display()

# COMMAND ----------

df_crr.withColumn("joing date",date_add(col("curr_date"), 30)).display()

# COMMAND ----------



# COMMAND ----------

df_crr.withColumn("joing date",date_add(col("curr_date"), 30)).withColumn("daysdiff",datediff(col("joing date"),col("curr_date"))).display()

# COMMAND ----------

employee_df.withColumn(
    "joining_date",
    to_date(col("joining_date"), "yyyy-MM-dd")
).display()

# COMMAND ----------

employee_df.withColumn(
    "Joining_Year",
    year(col("joining_date"))
).display()

# COMMAND ----------

employee_df.withColumn(
    "Joining_month",
    year(col("joining_date"))
).display()

# COMMAND ----------

employee_df.withColumn(
    "Joining_day",
    year(col("joining_date"))
).display()

# COMMAND ----------

employee_df.filter(
    year(col("joining_date")) == 2022
).display()

# COMMAND ----------

employee_df.withColumn(
    "Current_Timestamp",
    current_timestamp()
).display()

# COMMAND ----------

from pyspark.sql.functions import *

employee_df.withColumn(
    "Years_Worked",
    floor(datediff(current_date(), col("joining_date")) / 365)
).display()

# COMMAND ----------

employee_df.filter(
    year(col("joining_date")) == year(current_date())
).display()

# COMMAND ----------

# MAGIC %md
# MAGIC ###joins

# COMMAND ----------

employee_df.join(department_df,employee_df.department == department_df.dept_name,"inner").display()

# COMMAND ----------

employee_df.join(department_df,employee_df.department == department_df.dept_name,"left").display()

# COMMAND ----------

employee_df.join(department_df,employee_df.department == department_df.dept_name,"right").display()

# COMMAND ----------

employee_df.join(department_df,employee_df.department == department_df.dept_name,"outer").display()

# COMMAND ----------

employee_df.join(manager_df, "manager_id", "inner").select("name","manager_name").display()

# COMMAND ----------

employee_df.join( department_df,employee_df.department == department_df.dept_name,"inner").filter(col("city") == col("location")).display()

# COMMAND ----------

department_df.join(employee_df,department_df.dept_name == employee_df.department,"left_anti").display()

# COMMAND ----------

# MAGIC %md
# MAGIC ###Union Operations

# COMMAND ----------

new_employee_data = [
    (109, "Irene", 27, "HR", 52000, "Chennai", "2024-03-11", 201),
    (110, "Jack", 34, "Sales", 72000, "Delhi", "2021-11-20", 205)
]

new_employee_df = spark.createDataFrame(
    new_employee_data,
    employee_columns
)

new_employee_df.display()

# COMMAND ----------

employee_df.union(new_employee_df).display()

# COMMAND ----------

employee_df.union(new_employee_df).count()

# COMMAND ----------

(employee_df.union(new_employee_df)
 .dropDuplicates()
 .display())

# COMMAND ----------

employee_df.unionByName(new_employee_df).display()

# COMMAND ----------

# MAGIC %md
# MAGIC ###Other Transformations

# COMMAND ----------

employee_df.select("department").distinct().display()

# COMMAND ----------

employee_df.groupBy("department") \
           .count() \
           .display()

# COMMAND ----------

from pyspark.sql.functions import avg
employee_df.groupBy("department") \
    .agg(avg("salary").alias("Average_Salary")) \
    .display()

# COMMAND ----------

from pyspark.sql.functions import max
employee_df.groupBy("department") \
    .agg(max("salary").alias("Maximum_Salary")) \
    .display()

# COMMAND ----------

from pyspark.sql.functions import min

employee_df.groupBy("department") \
    .agg(min("salary").alias("Minimum_Salary")) \
    .display()

# COMMAND ----------

from pyspark.sql.functions import sum

employee_df.groupBy("department") \
    .agg(sum("salary").alias("Total_Salary")) \
    .display()

# COMMAND ----------

employee_df.groupBy("city") \
    .count() \
    .display()

# COMMAND ----------

employee_df.select("city") \
    .distinct() \
    .display()

# COMMAND ----------

employee_df.dropDuplicates().display()

# COMMAND ----------

employee_df.drop("manager_id").display()

# COMMAND ----------

from pyspark.sql.functions import lower
employee_df.withColumn(
    "Lower_Name",
    lower(col("name"))
).display()

# COMMAND ----------

from pyspark.sql.functions import length

employee_df.withColumn(
    "Name_Length",
    length(col("name"))
).display()

# COMMAND ----------

from pyspark.sql.functions import substring
employee_df.withColumn( "First_3_Letters", substring(col("name"), 1, 3)).display()

# COMMAND ----------

from pyspark.sql.functions import concat, lit
employee_df.withColumn("Name_City", concat(col("name"), lit(" - "), col("city"))).display()

# COMMAND ----------

from pyspark.sql.functions import regexp_replace
employee_df.withColumn( "Updated_Name", regexp_replace(col("name"), "a", "@")).display()

# COMMAND ----------

from pyspark.sql.functions import sum
employee_df.select(sum("salary").alias("Total_Salary")).display()

# COMMAND ----------

from pyspark.sql.functions import avg
employee_df.select(sum("salary").alias("avg_Salary")).display()

# COMMAND ----------

from pyspark.sql.functions import min

min_salary = employee_df.select(min("salary")).collect()[0][0]

employee_df.filter(
    col("salary") == min_salary
).display()

# COMMAND ----------

employee_df.filter(col("salary") > 50000).count()

# COMMAND ----------

from pyspark.sql.functions import avg, col
dept_avg = employee_df.groupBy("department") \
    .agg(avg("salary").alias("avg_salary"))
employee_df.join(
    dept_avg,
    "department"
).filter(
    col("salary") > col("avg_salary")
).display()

# COMMAND ----------

from pyspark.sql.window import Window
from pyspark.sql.functions import dense_rank

window = Window.orderBy(col("salary").desc())

employee_df.withColumn(
    "Rank",
    dense_rank().over(window)
).filter(
    col("Rank") == 2
).display()

# COMMAND ----------

employee_df.groupBy("city") \
    .count() \
    .filter(col("count") > 1) \
    .display()

# COMMAND ----------

from pyspark.sql.functions import add_months, current_date

employee_df.filter(
    col("joining_date") >= add_months(current_date(), -24)
).display()

# COMMAND ----------

employee_df.fillna(
    {"manager_id": 999}
).display()

# COMMAND ----------

from pyspark.sql.functions import when

employee_df.withColumn(
    "Salary_Grade",
    when(col("salary") >= 80000, "A")
    .when(col("salary") >= 60000, "B")
    .when(col("salary") >= 40000, "C")
    .otherwise("D")
).display()

# COMMAND ----------

from pyspark.sql.functions import concat, lit

employee_df.withColumn(
    "Employee_Code",
    concat(lit("EMP"), col("emp_id"))
).display()

# COMMAND ----------

employee_df.filter(
    col("name").endswith("e")
).display()

# COMMAND ----------

employee_df.orderBy(
    col("joining_date")
).display()

# COMMAND ----------

from pyspark.sql.functions import datediff, current_date, col

employee_df.withColumn(
    "Years_Worked",
    (datediff(current_date(), col("joining_date")) / 365)
).filter(
    col("Years_Worked") > 3
).display()

# COMMAND ----------

from pyspark.sql.window import Window
from pyspark.sql.functions import rank

window_spec = Window.partitionBy("department").orderBy(col("salary").desc())

employee_df.withColumn(
    "Rank",
    rank().over(window_spec)
).display()

# COMMAND ----------

from pyspark.sql.window import Window
from pyspark.sql.functions import dense_rank

window_spec = Window.partitionBy("department").orderBy(col("salary").desc())

employee_df.withColumn(
    "Rank",
    dense_rank().over(window_spec)
).filter(
    col("Rank") <= 2
).display()

# COMMAND ----------

from pyspark.sql.functions import avg

employee_df.groupBy("department") \
    .agg(avg("salary").alias("Average_Salary")) \
    .filter(col("Average_Salary") > 60000) \
    .display()

# COMMAND ----------

employee_df.filter(
    col("manager_id").isNull()
).display()

# COMMAND ----------

employee_df.join(
    manager_df,
    "manager_id",
    "left"
).join(
    department_df,
    employee_df.department == department_df.dept_name,
    "left"
).select(
    "emp_id",
    "name",
    "department",
    "manager_name",
    "location"
).display()

# COMMAND ----------

employee_df.filter(
    col("age").isNull() |
    col("salary").isNull() |
    col("city").isNull() |
    col("joining_date").isNull() |
    col("manager_id").isNull()
).display()

# COMMAND ----------

from pyspark.sql.functions import avg, when

dept_avg = employee_df.groupBy("department") \
    .agg(avg("salary").alias("Avg_Salary"))

employee_df.join(
    dept_avg,
    "department"
).withColumn(
    "salary",
    when(col("salary").isNull(), col("Avg_Salary"))
    .otherwise(col("salary"))
).drop("Avg_Salary").display()

# COMMAND ----------

employee_df.withColumn(
    "Monthly_Tax",
    col("salary") * 0.10
).display()

# COMMAND ----------

from pyspark.sql.functions import dayofweek

employee_df.filter(
    dayofweek(col("joining_date")).isin(1, 7)
).display()

# COMMAND ----------

from pyspark.sql.functions import *

employee_df.join(
    manager_df,
    "manager_id",
    "left"
).join(
    department_df,
    employee_df.department == department_df.dept_name,
    "left"
).withColumn(
    "Bonus",
    col("salary") * 0.10
).withColumn(
    "Annual_Salary",
    col("salary") * 12
).withColumn(
    "Years_Worked",
    floor(datediff(current_date(), col("joining_date")) / 365)
).withColumn(
    "Salary_Grade",
    when(col("salary") >= 80000, "A")
    .when(col("salary") >= 60000, "B")
    .when(col("salary") >= 40000, "C")
    .otherwise("D")
).select(
    "name",
    "department",
    "manager_name",
    "location",
    "salary",
    "Bonus",
    "Annual_Salary",
    "Years_Worked",
    "Salary_Grade"
).display()