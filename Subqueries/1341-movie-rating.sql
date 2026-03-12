/*
Problem: 1341. Movie Rating
Link: https://leetcode.com/problems/movie-rating/
Difficulty: Medium
Concepts: UNION ALL, GROUP BY, ORDER BY, LIMIT, Subqueries

Description:
1. Find the name of the user who has rated the greatest number of movies. 
   In case of a tie, return the lexicographically smaller user name.
2. Find the movie name with the highest average rating in February 2020. 
   In case of a tie, return the lexicographically smaller movie name.
*/

-- My Solution:
(SELECT 
    u.name AS results
FROM 
    MovieRating mr
JOIN 
    Users u ON mr.user_id = u.user_id
GROUP BY 
    u.user_id
ORDER BY 
    COUNT(mr.movie_id) DESC, 
    u.name ASC
LIMIT 1)

UNION ALL

(SELECT 
    m.title AS results
FROM 
    MovieRating mr
JOIN 
    Movies m ON mr.movie_id = m.movie_id
WHERE 
    mr.created_at BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY 
    m.movie_id
ORDER BY 
    AVG(mr.rating) DESC, 
    m.title ASC
LIMIT 1);

/*
Notes:
- UNION ALL: We use this to combine the two results. We use parentheses () around each 
  query to ensure the ORDER BY and LIMIT only apply to that specific half.
- Lexicographical Tie-breaking: The problem says "return the smaller name," 
  which in SQL just means "ORDER BY name ASC".
- Date Filtering: February 2020 was a leap year, but BETWEEN '2020-02-01' AND '2020-02-29' 
  is the safest way to capture the whole month.
*/