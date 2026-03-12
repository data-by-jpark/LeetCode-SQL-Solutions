/*
Problem: 550. Game Play Analysis IV
Link: https://leetcode.com/problems/game-play-analysis-iv/
Difficulty: Medium
Concepts: Subqueries (MIN), Date Arithmetic (DATE_ADD), Aggregation (COUNT/AVG)

Description:
Find the fraction of players that logged in again on the day after the day they first logged in, 
rounded to 2 decimal places.
*/

-- My Solution:
SELECT
    ROUND(
        COUNT(player_id) / (SELECT COUNT(DISTINCT player_id) FROM Activity), 
    2) AS fraction
FROM 
    Activity
WHERE 
    (player_id, event_date) IN (
        SELECT 
            player_id, 
            DATE_ADD(MIN(event_date), INTERVAL 1 DAY)
        FROM 
            Activity
        GROUP BY 
            player_id
    );

/*
Notes:
- The Subquery: Finds each player's MIN(event_date) and adds exactly 1 day to it using DATE_ADD.
- The WHERE Clause: Filters the table to only include rows where a player logged in on that "Day 2".
- The Math: We count those specific "Day 2" players and divide by the total number of unique players in the whole game.
*/