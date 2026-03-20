/*
Problem: 1327. List the Products Ordered in a Period
Link: https://leetcode.com/problems/list-the-products-ordered-in-a-period/
Difficulty: Easy
Concepts: DATE_FORMAT(), LEFT(), GROUP BY, HAVING

Description:
Write a solution to get the names of products that have at least 100 units 
ordered in February 2020 and their amount.
Return result table in any order.
*/

-- My Solution:
SELECT 
    p.product_name, 
    SUM(o.unit) AS unit
FROM 
    Products p
JOIN 
    Orders o ON p.product_id = o.product_id
WHERE 
    -- Method 1: Using DATE_FORMAT (Very readable)
    DATE_FORMAT(o.order_date, '%Y-%m') = '2020-02'
    -- Method 2: Using BETWEEN (Very performant)
    -- o.order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY 
    p.product_name
HAVING 
    SUM(o.unit) >= 100;

/*
Notes:
- DATE_FORMAT(date, format): Extracts only the Year and Month to compare easily.
- SUM(unit): Adds up all orders for that product within the filtered month.
- HAVING: We use HAVING (not WHERE) because we are filtering based on 
  an aggregated value (the SUM).
*/