 # SQL Retail Database Project

This project demonstrates the creation, data cleaning, exploration, and analysis of a retail sales database using SQL. The goal is to showcase various SQL queries for answering business-related questions and performing data analysis.

## Database Creation

```sql
CREATE DATABASE Sql_Project_p1;
USE Sql_Project_p1;

CREATE TABLE retail_sales (
    transactions_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(15),
    age INT,
    category VARCHAR(15),
    quantiy INT,
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale FLOAT
);
```

## Data Cleaning

### Check for Null Columns

```sql
SELECT * 
FROM retail_sales 
WHERE 
    transactions_id IS NULL 
    OR sale_date IS NULL 
    OR sale_time IS NULL 
    OR customer_id IS NULL 
    OR gender IS NULL 
    OR age IS NULL 
    OR category IS NULL 
    OR quantiy IS NULL 
    OR price_per_unit IS NULL 
    OR cogs IS NULL 
    OR total_sale IS NULL;
```

## Data Exploration

### Count Total Rows in the Table

```sql
SELECT COUNT(*) FROM retail_sales;
```

### Count Unique Customers

```sql
SELECT COUNT(DISTINCT customer_id) AS total_customers FROM retail_sales;
```

### Count Unique Categories

```sql
SELECT DISTINCT category AS unique_categories FROM retail_sales;
```

## Data Analysis

### Question 1: Retrieve All Sales Made on '2022-11-05'

```sql
SELECT *
FROM retail_sales
WHERE sale_date = '2022-11-05';
```

### Question 2: Retrieve Transactions for 'Clothing' Category with Quantity > 4 in Nov 2022

```sql
SELECT *
FROM retail_sales 
WHERE 
    category = 'Clothing'
    AND DATE_FORMAT(sale_date, '%Y-%m') = '2022-11'
    AND quantiy > 4;
```

### Question 3: Calculate Total Sales for Each Category

```sql
SELECT category, SUM(total_sale) AS net_sale
FROM retail_sales
GROUP BY category;
```

### Question 4: Average Age of Customers Who Purchased 'Beauty' Items

```sql
SELECT AVG(age) AS avg_age
FROM retail_sales
WHERE category = 'Beauty';
```

### Question 5: Transactions Where Total Sale > 1000

```sql
SELECT *
FROM retail_sales
WHERE total_sale > 1000;
```

### Question 6: Total Transactions by Gender and Category

```sql
SELECT category, gender, COUNT(*) AS total_transactions
FROM retail_sales
GROUP BY category, gender
ORDER BY category;
```

### Question 7: Average Sale for Each Month and Best-Selling Month

```sql
SELECT
    YEAR(sale_date) AS sale_year,
    MONTH(sale_date) AS sale_month,
    AVG(total_sale) AS avg_sale,
    RANK() OVER (PARTITION BY YEAR(sale_date) ORDER BY AVG(total_sale) DESC) AS rank
FROM retail_sales
GROUP BY sale_year, sale_month;
```

### Question 8: Top 5 Customers Based on Highest Total Sales

```sql
SELECT customer_id, SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;
```
                                               ## End of Project
 
 
