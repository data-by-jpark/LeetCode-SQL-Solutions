/*
Problem: 1661. Average Time of Process per Machine
Link: https://leetcode.com/problems/average-time-of-process-per-machine/
Difficulty: Easy
Concepts: Self-Join, Aggregation (AVG), Rounding (ROUND), GROUP BY

Description:
Find the average time each machine takes to complete a process.
The time to complete a process is the 'end' timestamp minus the 'start' timestamp.
The average time is calculated by (total time to complete every process on the machine) / (number of processes).
The result should be rounded to 3 decimal places.
*/

-- My Solution:
SELECT 
    a1.machine_id, 
    ROUND(AVG(a2.timestamp - a1.timestamp), 3) AS processing_time
FROM 
    Activity AS a1
JOIN 
    Activity AS a2 
    ON a1.machine_id = a2.machine_id 
    AND a1.process_id = a2.process_id
    AND a1.activity_type = 'start' 
    AND a2.activity_type = 'end'
GROUP BY 
    a1.machine_id;

/*
Notes:
- We join the table to itself to get the 'start' and 'end' times into the same row.
- Condition 'a1.activity_type = start' and 'a2.activity_type = end' creates this pairing.
- We subtract the start from the end, then use AVG() grouped by machine_id.
- ROUND(..., 3) is used to meet the precision requirement.
*/