/*
Problem: 1527. Patients with a Condition
Link: https://leetcode.com/problems/patients-with-a-condition/
Difficulty: Easy
Concepts: LIKE, Wildcards (%), String Pattern Matching

Description:
Write a solution to find the patient_id, patient_name, and conditions 
of the patients who have Type I Diabetes. 
Type I Diabetes codes start with 'DIAB1' prefix.
*/

-- My Solution:
SELECT 
    patient_id, 
    patient_name, 
    conditions
FROM 
    Patients
WHERE 
    -- 1. Condition is the VERY FIRST word in the string
    conditions LIKE 'DIAB1%' 
    -- 2. Condition is NOT the first word (it has a space before it)
    OR conditions LIKE '% DIAB1%';

/*
Notes:
- Why two LIKEs?: If you only use '%DIAB1%', you might accidentally catch 
  'MEDIAB1' (which isn't what we want). 
- 'DIAB1%': Matches if the string STARTS with DIAB1.
- '% DIAB1%': Matches if DIAB1 appears after a space (indicating a new code).
- Regular Expressions (Advanced): In some SQL versions (like MySQL), 
  you could use REGEXP '\\bDIAB1' to do this in one line!
*/