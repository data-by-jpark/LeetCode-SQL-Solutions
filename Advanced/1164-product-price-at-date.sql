/*
Problem: 1164. Product Price at a Given Date
Link: https://leetcode.com/problems/product-price-at-a-given-date/
Difficulty: Medium
Concepts: UNION, Subquery, IN Clause, MAX(date)

Description:
Find the prices of all products on 2019-08-16. 
Assume the price of all products before any change is 10.
*/

-- My Solution:
-- Step 1: Products that had a price change ON or BEFORE the target date
SELECT 
    product_id, 
    new_price AS price
FROM 
    Products
WHERE 
    (product_id, change_date) IN (
        SELECT 
            product_id, 
            MAX(change_date)
        FROM 
            Products
        WHERE 
            change_date <= '2019-08-16'
        GROUP BY 
            product_id
    )

UNION

-- Step 2: Products that only had price changes AFTER the target date
SELECT 
    product_id, 
    10 AS price
FROM 
    Products
GROUP BY 
    product_id
HAVING 
    MIN(change_date) > '2019-08-16';

/*
Notes:
- The First Query: Finds the "most recent" price update that happened before or on the deadline.
- The Second Query: Handles products that didn't exist in our logs yet (defaulting to 10).
- UNION: Stitches the "updated" products and the "default" products into one list.
- This problem, 1164. Product Price at a Given Date, is a favorite in data analytics interviews because it mimics a real-world "SCD Type 2" (Slowly Changing Dimension) table.
*/