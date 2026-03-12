/*
Problem: 1789. Primary Department for Each Employee
Link: https://leetcode.com/problems/primary-department-for-each-employee/
Difficulty: Easy
Concepts: Set Operations (UNION), Filtering, GROUP BY, HAVING

Description:
Employees can belong to multiple departments. When an employee joins only one department, 
that department is their primary. When they join more than one, they have a primary column 'Y'.
*/

-- My Solution:
-- Step 1: Get employees with the 'Y' flag
SELECT 
    employee_id, 
    department_id
FROM 
    Employee
WHERE 
    primary_flag = 'Y'

UNION

-- Step 2: Get employees who only belong to ONE department
SELECT 
    employee_id, 
    department_id
FROM 
    Employee
GROUP BY 
    employee_id
HAVING 
    COUNT(employee_id) = 1;

/*
Notes:
- UNION: This combines the results of two queries. It also automatically removes duplicates if an employee somehow met both criteria.
- Logic: We are combining two different "rules" into one report.
- Rules: 
  1. If you have a 'Y', you're in.
  2. If you only have one row total, you're in.
*/