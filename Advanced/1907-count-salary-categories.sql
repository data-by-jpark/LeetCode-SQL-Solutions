/*
Problem: 1907. Count Salary Categories
Link: https://leetcode.com/problems/count-salary-categories/
Difficulty: Medium
Concepts: UNION, CASE Statement (or filtering), Aggregate COUNT

Description:
Calculate the number of bank accounts for each salary category:
1. "Low Salary": Salary strictly less than $20,000.
2. "Average Salary": Salary in the range [$20,000, $50,000] inclusive.
3. "High Salary": Salary strictly greater than $50,000.
The result table MUST contain all three categories. If a category has no accounts, report 0.
*/

-- My Solution:
SELECT 'Low Salary' AS category, COUNT(*) AS accounts_count
FROM Accounts WHERE income < 20000

UNION

SELECT 'Average Salary' AS category, COUNT(*) AS accounts_count
FROM Accounts WHERE income BETWEEN 20000 AND 50000

UNION

SELECT 'High Salary' AS category, COUNT(*) AS accounts_count
FROM Accounts WHERE income > 50000;

/*
Notes:
- Why not just use CASE and GROUP BY?: If you only use GROUP BY and nobody earns 
  an "Average Salary," that row will disappear from the results. 
- UNION approach: By writing three separate queries and joining them, we 
  guarantee that all three labels appear in the final table, even if the count is 0.
- Efficiency: For small to medium datasets, this is very readable and effective.
*/