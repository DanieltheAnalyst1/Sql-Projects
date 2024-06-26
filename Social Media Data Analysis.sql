-- I write down statements in my SQL code to help anyone who sees the code to easily understand what I did.

-- Check the table
select * from socialmedia;

-- Total number of posts per platform
SELECT 
    Platform,
    COUNT(*) AS total_posts
FROM 
    socialmedia
GROUP BY 
    Platform
ORDER BY 
    total_posts DESC;

-- Average user engagement per platform
SELECT 
    Platform,
    AVG(User_Engagement) AS average_engagement
FROM 
    socialmedia
GROUP BY 
    Platform
ORDER BY 
    average_engagement DESC;

-- Top 10 most liked posts
SELECT 
    Post_ID,
    Username,
    Likes_Reactions
FROM 
    socialmedia
ORDER BY 
    Likes_Reactions DESC
LIMIT 10;

-- Posts over time
SELECT 
    DATE_FORMAT(STR_TO_DATE(Post_Timestamp, '%d-%m-%Y'), '%Y-%m') AS month,
    COUNT(*) AS total_posts
FROM 
    socialmedia
GROUP BY 
    month
ORDER BY 
    month;

-- Most common hashtags
SELECT 
    Hashtags,
    COUNT(*) AS count
FROM 
    socialmedia
GROUP BY 
    Hashtags
ORDER BY 
    count DESC
LIMIT 10;

-- User activity analysis
SELECT 
    Username,
    COUNT(*) AS total_posts,
    SUM(User_Interactions) AS total_interactions,
    SUM(User_Engagement) AS total_engagement
FROM 
    socialmedia
GROUP BY 
    Username
ORDER BY 
    total_posts DESC
LIMIT 10;
