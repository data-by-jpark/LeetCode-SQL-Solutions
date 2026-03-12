/*
Problem: 577. Employee Bonus
Link: https://leetcode.com/problems/employee-bonus/
Difficulty: Easy
Concepts: LEFT JOIN, Filtering NULLs (IS NULL)

Description:
Write a solution to report the name and bonus amount of each employee with a bonus less than 1000.
If an employee does not have a bonus, their name should still be reported.
*/

-- My Solution:
SELECT 
    e.name, 
    b.bonus
FROM 
    Employee AS e
LEFT JOIN 
    Bonus AS b 
    ON e.empId = b.empId
WHERE 
    b.bonus < 1000 
    OR b.bonus IS NULL;

/*
Notes:
- We use a LEFT JOIN to ensure all employees are listed, even those who aren't in the Bonus table.
- Employees without a bonus will have a NULL value in the bonus column.
- The WHERE clause must explicitly check for 'IS NULL' because 'NULL < 1000' evaluates to UNKNOWN, not TRUE.
*/