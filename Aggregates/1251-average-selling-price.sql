/*
Problem: 1251. Average Selling Price
Link: https://leetcode.com/problems/average-selling-price/
Difficulty: Easy
Concepts: LEFT JOIN, BETWEEN (Date Filtering), Aggregation (SUM), ROUND, COALESCE/IFNULL

Description:
Find the average selling price for each product. 
average_price should be rounded to 2 decimal places. 
If a product has no sales, the average price should be 0.
*/

-- My Solution:
SELECT 
    p.product_id, 
    IFNULL(ROUND(SUM(p.price * u.units) / SUM(u.units), 2), 0) AS average_price
FROM 
    Prices AS p
LEFT JOIN 
    UnitsSold AS u 
    ON p.product_id = u.product_id 
    AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY 
    p.product_id;

/*
Notes:
- BETWEEN: This is a powerful way to join data based on a date range. It ensures the sale is matched to the price active on that day.
- Weighted Average: We calculate (Price * Units) for every sale, sum them up, and then divide by the total number of units.
- IFNULL(..., 0)(The safety net): If a product exists in the 'Prices' table but never sold anything, the math would result in NULL. This ensures we return 0 instead.(Defensive programming in SQL)
*/