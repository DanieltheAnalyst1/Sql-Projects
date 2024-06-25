-- I write down statements in my SQL code to help anyone who sees the code to easily understand what I did.

-- Check the table
select * from list_of_orders;

-- Total number of orders
SELECT 
    COUNT(*) AS total_orders
FROM 
    list_of_orders;

-- Total number of orders by state
SELECT 
    State,
    COUNT(*) AS total_orders
FROM 
    list_of_orders
GROUP BY 
    State
ORDER BY 
    total_orders DESC;

-- Total number of orders by city
SELECT 
    City,
    COUNT(*) AS total_orders
FROM 
    list_of_orders
GROUP BY 
    City
ORDER BY 
    total_orders DESC;

-- Orders over time
SELECT 
    DATE_FORMAT(STR_TO_DATE(Order_Date, '%d-%m-%Y'), '%Y-%m') AS month,
    COUNT(*) AS total_orders
FROM 
    list_of_orders
GROUP BY 
    month
ORDER BY 
    month;

-- Orders by day of the week
SELECT 
    DAYNAME(STR_TO_DATE(Order_Date, '%d-%m-%Y')) AS day_of_week,
    COUNT(*) AS total_orders
FROM 
    list_of_orders
GROUP BY 
    day_of_week
ORDER BY 
    FIELD(day_of_week, 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday');

-- Peak order days
SELECT 
    Order_Date,
    COUNT(*) AS total_orders
FROM 
    list_of_orders
GROUP BY 
    Order_Date
ORDER BY 
    total_orders DESC
LIMIT 10;

