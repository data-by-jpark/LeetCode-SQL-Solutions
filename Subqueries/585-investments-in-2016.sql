/*
Problem: 585. Investments in 2016
Link: https://leetcode.com/problems/investments-in-2016/
Difficulty: Medium
Concepts: Subqueries, IN, GROUP BY, HAVING

Description:
Write a solution to report the sum of all total investment values in 2016 (tiv_2016) 
for all policyholders who:
1. Have the same tiv_2015 value as one or more other policyholders.
2. Are not located in the same city as any other policyholder (unique lat, lon).
Round the result to two decimal places.
*/

-- My Solution:
SELECT 
    ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM 
    Insurance
WHERE 
    -- Condition 1: tiv_2015 must be shared with at least one other person
    tiv_2015 IN (
        SELECT tiv_2015 
        FROM Insurance 
        GROUP BY tiv_2015 
        HAVING COUNT(*) > 1
    )
    -- Condition 2: (lat, lon) pair must be unique
    AND (lat, lon) IN (
        SELECT lat, lon 
        FROM Insurance 
        GROUP BY lat, lon 
        HAVING COUNT(*) = 1
    );

/*
Notes:
- Filter 1 (The Crowd): Finds tiv_2015 values that appear more than once.
- Filter 2 (The Loner): Finds (lat, lon) pairs that appear exactly once.
- Result: We SUM the 2016 values for the people who pass BOTH filters.
*/