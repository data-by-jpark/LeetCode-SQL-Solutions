/*
Problem: 1633. Percentage of Users Attended a Contest
Link: https://leetcode.com/problems/percentage-of-users-attended-a-contest/
Difficulty: Easy
Concepts: Aggregation (COUNT), Subquery, Rounding (ROUND), Sorting (ORDER BY)

Description:
Find the percentage of the users registered in each contest rounded to two decimals.
Return the result table ordered by percentage in descending order. 
In case of a tie, order it by contest_id in ascending order.
*/

-- My Solution:
SELECT 
    contest_id, 
    ROUND(COUNT(user_id) * 100.0 / (SELECT COUNT(*) FROM Users), 2) AS percentage
FROM 
    Register
GROUP BY 
    contest_id
ORDER BY 
    percentage DESC, 
    contest_id ASC;

/*
Notes:
- (SELECT COUNT(*) FROM Users): This is a subquery. It runs first, finds the total number of users, and plugs that number into the math for every contest_id.
- COUNT(user_id) * 100.0: We multiply by 100.0 to convert the decimal into a percentage and to ensure the math handles decimals correctly.
- Multi-Level Sorting: Notice the ORDER BY has two columns. It sorts by percentage first, and then uses contest_id as a "tie-breaker."
*/