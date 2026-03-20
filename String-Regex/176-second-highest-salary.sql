/*
Problem: 176. Second Highest Salary
Link: https://leetcode.com/problems/second-highest-salary/
Difficulty: Medium
Concepts: LIMIT, OFFSET, DISTINCT, Subqueries (Handling NULL)

Description:
Write a solution to find the second highest salary from the Employee table. 
If there is no second highest salary, return null.
*/

-- My Solution:
SELECT (
    SELECT DISTINCT salary
    FROM Employee
    ORDER BY salary DESC
    LIMIT 1 OFFSET 1
) AS SecondHighestSalary;

/*
Notes:
- DISTINCT: If two people earn the same top salary, the "second highest" 
  must be the next unique value.
- ORDER BY DESC: To get the highest salaries at the top.
- LIMIT 1 OFFSET 1: 
    - OFFSET 1: Skip the first row (the highest).
    - LIMIT 1: Take the next single row (the second highest).
- Outer SELECT: Wrapping the query in a SELECT allows SQL to return NULL 
  automatically if the subquery finds no result (e.g., if there's only 1 employee).
*/