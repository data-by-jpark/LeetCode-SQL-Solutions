/*
Problem: 1978. Employees Whose Manager Left the Company
Link: https://leetcode.com/problems/employees-whose-manager-left-the-company/
Difficulty: Easy
Concepts: WHERE, IN Clause, Subquery

Description:
Find the IDs of employees whose salary is strictly less than $30,000 
and whose manager left the company. When a manager leaves, their ID 
remains in the manager_id column, but their row is deleted from the table.
Return the result ordered by employee_id.
*/

-- My Solution:
SELECT 
    employee_id
FROM 
    Employees
WHERE 
    salary < 30000 
    AND manager_id IS NOT NULL 
    AND manager_id NOT IN (
        SELECT employee_id FROM Employees
    )
ORDER BY 
    employee_id;

/*
Notes:
- salary < 30000: The first filter is a simple numerical condition.
- manager_id IS NOT NULL: We skip employees who don't have a manager (like the CEO).
- NOT IN (subquery): This is the "Left the Company" logic. We look at the manager's ID
  and check if it still exists in the employee_id column. If it's NOT there, they left!
*/