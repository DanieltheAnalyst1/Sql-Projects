-- I write down statements in my SQL code to help anyone who sees the code to easily understand what I did.

-- Check the table
select * from dataset_superstore;

-- 1. Number of Customers
select count(Customer_Name) as Customers
from dataset_superstore;

-- 2. Regions
select distinct(Region) as Regions
from dataset_superstore;

-- 3. Total sales by region and month
SELECT Region, 
       YEAR(Order_Date) AS year,
       MONTH(Order_Date) AS month,
       SUM(Sales) AS total_sales
FROM dataset_superstore
GROUP BY Region, year, month
ORDER BY Region, year, month;

-- 4. Top-performing products
SELECT Product_ID,
       SUM(Sales) AS total_sales
FROM dataset_superstore
GROUP BY Product_ID
ORDER BY total_sales DESC
LIMIT 10;

-- 5. Sales growth trends
SELECT YEAR(Order_Date) AS year,
       MONTH(Order_Date) AS month,
       SUM(Sales) AS total_sales
FROM dataset_superstore
GROUP BY year, month
ORDER BY year, month DESC;

