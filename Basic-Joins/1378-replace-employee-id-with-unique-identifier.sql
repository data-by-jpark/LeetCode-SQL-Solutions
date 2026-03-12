/*
Problem: 1378. Replace Employee ID With Unique Identifier
Link: https://leetcode.com/problems/replace-employee-id-with-unique-identifier/
Difficulty: Easy
Concepts: Basic Joins (LEFT JOIN)

Description:
Write a solution to show the unique ID of each user, If a user does not have a unique ID replace just show null.
Return the result table containing unique_id and name.
*/

-- My Solution:
SELECT 
    eu.unique_id, 
    e.name
FROM 
    Employees AS e
LEFT JOIN 
    EmployeeUNI AS eu 
    ON e.id = eu.id;

/*
Notes:
- Used 'LEFT JOIN' because we need to keep ALL employees from the 'Employees' table, even those without a unique ID.
- An 'INNER JOIN' would have excluded employees who don't have a matching ID in the 'EmployeeUNI' table.
- Used aliases ('e' and 'eu') to make the query more concise and readable.
*/