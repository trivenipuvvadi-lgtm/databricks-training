from pyspark.sql import SparkSession
from pyspark.sql.functions import *
# Create Spark Session
spark = SparkSession.builder \
    .appName("Phase2_SQL_PySpark") \
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
sales.show(sales.count(), truncate=False)


# Print Schema
print("Customers Schema")
customers.printSchema()
print("Sales Schema")
sales.printSchema()


# Remove rows with missing customer_id
customers = customers.dropna(subset=["customer_id"])
sales = sales.dropna(subset=["customer_id"])


# Exercise 1 : Total Order Amount for Each Customer
print("Exercise 1 : Total Order Amount for Each Customer")

total_spend = sales.groupBy("customer_id") \
    .agg(
        sum("total_amount").alias("total_spend")
    ) \
    .orderBy("customer_id")

total_spend.show()


# Exercise 2 : Top 3 Customers by Total Spend
print("Exercise 2 : Top 3 Customers by Total Spend")

top3 = sales.groupBy("customer_id") \
    .agg(
        sum("total_amount").alias("total_spend")
    ) \
    .orderBy(desc("total_spend")) \
    .limit(3)

top3.show()
# Exercise 3 : Customers With No Orders
print("Exercise 3 : Customers With No Orders")

customers_no_orders = customers.join(
    sales,
    "customer_id",
    "left_anti"
)

customers_no_orders.show()


# Exercise 4 : City-wise Total Revenue
print("Exercise 4 : City-wise Total Revenue")

city_revenue = customers.join(
    sales,
    "customer_id"
).groupBy(
    "city"
).agg(
    sum("total_amount").alias("total_revenue")
).orderBy(
    desc("total_revenue")
)

city_revenue.show()
# Exercise 5 : Average Order Amount per Customer
print("Exercise 5 : Average Order Amount per Customer")

average_order = sales.groupBy("customer_id") \
    .agg(
        avg("total_amount").alias("average_order")
    ) \
    .orderBy("customer_id")

average_order.show()


# Exercise 6 : Customers With More Than One Order
print("Exercise 6 : Customers With More Than One Order")

multiple_orders = sales.groupBy("customer_id") \
    .agg(
        count("sale_id").alias("order_count")
    ) \
    .filter(
        col("order_count") > 1
    )

multiple_orders.show()
# Exercise 7 : Sort Customers by Total Spend Descending
print("Exercise 7 : Sort Customers by Total Spend Descending")

customer_spend = customers.join(
    sales,
    "customer_id"
).groupBy(
    "customer_id",
    "first_name",
    "last_name",
    "city"
).agg(
    sum("total_amount").alias("total_spend")
).orderBy(
    desc("total_spend")
)

customer_spend.show(customer_spend.count(), truncate=False)

print("Phase 2 Completed Successfully")
