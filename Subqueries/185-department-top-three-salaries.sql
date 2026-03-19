/*
Problem: 185. Department Top Three Salaries
Link: https://leetcode.com/problems/department-top-three-salaries/
Difficulty: Hard
Concepts: DENSE_RANK(), Window Functions, Subqueries, Joins

Description:
A company's executives are interested in seeing who earns the most money in each of 
the company's departments. A high earner in a department is an employee who has a 
salary in the top three unique salaries for that department.
Write a solution to find the employees who are high earners in each of the departments.
*/

-- My Solution (The Modern Window Function Way):
WITH SalaryRanks AS (
    SELECT 
        d.name AS Department,
        e.name AS Employee,
        e.salary AS Salary,
        -- We use DENSE_RANK because the problem says "top three UNIQUE salaries"
        DENSE_RANK() OVER(PARTITION BY d.name ORDER BY e.salary DESC) AS rnk
    FROM 
        Employee e
    JOIN 
        Department d ON e.departmentId = d.id
)
SELECT 
    Department, 
    Employee, 
    Salary
FROM 
    SalaryRanks
WHERE 
    rnk <= 3;

/*
Notes:
- DENSE_RANK(): Unlike RANK(), DENSE_RANK() doesn't skip numbers. 
  If two people tie for 1st, the next person is 2nd (not 3rd). 
  This is perfect for "top three unique values."
- PARTITION BY: This tells SQL to restart the ranking for every new Department.
- CTE (WITH clause): Makes the code much easier to read by separating the 
  ranking logic from the final filtering.
*/