/*
Problem: 620. Not Boring Movies
Link: https://leetcode.com/problems/not-boring-movies/
Difficulty: Easy
Concepts: Filtering (WHERE), Modulo Operator (%), Sorting (ORDER BY)

Description:
Write a solution to report the movies with an odd-numbered ID and a description that is not "boring".
Return the result table ordered by rating in descending order.
*/

-- My Solution:
SELECT 
    id, 
    movie, 
    description, 
    rating
FROM 
    Cinema
WHERE 
    id % 2 = 1 
    AND description != 'boring'
ORDER BY 
    rating DESC;

/*
Notes:
- id % 2 = 1: The modulo operator (%) finds the remainder. If ID divided by 2 leaves 1, the ID is odd.
- <>: This is the SQL operator for "NOT EQUAL TO" (you can also use !=).
- ORDER BY ... DESC: Sorts the results from highest rating to lowest.
*/