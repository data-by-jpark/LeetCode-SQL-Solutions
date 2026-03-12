/*
Problem: 1070. Product Sales Analysis III
Link: https://leetcode.com/problems/product-sales-analysis-iii/
Difficulty: Medium
Concepts: Subquery, IN Clause, MIN()

Description:
Select the product id, year, quantity, and price for the first year of every product sold.
Return the result table in any order.
*/

-- My Solution:
SELECT 
    product_id, 
    year AS first_year, 
    quantity, 
    price
FROM 
    Sales
WHERE 
    (product_id, year) IN (
        SELECT 
            product_id, 
            MIN(year)
        FROM 
            Sales
        GROUP BY 
            product_id
    );

/*
Notes:
- The Subquery: We first find the 'launch year' (MIN year) for every single product_id.
- The WHERE (id, year) IN: This is the "filtering" step. It tells SQL: 
  "Only show me the rows where the product and the year match my launch list."
- Why not just GROUP BY?: If a product was sold in 2010 and 2011, a simple GROUP BY 
  might accidentally mix the 2010 year with the 2011 price. The subquery keeps them tied together.
*/