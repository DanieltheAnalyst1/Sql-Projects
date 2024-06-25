-- I write down statements in my SQL code to help anyone who sees the code to easily understand what I did.

-- Check the table
select * from dataset_superstore;

-- RFM analysis
WITH rfm AS (
    SELECT Customer_ID,
           MAX(Order_Date) AS last_purchase,
           COUNT(Order_ID) AS frequency,
           SUM(Sales) AS monetary
    FROM dataset_superstore
    GROUP BY Customer_ID
)
SELECT Customer_ID,
       DATEDIFF(CURDATE(), last_purchase) AS recency,
       frequency,
       monetary
FROM rfm
ORDER BY recency, frequency DESC, monetary DESC;

-- High-value customers
WITH rfm AS (
    SELECT Customer_ID,
           MAX(Order_Date) AS last_purchase,
           COUNT(Order_ID) AS frequency,
           SUM(Sales) AS monetary
    FROM dataset_superstore
    GROUP BY Customer_ID
)
SELECT Customer_ID,
       DATEDIFF(CURDATE(), last_purchase) AS recency,
       Customer_ID,
       frequency,
       monetary
FROM rfm
WHERE monetary > (SELECT AVG(monetary) FROM rfm)
ORDER BY monetary DESC;
