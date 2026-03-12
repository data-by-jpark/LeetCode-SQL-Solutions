/*
Problem: 1193. Monthly Transactions I
Link: https://leetcode.com/problems/monthly-transactions-i/
Difficulty: Medium
Concepts: DATE_FORMAT / LEFT, GROUP BY, Aggregation (SUM, COUNT), Conditional Aggregation

Description:
Find for each month and country:
1. The number of transactions and their total amount.
2. The number of approved transactions and their total amount.
*/

-- My Solution:
SELECT 
    DATE_FORMAT(trans_date, '%Y-%m') AS month,
    country,
    COUNT(id) AS trans_count,
    SUM(IF(state = 'approved', 1, 0)) AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(IF(state = 'approved', amount, 0)) AS approved_total_amount
FROM 
    Transactions
GROUP BY 
    month, country;

/*
Notes:
- DATE_FORMAT(date, '%Y-%m'): This extracts only the Year and Month. It turns '2026-02-20' into '2026-02'.
- SUM(IF(state = 'approved', 1, 0)): Counts only the approved ones (like a manual filter).
- SUM(IF(state = 'approved', amount, 0)): Only adds the dollar amount IF the state is approved.
- GROUP BY month, country: We want a separate row for every unique combination of month and country.
*/