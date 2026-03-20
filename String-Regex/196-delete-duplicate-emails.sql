/*
Problem: 196. Delete Duplicate Emails
Link: https://leetcode.com/problems/delete-duplicate-emails/
Difficulty: Easy
Concepts: DELETE, Self Join, Filtering

Description:
Write a solution to delete all duplicate emails, keeping only one unique email 
with the smallest id.
Note: You must write a DELETE statement, not a SELECT one.
*/

-- My Solution:
DELETE p1 
FROM Person p1, Person p2
WHERE 
    -- 1. Look for rows with the same email address
    p1.email = p2.email 
    -- 2. But find the one that has a LARGER ID (the duplicate)
    AND p1.id > p2.id;

/*
Notes:
- Self Join: We are comparing the table 'Person' to itself.
- DELETE p1: This tells SQL to only remove the rows from the 'p1' alias that 
  meet the criteria in the WHERE clause.
- Logic: If two rows have the same email, we want to keep the one with the 
  smallest ID. Therefore, we delete any row (p1) that has a bigger ID than 
  another row (p2) with the same email.
*/