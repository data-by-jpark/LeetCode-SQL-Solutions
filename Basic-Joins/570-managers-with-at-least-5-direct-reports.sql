/*
Problem: 570. Managers with at Least 5 Direct Reports
Link: https://leetcode.com/problems/managers-with-at-least-5-direct-reports/
Difficulty: Medium
Concepts: Self-Join, GROUP BY, HAVING, COUNT

Description:
Write a solution to find managers who have at least five direct reports.
Return the result table in any order.
*/

-- My Solution:
SELECT 
    m.name
FROM 
    Employee AS e
INNER JOIN 
    Employee AS m 
    ON e.managerId = m.id
GROUP BY 
    m.id, m.name
HAVING 
    COUNT(e.id) >= 5;

/*
Notes:
- Self-Join: We join the Employee table to itself. 'e' represents the reports (employees) and 'm' represents the managers.
- JOIN ON e.managerId = m.id: This connects each employee to their specific manager.
- GROUP BY m.id: we group the results by manager.
- HAVING COUNT(e.id) >= 5: Unlike 'WHERE', 'HAVING' filters data AFTER it has been grouped and counted.
*/