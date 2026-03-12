/*
Problem: 180. Consecutive Numbers
Link: https://leetcode.com/problems/consecutive-numbers/
Difficulty: Medium
Concepts: Self-Join (Triple), Filtering

Description:
Find all numbers that appear at least three times consecutively.
Return the result table in any order.
*/

-- My Solution:
SELECT DISTINCT
    l1.num AS ConsecutiveNums
FROM 
    Logs l1,
    Logs l2,
    Logs l3
WHERE 
    l1.id = l2.id - 1 
    AND l2.id = l3.id - 1
    AND l1.num = l2.num 
    AND l2.num = l3.num;

/*
Notes:
- Triple Join: We create three versions of the same table (l1, l2, l3).
- Sequential IDs: We look for rows where the ID is 1, then 2, then 3 (l1.id = l2.id - 1...).
- Matching Values: We check if the 'num' in all three consecutive rows is exactly the same.
- DISTINCT: If a number appears 4 times in a row, it would show up twice in our results. DISTINCT ensures we only report it once.
*/