from pyspark.sql import SparkSession
from pyspark.sql.functions import *

# ==========================================
# Create Spark Session
# ==========================================

spark = SparkSession.builder \
    .appName("Phase4_MiniProject") \
    .getOrCreate()

# ==========================================
# Load CSV Files
# ==========================================

customers = spark.read \
    .option("header", True) \
    .option("inferSchema", True) \
    .csv("/samples/customers.csv")

sales = spark.read \
    .option("header", True) \
    .option("inferSchema", True) \
    .csv("/samples/sales.csv")

print("Customers Data")
customers.show(5)

print("Sales Data")
sales.show(5)

# ==========================================
# Data Cleaning
# ==========================================

customers = customers.filter(col("customer_id").isNotNull())

sales = sales.filter(col("customer_id").isNotNull())

customers = customers.dropDuplicates()

sales = sales.dropDuplicates()

sales = sales.filter(col("total_amount") > 0)

sales = sales.withColumn(
    "sale_date",
    to_date(col("sale_date"))
)

# ==========================================
# Join Customers and Sales
# ==========================================

df = sales.join(customers, "customer_id", "inner")

print("Joined Data")
df.show()

# ==========================================
# Task 1 : Daily Sales
# ==========================================

daily_sales = df.groupBy("sale_date") \
    .agg(
        sum("total_amount").alias("total_sales")
    )

print("Daily Sales")
daily_sales.show()

# ==========================================
# Task 2 : City-wise Revenue
# ==========================================

city_revenue = df.groupBy("city") \
    .agg(
        sum("total_amount").alias("total_revenue")
    )

print("City-wise Revenue")
city_revenue.show()

# ==========================================
# Task 3 : Top 5 Customers
# ==========================================

customer_spend = df.groupBy(
    "customer_id",
    "first_name",
    "last_name"
).agg(
    sum("total_amount").alias("total_spend")
)

top5_customers = customer_spend.orderBy(
    col("total_spend").desc()
).limit(5)

print("Top 5 Customers")
top5_customers.show()

# ==========================================
# Task 4 : Repeat Customers
# ==========================================

order_count = df.groupBy("customer_id") \
    .agg(
        count("sale_id").alias("order_count")
    )

repeat_customers = order_count.filter(
    col("order_count") > 1
)

print("Repeat Customers")
repeat_customers.show()

# ==========================================
# Task 5 : Customer Segmentation
# ==========================================

customer_segment = customer_spend.withColumn(
    "segment",
    when(col("total_spend") > 10000, "Gold")
    .when(
        (col("total_spend") >= 5000) &
        (col("total_spend") <= 10000),
        "Silver"
    )
    .otherwise("Bronze")
)

print("Customer Segmentation")
customer_segment.show()

# ==========================================
# Task 6 : Final Reporting Table
# ==========================================

customer_info = customers.select(
    "customer_id",
    "first_name",
    "last_name",
    "city"
)

final_df = customer_info \
    .join(order_count, "customer_id") \
    .join(
        customer_segment.select(
            "customer_id",
            "total_spend",
            "segment"
        ),
        "customer_id"
    )

final_df = final_df.select(
    concat_ws(" ", col("first_name"), col("last_name")).alias("customer_name"),
    col("city"),
    col("total_spend"),
    col("order_count"),
    col("segment")
)

print("Final Reporting Table")
final_df.show(truncate=False)

# ==========================================
# Task 7 : Save Output
# ==========================================

final_df.write \
    .mode("overwrite") \
    .option("header", True) \
    .csv("/tmp/report") 

print("===================================")
print("Mini Project Completed Successfully")
print("Output saved to /samples/output/report")
print("===================================")
