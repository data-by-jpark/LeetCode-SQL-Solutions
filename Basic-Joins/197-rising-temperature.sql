/*
Problem: 197. Rising Temperature
Link: https://leetcode.com/problems/rising-temperature/
Difficulty: Easy
Concepts: Self-Join, DATEDIFF() or SUBDATE(), Filtering

Description:
Write a solution to find all dates' Id with higher temperatures compared to its previous dates (yesterday).
Return the result table in any order.
*/

-- Your Solution:
SELECT 
    w1.id
FROM 
    Weather AS w1
JOIN 
    Weather AS w2 
    ON DATEDIFF(w1.recordDate, w2.recordDate) = 1
WHERE 
    w1.temperature > w2.temperature;

/*
Notes:
- This is a 'Self-Join': we treat 'w1' as today and 'w2' as yesterday.
- DATEDIFF(w1, w2) = 1 ensures we are only comparing dates that are exactly 1 day apart.
- The WHERE clause then filters for cases where today's temp is higher than yesterday's.
*/