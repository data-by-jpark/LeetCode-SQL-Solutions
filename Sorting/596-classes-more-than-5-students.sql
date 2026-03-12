/*
Problem: 596. Classes More Than 5 Students
Link: https://leetcode.com/problems/classes-more-than-5-students/
Difficulty: Easy
Concepts: GROUP BY, HAVING, COUNT()

Description:
Write a solution to find all the classes that have at least five students.
Return the result table in any order.
*/

-- My Solution:
SELECT 
    class
FROM 
    Courses
GROUP BY 
    class
HAVING 
    COUNT(student) >= 5;

/*
Notes:
- GROUP BY class: We bundle all students belonging to the same class into one group.
- HAVING COUNT(student) >= 5: We filter the groups AFTER they have been counted. 
  Remember, WHERE filters rows, but HAVING filters groups!
*/