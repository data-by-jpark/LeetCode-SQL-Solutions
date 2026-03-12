/*
Problem: 619. Biggest Single Number
Link: https://leetcode.com/problems/biggest-single-number/
Difficulty: Easy
Concepts: Subquery, GROUP BY, HAVING, MAX()

Description:
A single number is a number that appeared only once in the MyNumbers table.
Find the largest single number. If there is no such number, report null.
*/

-- My Solution:
SELECT 
    MAX(num) AS num
FROM (
    SELECT 
        num
    FROM 
        MyNumbers
    GROUP BY 
        num
    HAVING 
        COUNT(num) = 1
) AS UniqueNumbers;

/*
Notes:
- The Inner Query (Subquery): This creates a list of numbers that are "lonely" (they only appear once).
- The Outer Query: We apply MAX() to that specific list. 
- Automatic NULL: In SQL, if the inner query returns no rows, MAX() automatically returns NULL, which satisfies the problem requirement.
*/