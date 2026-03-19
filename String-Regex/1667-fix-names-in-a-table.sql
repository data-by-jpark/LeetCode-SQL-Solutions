/*
Problem: 1667. Fix Names in a Table
Link: https://leetcode.com/problems/fix-names-in-a-table/
Difficulty: Easy
Concepts: CONCAT(), UPPER(), LOWER(), SUBSTR() / SUBSTRING()

Description:
Write a solution to fix the names so that only the first character is uppercase 
and the rest are lowercase.
Return the result table ordered by user_id.
*/

-- My Solution:
SELECT 
    user_id, 
    CONCAT(
        UPPER(SUBSTR(name, 1, 1)), -- 1. Grab the 1st letter and make it BIG
        LOWER(SUBSTR(name, 2))     -- 2. Grab the rest and make it small
    ) AS name
FROM 
    Users
ORDER BY 
    user_id;

/*
Notes:
- SUBSTR(string, start, length): 
    - SUBSTR(name, 1, 1) starts at the 1st letter and takes 1 character.
    - SUBSTR(name, 2) starts at the 2nd letter and takes everything until the end.
- CONCAT(): Joins the two pieces back together into one string.
- Case Sensitivity: SQL is great at this. UPPER() and LOWER() are your best friends 
  for data cleaning.
*/