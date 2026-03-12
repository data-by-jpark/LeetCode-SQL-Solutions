/*
Problem: 1757. Recyclable and Low Fat Products
Link: https://leetcode.com/problems/recyclable-and-low-fat-products/
Difficulty: Easy
Concepts: Basic Select, Filtering (WHERE)

Description:
Write a solution to find the ids of products that are both low fat and recyclable.
Return the result table in any order.
*/

-- My Solution:
SELECT 
    product_id
FROM 
    Products
WHERE 
    low_fats = 'Y' 
    AND recyclable = 'Y';

/*
Notes:
- Used 'AND' because both conditions must be true.
- Simple SELECT statement for Day 1!
*/