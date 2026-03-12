/*
Problem: 602. Friend Requests II: Who Has the Most Friends
Link: https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/
Difficulty: Medium
Concepts: UNION ALL, GROUP BY, ORDER BY, LIMIT

Description:
Find the person who has the most friends and the most friends number.
The test cases are generated such that only one person has the most friends.
*/

-- My Solution:
SELECT 
    id, 
    COUNT(*) AS num
FROM (
    SELECT requester_id AS id FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS id FROM RequestAccepted
) AS AllFriends
GROUP BY 
    id
ORDER BY 
    num DESC
LIMIT 1;

/*
Notes:
- UNION ALL: This is the key. We don't care who sent or received; we just want a 
  giant list of every time an ID was involved in a friendship.
- why UNION ALL?: If Alice and Bob are friends, Alice appears once in the 
  requester column and Bob appears once in the accepter column. We need to count 
  BOTH instances to get their total friend counts.
- LIMIT 1: Since the problem guarantees only one winner, we just sort by the 
  highest count and take the top row.
*/