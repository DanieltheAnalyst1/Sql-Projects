-- I write down statements in my SQL code to help anyone who sees the code to easily understand what I did.

-- Check the table
select * from insurance;

-- Check age group
select max(age) as  Maximum_age,
	min(age) as  Minimum_age 
    from insurance;

-- Average charges by age group
SELECT 
    CASE 
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
        WHEN age BETWEEN 46 AND 55 THEN '46-55'
        WHEN age BETWEEN 56 AND 64 THEN '56-64'
    END AS age_group,
    AVG(charges) AS average_charges
FROM 
    insurance
GROUP BY 
    age_group
ORDER BY 
    age_group;
 
 -- Average charges by region
SELECT 
    region,
    AVG(charges) AS average_charges
FROM 
    insurance
GROUP BY 
    region
ORDER BY 
    average_charges DESC;

-- Total charges by smoking status
SELECT 
    smoker,
    SUM(charges) AS total_charges
FROM 
    insurance
GROUP BY 
    smoker;

-- Average BMI by sex
SELECT 
    sex,
    AVG(bmi) AS average_bmi
FROM 
    insurance
GROUP BY 
    sex;

-- Charges distribution by number of children
SELECT 
    children,
    AVG(charges) AS average_charges,
    MIN(charges) AS min_charges,
    MAX(charges) AS max_charges
FROM 
    insurance
GROUP BY 
    children
ORDER BY 
    children;

-- Impact of smoking status on charges
SELECT 
    smoker,
    AVG(charges) AS average_charges,
    MAX(charges) AS max_charges,
    MIN(charges) AS min_charges
FROM 
    insurance
GROUP BY 
    smoker;
