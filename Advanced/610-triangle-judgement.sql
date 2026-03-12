/*
Problem: 610. Triangle Judgement
Link: https://leetcode.com/problems/triangle-judgement/
Difficulty: Easy
Concepts: CASE Statement, Geometry Logic

Description:
Report for every three line segments whether they can form a triangle.
*/

-- My Solution:
SELECT 
    x, 
    y, 
    z,
    CASE 
        WHEN x + y > z AND x + z > y AND y + z > x THEN 'Yes'
        ELSE 'No'
    END AS triangle
FROM 
    Triangle;

/*
Notes:
- CASE WHEN: This is SQL's version of an IF statement.
- Logic: All three conditions must be true (AND) for it to be a triangle.
- Alias: Don't forget to name the new column 'triangle' as requested.
*/