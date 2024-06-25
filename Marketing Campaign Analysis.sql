-- I write down statements in my SQL code to help anyone who sees the code to easily understand what I did.

-- Check the table
select * from bank;

-- Total number of successful deposits
SELECT 
    COUNT(*) AS total_deposits
FROM 
    bank
WHERE 
    deposit = 'yes';

-- Number of deposits by job
SELECT 
    job,
    COUNT(*) AS deposits
FROM 
    bank
WHERE 
    deposit = 'yes'
GROUP BY 
    job
ORDER BY 
    deposits DESC;

-- Number of deposits by education level
SELECT 
    education,
    COUNT(*) AS deposits
FROM 
    bank
WHERE 
    deposit = 'yes'
GROUP BY 
    education
ORDER BY 
    deposits DESC;

-- Number of deposits by marital status
SELECT 
    marital,
    COUNT(*) AS deposits
FROM 
    bank
WHERE 
    deposit = 'yes'
GROUP BY 
    marital
ORDER BY 
    deposits DESC;

-- Average campaign duration for successful deposits
SELECT 
    AVG(duration) AS avg_duration
FROM 
    bank
WHERE 
    deposit = 'yes';

-- Success rate by previous campaign outcome
SELECT 
    poutcome,
    COUNT(*) AS total_contacts,
    SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) AS successful_deposits,
    (SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS success_rate
FROM 
    bank
GROUP BY 
    poutcome;

-- Age distribution of successful deposits
SELECT 
    age,
    COUNT(*) AS deposits
FROM 
    bank
WHERE 
    deposit = 'yes'
GROUP BY 
    age
ORDER BY 
    age;
