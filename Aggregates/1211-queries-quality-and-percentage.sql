/*
Problem: 1211. Queries Quality and Percentage
Link: https://leetcode.com/problems/queries-quality-and-percentage/
Difficulty: Easy
Concepts: Aggregation (AVG), Conditional Logic (IF/CASE), Rounding (ROUND)

Description:
- Quality: The average of the ratio between query rating and its position.
- Poor Query Percentage: The percentage of all queries with rating less than 3.
- Both should be rounded to 2 decimal places.
*/

-- My Solution:
SELECT 
    query_name,
    ROUND(AVG(rating / position), 2) AS quality,
    ROUND(AVG(IF(rating < 3, 1, 0)) * 100, 2) AS poor_query_percentage
FROM 
    Queries
WHERE 
    query_name IS NOT NULL
GROUP BY 
    query_name;

/*
Notes:
- AVG(rating / position): SQL calculates the ratio for each row first, then averages them.
- AVG(IF(rating < 3, 1, 0)): This is the "Success Rate" trick we used before! 
  It treats 'poor' ratings as 1 and others as 0, then finds the average (the percentage).
- WHERE query_name IS NOT NULL: Some test cases might have empty names; this keeps the report clean.
*/