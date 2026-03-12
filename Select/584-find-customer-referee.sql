/*
Problem: 584. Find Customer Referee
Link: https://leetcode.com/problems/find-customer-referee/
Difficulty: Easy
Concepts: Basic Select, Filtering (WHERE), Handling NULL values

Description:
Find the names of the customer that are not referred by the customer with id = 2.
Return the result table in any order.
*/

-- My Solution:
SELECT 
    name
FROM 
    Customer
WHERE 
    referee_id != 2 
    OR referee_id IS NULL;

/*
Notes:
- In SQL, NULL represents an 'unknown' value, so it is excluded from the '!= 2' condition.
- To include these records, we must explicitly add the 'IS NULL' condition.
- Alternatively, you can use COALESCE(referee_id, 0) != 2 to handle NULLs.
*/