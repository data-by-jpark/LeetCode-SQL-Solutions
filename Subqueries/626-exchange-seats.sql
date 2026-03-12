/*
Problem: 626. Exchange Seats
Link: https://leetcode.com/problems/exchange-seats/
Difficulty: Medium
Concepts: CASE Statement, Math (Modulus), Lead/Lag (optional)

Description:
Write a solution to swap the seat id of every two consecutive students. 
If the number of students is odd, the id of the last student is not swapped.
Return the result table ordered by id in ascending order.
*/

-- Your Solution:
SELECT 
    CASE 
        -- 1. If it's an odd ID and it's the LAST row, keep it the same
        WHEN id % 2 = 1 AND id = (SELECT MAX(id) FROM Seat) THEN id
        -- 2. If it's an odd ID (1, 3, 5...), move it to the next even number (+1)
        WHEN id % 2 = 1 THEN id + 1
        -- 3. If it's an even ID (2, 4, 6...), move it to the previous odd number (-1)
        ELSE id - 1
    END AS id,
    student
FROM 
    Seat
ORDER BY 
    id ASC;

/*
Notes:
- id % 2: This is the Modulus operator. It gives the remainder. 
  (id % 2 = 1) means the number is Odd.
- The Order: We are changing the IDs, so we MUST use ORDER BY id ASC at the end 
  to make sure the table looks swapped (1 becomes 2, 2 becomes 1).
- Scalar Subquery: (SELECT MAX(id) FROM Seat) is used to identify the very last person.
*/