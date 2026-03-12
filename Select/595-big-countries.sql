/*
Problem: 595. Big Countries
Link: https://leetcode.com/problems/big-countries/
Difficulty: Easy
Concepts: Basic Select, Filtering (WHERE) with OR / UNION

Description:
A country is big if:
- It has an area of at least three million (i.e., 3,000,000 km2), OR
- It has a population of at least twenty-five million (i.e., 25,000,000).

Write a solution to find the name, population, and area of the big countries.
Return the result table in any order.
*/

-- My Solution:
SELECT 
    name, 
    population, 
    area
FROM 
    World
WHERE 
    area >= 3000000 
    OR population >= 25000000;

/*
Notes:
- The problem asks for countries meeting 'at least one' of the two conditions, making 'OR' the most direct approach.
- In larger datasets, using UNION to combine two separate SELECT statements (one for area, one for population) can sometimes be faster than OR because it allows the database to use indexes more effectively.
*/