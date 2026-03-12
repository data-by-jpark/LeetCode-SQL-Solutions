/*
Problem: 1934. Confirmation Rate
Link: https://leetcode.com/problems/confirmation-rate/
Difficulty: Medium
Concepts: LEFT JOIN, GROUP BY, IF/CASE, AVG, ROUND

Description:
The confirmation rate of a user is the number of 'confirmed' messages divided by the total number of requested confirmation messages. 
The confirmation rate of a user that did not request any confirmation messages is 0. 
Round the confirmation rate to two decimal places.
*/

-- My Solution:
SELECT 
    s.user_id, 
    ROUND(AVG(IF(c.action = 'confirmed', 1, 0)), 2) AS confirmation_rate
FROM 
    Signups AS s
LEFT JOIN 
    Confirmations AS c 
    ON s.user_id = c.user_id
GROUP BY 
    s.user_id;

/*
Notes:
- LEFT JOIN: We start with 'Signups' to make sure users who never requested a message are included.
- IF(action = 'confirmed', 1, 0): This turns 'confirmed' into 1 and everything else (timeout or NULL) into 0.
- AVG(): Taking the average of 1s and 0s automatically gives us the percentage (Rate)!
- ROUND(..., 2): Rounds the final percentage to two decimal places.
*/