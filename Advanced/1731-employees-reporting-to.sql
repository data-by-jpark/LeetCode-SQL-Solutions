/*
Problem: 1731. The Number of Employees Which Report to Each Employee
Link: https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/
Difficulty: Easy
Concepts: Self-Join, Group By, Rounding (ROUND), Aggregation (AVG, COUNT)

Description:
Find the id and name of all managers, the number of employees who report 
directly to them, and the average age of the reports rounded to the nearest integer.
Return the result table ordered by employee_id.
*/

-- My Solution:
SELECT 
    m.employee_id, 
    m.name, 
    COUNT(e.employee_id) AS reports_count, 
    ROUND(AVG(e.age)) AS average_age
FROM 
    Employees AS m
INNER JOIN 
    Employees AS e 
    ON m.employee_id = e.reports_to
GROUP BY 
    m.employee_id
ORDER BY 
    m.employee_id;

/*
Notes:
- Self-Join: We treat 'm' as the table of Managers and 'e' as the table of Employees.
- ON m.employee_id = e.reports_to: This connects each employee to their specific manager.
- ROUND(AVG(e.age)): Standard ROUND() without a second argument rounds to the nearest whole number.
- Result Filtering: The INNER JOIN automatically excludes employees who aren't managers (because no one reports to them).
*/