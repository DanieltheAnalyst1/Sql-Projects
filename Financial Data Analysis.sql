-- I write down statements in my SQL code to help anyone who sees the code to easily understand what I did.

-- Check the table
select * from finance_data;

-- Total Investment by Gender
SELECT 
    gender,
    SUM(Mutual_Funds) AS total_mutual_funds,
    SUM(Equity_Market) AS total_equity_market,
    SUM(Debentures) AS total_debentures,
    SUM(Government_Bonds) AS total_government_bonds,
    SUM(Fixed_Deposits) AS total_fixed_deposits,
    SUM(PPF) AS total_ppf,
    SUM(Gold) AS total_gold
FROM 
    finance_data
GROUP BY 
    gender;
-- Age Group
select max(age) as Max_Age,
min(age) as Min_Age
from finance_data;
-- Average Investment by Age Group
SELECT 
    CASE 
        WHEN age BETWEEN 21 AND 29 THEN '21-29'
        WHEN age BETWEEN 30 AND 35 THEN '30-35'
    END AS age_group,
    AVG(Mutual_Funds) AS avg_mutual_funds,
    AVG(Equity_Market) AS avg_equity_market,
    AVG(Debentures) AS avg_debentures,
    AVG(Government_Bonds) AS avg_government_bonds,
    AVG(Fixed_Deposits) AS avg_fixed_deposits,
    AVG(PPF) AS avg_ppf,
    AVG(Gold) AS avg_gold
FROM 
    finance_data
GROUP BY 
    age_group;

-- Total Investment by Investment Avenue
SELECT 
    'Mutual Funds' AS investment_avenue, SUM(Mutual_Funds) AS total_amount FROM finance_data
UNION ALL
SELECT 
    'Equity Market', SUM(Equity_Market) FROM finance_data
UNION ALL
SELECT 
    'Debentures', SUM(Debentures) FROM finance_data
UNION ALL
SELECT 
    'Government Bonds', SUM(Government_Bonds) FROM finance_data
UNION ALL
SELECT 
    'Fixed Deposits', SUM(Fixed_Deposits) FROM finance_data
UNION ALL
SELECT 
    'PPF', SUM(PPF) FROM finance_data
UNION ALL
SELECT 
    'Gold', SUM(Gold) FROM finance_data;

-- Average Investment by Gender and Age Group
SELECT 
    gender,
    CASE 
        WHEN age BETWEEN 21 AND 29 THEN '21-29'
        WHEN age BETWEEN 30 AND 35 THEN '30-35'
    END AS age_group,
    AVG(Mutual_Funds) AS avg_mutual_funds,
    AVG(Equity_Market) AS avg_equity_market,
    AVG(Debentures) AS avg_debentures,
    AVG(Government_Bonds) AS avg_government_bonds,
    AVG(Fixed_Deposits) AS avg_fixed_deposits,
    AVG(PPF) AS avg_ppf,
    AVG(Gold) AS avg_gold
FROM 
    finance_data
GROUP BY 
    gender, age_group;
