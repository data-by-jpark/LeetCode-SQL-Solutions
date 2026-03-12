/*
Problem: 1204. Last Person to Fit in the Bus
Link: https://leetcode.com/problems/last-person-to-fit-in-the-bus/
Difficulty: Medium
Concepts: Self-Join, Running Total, Window Functions (SUM OVER)

Description:
Find the person_name of the last person who can fit on the bus without 
exceeding the weight limit of 1000kg.
*/

-- My Solution (Using Self-Join for a Running Total):
SELECT 
    q1.person_name
FROM 
    Queue q1
JOIN 
    Queue q2 ON q1.turn >= q2.turn
GROUP BY 
    q1.person_id
HAVING 
    SUM(q2.weight) <= 1000
ORDER BY 
    SUM(q2.weight) DESC
LIMIT 1;

/*
Notes:
- The Self-Join Trick: We join the table to itself. For every person (q1), 
  we look at everyone who stood in line BEFORE or WITH them (q2.turn <= q1.turn).
- SUM(q2.weight): This calculates the "Running Total" for that person.
- HAVING <= 1000: We throw away anyone who made the bus too heavy.
- ORDER BY DESC LIMIT 1: Out of all the people who fit, we pick the one 
  who was the heaviest/last in line.
*/