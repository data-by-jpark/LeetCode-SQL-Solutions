/*
Problem: 1141. User Activity for the Past 30 Days I
Link: https://leetcode.com/problems/user-activity-for-the-past-30-days-i/
Difficulty: Easy
Concepts: WHERE (Date Filtering), DATE_SUB / Date Arithmetic, GROUP BY, COUNT(DISTINCT)

Description:
Find the daily active user count for a period of 30 days ending 2019-07-27 inclusively. 
A user was active on a day if they made at least one activity on that day.
*/

-- My Solution:
SELECT 
    activity_date AS day, 
    COUNT(DISTINCT user_id) AS active_users
FROM 
    Activity
WHERE 
    activity_date BETWEEN DATE_SUB('2019-07-27', INTERVAL 29 DAY) AND '2019-07-27'
GROUP BY 
    activity_date;

/*
Notes:
- DATE_SUB('2019-07-27', INTERVAL 29 DAY): This calculates June 28th, 2019.
- BETWEEN: Since it is inclusive, from June 28 to July 27 is exactly 30 days.
- Intent: This syntax is highly readable and prevents future dates from leaking in.
*/