/*
Problem: 1068. Product Sales Analysis I
Link: https://leetcode.com/problems/product-sales-analysis-i/
Difficulty: Easy
Concepts: Basic Joins (INNER JOIN)

Description:
Write a solution to report the product_name, year, and price for each sale_id in the Sales table.
Return the resulting table in any order.
*/

-- Your Solution:
SELECT 
    p.product_name, 
    s.year, 
    s.price
FROM 
    Sales AS s
INNER JOIN 
    Product AS p 
    ON s.product_id = p.product_id;

/*
Notes:
- Used 'INNER JOIN' because we only want records where a match exists in both tables (every sale must have a corresponding product).
- In many SQL dialects, just writing 'JOIN' defaults to 'INNER JOIN'.
- We pull 'year' and 'price' from the Sales table and 'product_name' from the Product table.
*/