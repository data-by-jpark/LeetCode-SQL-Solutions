/*
Problem: 1484. Group Sold Products By The Date
Link: https://leetcode.com/problems/group-sold-products-by-the-date/
Difficulty: Easy
Concepts: GROUP_CONCAT(), COUNT(DISTINCT), GROUP BY

Description:
Write a solution to find for each date the number of different products sold 
and their names. The sold products names for each date should be sorted 
lexicographicaly and comma-separated.
*/

-- My Solution:
SELECT 
    sell_date,
    COUNT(DISTINCT product) AS num_sold,
    -- GROUP_CONCAT is the magic tool here
    GROUP_CONCAT(
        DISTINCT product 
        ORDER BY product 
        SEPARATOR ','
    ) AS products
FROM 
    Activities
GROUP BY 
    sell_date
ORDER BY 
    sell_date;

/*
Notes:
- DISTINCT product: If the same product was sold twice on the same day, 
  we only want to list it once.
- ORDER BY product: Inside GROUP_CONCAT, this sorts the names alphabetically 
  (A-Z) before joining them.
- SEPARATOR ',': This is the default, but you can change it to ' / ' or ' & ' if needed.
- GROUP BY sell_date: This tells SQL to collect all products for each specific day.
*/