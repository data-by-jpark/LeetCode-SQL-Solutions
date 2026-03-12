/*
Problem: 1045. Customers Who Bought All Products
Link: https://leetcode.com/problems/customers-who-bought-all-products/
Difficulty: Medium
Concepts: GROUP BY, HAVING, COUNT(DISTINCT), Scalar Subquery

Description:
Write a solution to report the customer ids from the Customer table 
that bought all the products in the Product table.
*/

-- My Solution:
SELECT 
    customer_id
FROM 
    Customer
GROUP BY 
    customer_id
HAVING 
    COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM Product);

/*
Notes:
- GROUP BY customer_id: We look at each customer's "shopping bag" individually.
- COUNT(DISTINCT product_key): We count how many DIFFERENT products they bought (to avoid double-counting if they bought the same item twice).
- (SELECT COUNT(*) FROM Product): This is a scalar subquery. It finds the total number of items available in the store (e.g., if there are 3 products total, this equals 3).
- HAVING: We only keep the customers whose "bag count" matches the "store count."
*/