-- I write down statements in my SQL code to help anyone who sees the code to easily understand what I did.

-- Check the table
select * from hrdataset_v14;

-- Check the distinct textual values
select distinct(PerformanceScore) 
from hrdataset_v14;

-- Calculate average performance scores for each employee with mapped numerical values
SELECT 
    EmpID,
    Employee_Name,
    AVG(CASE 
            WHEN PerformanceScore = 'Exceeds' THEN 4
            WHEN PerformanceScore = 'Fully Meets' THEN 3
            WHEN PerformanceScore = 'Needs Improvement' THEN 2
            WHEN PerformanceScore = 'PIP' THEN 1
        END) AS avg_score,
    COUNT(LastPerformanceReview_Date) AS review_count
FROM 
    hrdataset_v14
GROUP BY 
    EmpID, Employee_Name
ORDER BY 
    avg_score DESC;

-- Top performers over time with mapped numerical values
SELECT 
    EmpID, 
    Employee_Name,
    YEAR(STR_TO_DATE(LastPerformanceReview_Date, '%m/%d/%Y')) AS year, 
    AVG(CASE 
            WHEN PerformanceScore = 'Exceeds' THEN 4
            WHEN PerformanceScore = 'Fully Meets' THEN 3
            WHEN PerformanceScore = 'Needs Improvement' THEN 2
            WHEN PerformanceScore = 'PIP' THEN 1
        END) AS avg_score
FROM 
    hrdataset_v14
GROUP BY 
    EmpID, Employee_Name, year
ORDER BY 
    year, avg_score DESC;

