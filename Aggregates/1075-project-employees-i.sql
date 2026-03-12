/*
Problem: 1075. Project Employees I
Link: https://leetcode.com/problems/project-employees-i/
Difficulty: Easy
Concepts: LEFT JOIN, Aggregation (AVG), Rounding (ROUND), GROUP BY

Description:
Write a solution that reports the average experience years of all the employees for each project, 
rounded to 2 digits.
*/

-- My Solution:
SELECT 
    p.project_id, 
    ROUND(AVG(e.experience_years), 2) AS average_years
FROM 
    Project AS p
LEFT JOIN 
    Employee AS e 
    ON p.employee_id = e.employee_id
GROUP BY 
    p.project_id;

/*
Notes:
- LEFT JOIN: This is a "defensive" choice. It ensures that every project_id from the Project table 
  appears in the result, even if that project has no employees assigned yet.
- AVG(): SQL's AVG function is smart—it ignores NULL values. If a project has no matching employee, 
  the result for that row will be NULL rather than a mathematical error.
- GROUP BY: Groups the individual employee years into "buckets" per project so we can average them.
*/