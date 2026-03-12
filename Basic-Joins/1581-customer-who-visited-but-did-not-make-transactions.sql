/*
Problem: 1581. Customer Who Visited but Did Not Make Transactions
Link: https://leetcode.com/problems/customer-who-visited-but-did-not-make-transactions/
Difficulty: Easy
Concepts: LEFT JOIN, Filtering NULLs (IS NULL), Aggregation (COUNT, GROUP BY)

Description:
Write a solution to find the IDs of the users who visited without making any transactions and the number of times they made these types of visits.
Return the result table sorted in any order.
*/

-- My Solution:
SELECT 
    v.customer_id, 
    COUNT(v.visit_id) AS count_no_trans
FROM 
    Visits AS v
LEFT JOIN 
    Transactions AS t 
    ON v.visit_id = t.visit_id
WHERE 
    t.transaction_id IS NULL
GROUP BY 
    v.customer_id;

/*
Notes:
- We LEFT JOIN Transactions onto Visits to see all visits, regardless of whether a purchase happened.
- 'WHERE t.transaction_id IS NULL' is the key: it filters for visits that do NOT have a matching entry in the Transactions table.
- Finally, we GROUP BY customer_id and COUNT their visits to get the total per customer.
*/