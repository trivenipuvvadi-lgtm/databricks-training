# SQL to PySpark - Phase 3

from pyspark.sql import SparkSession
from pyspark.sql.functions import *
# Create Spark Session
spark = SparkSession.builder \
    .appName("Phase3_ETL") \
    .getOrCreate()
# Read CSV Files
customers = spark.read.format("csv") \
    .option("header", "true") \
    .option("inferSchema", "true") \
    .load("/samples/customers.csv")
sales = spark.read.format("csv") \
    .option("header", "true") \
    .option("inferSchema", "true") \
    .load("/samples/sales.csv")


# Display Data
print("Customers Table")
customers.show(customers.count(), truncate=False)

print("Sales Table")
customers.show(sales.count(), truncate=False)


# Print Schema
print("Customers Schema")
customers.printSchema()
print("Sales Schema")
sales.printSchema()


# Remove NULL Values
customers_clean = customers.dropna()

sales_clean = sales.dropna()

print("Customers After Cleaning")
customers_clean.show()

print("Sales After Cleaning")
sales_clean.show()


# Filter Invalid Records
customers_valid = customers_clean.filter(col("customer_id") > 0)

sales_valid = sales_clean.filter(col("quantity") > 0)

print("Valid Customers")
customers_valid.show()

print("Valid Sales")
sales_valid.show()
# Count Records
print("Customer Count :", customers_valid.count())
print("Sales Count :", sales_valid.count())



# Business Pipeline Task 1
# Read Sales Data -> Clean Nulls -> Calculate Daily Sales
print("Task 1 : Daily Sales")

daily_sales = sales.dropna() \
    .groupBy("sale_date") \
    .agg(
        sum("total_amount").alias("daily_sales")
    ) \
    .orderBy("sale_date")

daily_sales.show()

# Business Pipeline Task 2
# Read Customer Data -> Clean Invalid Rows -> City-wise Revenue
print("Task 2 : City-wise Revenue")

city_revenue = customers.dropna() \
    .join(sales.dropna(), "customer_id") \
    .groupBy("city") \
    .agg(
        sum("total_amount").alias("total_revenue")
    ) \
    .orderBy(desc("total_revenue"))

city_revenue.show()

# Display Complete Results
print("Daily Sales")
daily_sales.show(daily_sales.count(), truncate=False)

print("City-wise Revenue")
city_revenue.show(city_revenue.count(), truncate=False)



# Business Pipeline Task 3
# Find Repeat Customers (>2 Orders)
print("Task 3 : Repeat Customers (>2 Orders)")

repeat_customers = sales.groupBy("customer_id") \
    .agg(
        count("sale_id").alias("order_count")
    ) \
    .filter(col("order_count") > 2)

repeat_customers = repeat_customers.join(
    customers,
    "customer_id"
)

repeat_customers.show()

# Business Pipeline Task 4
# Highest Spending Customer in Each City
print("Task 4 : Highest Spending Customer in Each City")

customer_spend = customers.join(sales, "customer_id") \
    .groupBy(
        "city",
                "customer_id",
        "first_name",
        "last_name"
    ) \
    .agg(
        sum("total_amount").alias("total_spend")
    )

highest_spend = customer_spend.orderBy(
    "city",
    desc("total_spend")
)

highest_spend.show()

# Business Pipeline Task 5
# Final Reporting Table
print("Task 5 : Final Reporting Table")
report = customers.join(sales, "customer_id") \
    .groupBy(
        "customer_id",
        "first_name",
        "last_name",
        "city"
    ) \
    .agg(
        sum("total_amount").alias("total_spend"),
        count("sale_id").alias("order_count")
    ) \
    .orderBy("customer_id")

report.show(report.count(), truncate=False)


# Final ETL Pipeline
print("Final ETL Pipeline Completed Suc
