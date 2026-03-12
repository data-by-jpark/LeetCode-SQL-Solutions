/*
Problem: 1280. Students and Examinations
Link: https://leetcode.com/problems/students-and-examinations/
Difficulty: Easy
Concepts: CROSS JOIN, LEFT JOIN, GROUP BY, Aggregation (COUNT)

Description:
Find the number of times each student attended each exam.
Return the result table ordered by student_id and subject_name.
*/

-- My Solution:
SELECT 
    s.student_id, 
    s.student_name, 
    sub.subject_name, 
    COUNT(e.subject_name) AS attended_exams
FROM 
    Students AS s
CROSS JOIN 
    Subjects AS sub
LEFT JOIN 
    Examinations AS e 
    ON s.student_id = e.student_id 
    AND sub.subject_name = e.subject_name
GROUP BY 
    s.student_id, s.student_name, sub.subject_name
ORDER BY 
    s.student_id, sub.subject_name;

/*
Notes:
- CROSS JOIN: Creates every possible combination of Students and Subjects. 
  If you have 4 students and 3 subjects, you get 12 rows as a base.
- LEFT JOIN: We attach the actual exam records to this base list.
- COUNT(e.subject_name): We count entries from the Examinations table. 
  If a student didn't take an exam, this count returns 0 (not NULL).
*/