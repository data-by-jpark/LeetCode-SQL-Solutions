/*
Problem: 1148. Article Views I
Link: https://leetcode.com/problems/article-views-i/
Difficulty: Easy
Concepts: Basic Select, Filtering (WHERE), Distinct Values, Sorting (ORDER BY)

Description:
Find all the authors that viewed at least one of their own articles.
Return the result table sorted by id in ascending order.
*/

-- My Solution:
SELECT 
    DISTINCT author_id AS id
FROM 
    Views
WHERE 
    author_id = viewer_id
ORDER BY 
    id ASC;

/*
Notes:
- Use 'DISTINCT' to remove duplicate IDs, as an author might view their own article multiple times.
- 'author_id = viewer_id' filters for self-views.
- 'ORDER BY id ASC' ensures the final output is sorted as required by the prompt.
*/