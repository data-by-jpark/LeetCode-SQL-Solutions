/*
Problem: 2356. Number of Unique Subjects Taught by Each Teacher
Link: https://leetcode.com/problems/number-of-unique-subjects-taught-by-each-teacher/
Difficulty: Easy
Concepts: GROUP BY, COUNT(DISTINCT)

Description:
Calculate the number of unique subjects each teacher teaches in the university.
Return the result table in any order.
*/

-- My Solution:
SELECT 
    teacher_id, 
    COUNT(DISTINCT subject_id) AS cnt
FROM 
    Teacher
GROUP BY 
    teacher_id;

/*
Notes:
- COUNT(DISTINCT column): This is the key. A teacher might teach 'Math' in two different departments (Dept 1 and Dept 2). If we just used COUNT, we'd get '2', but we only want to count 'Math' once.
- GROUP BY teacher_id: This ensures we get one row per teacher.
*/