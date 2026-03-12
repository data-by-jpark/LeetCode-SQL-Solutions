/*
Problem: 1729. Find Followers Count
Link: https://leetcode.com/problems/find-followers-count/
Difficulty: Easy
Concepts: GROUP BY, COUNT(), ORDER BY

Description:
Write a solution that will, for each user, return the number of followers.
Return the result table ordered by user_id in ascending order.
*/

-- My Solution:
SELECT 
    user_id, 
    COUNT(follower_id) AS followers_count
FROM 
    Followers
GROUP BY 
    user_id
ORDER BY 
    user_id ASC;

/*
Notes:
- GROUP BY user_id: This aggregates all follower records for each specific user.
- COUNT(follower_id): This counts the total number of people following that user.
*/