/*
Problem: 1174. Immediate Food Delivery II
Link: https://leetcode.com/problems/immediate-food-delivery-ii/
Difficulty: Medium
Concepts: Subqueries (IN), Aggregation (AVG/IF), Minimum (MIN)

Description:
Find the percentage of immediate next-day delivery orders among the first orders of all customers.
The first order is the one with the earliest order_date.
Round the result to 2 decimal places.
*/

-- My Solution:
SELECT 
    ROUND(AVG(IF(order_date = customer_pref_delivery_date, 1, 0)) * 100, 2) AS immediate_percentage
FROM 
    Delivery
WHERE 
    (customer_id, order_date) IN (
        SELECT 
            customer_id, 
            MIN(order_date) 
        FROM 
            Delivery 
        GROUP BY 
            customer_id
    );

/*
Notes:
- The Subquery: (SELECT customer_id, MIN(order_date)...) finds the 'Birth Date' of the first order for every customer.
- WHERE (customer_id, order_date) IN (...): This filters the main table so we ONLY look at those specific first orders.
- AVG(IF(...)): This calculates the percentage of these first orders that were immediate.
*/