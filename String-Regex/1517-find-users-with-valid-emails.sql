/*
Problem: 1517. Find Users With Valid E-Mails
Link: https://leetcode.com/problems/find-users-with-valid-emails/
Difficulty: Easy
Concepts: REGEXP_LIKE(), Case Sensitivity ('c'), String Pattern Matching

Description:
Find the users who have valid emails.
A valid e-mail has a prefix name and a domain where:
- The prefix name starts with a letter and can contain letters, digits, '_', '.', and/or '-'.
- The domain must be exactly '@leetcode.com' (case-sensitive).
*/

-- My Solution:
SELECT 
    user_id, 
    name, 
    mail
FROM 
    Users
WHERE 
    -- REGEXP_LIKE(column, pattern, match_parameter)
    -- 'c' specifies case-sensitive matching to exclude '.COM'
    REGEXP_LIKE(
        mail, 
        '^[A-Za-z][A-Za-z0-9_.-]*@leetcode\\.com$', 
        'c'
    );

/*
Notes:
- ^[A-Za-z]: Ensures the email starts with a letter.
- [A-Za-z0-9_.-]*: Allows any combination of valid characters in the prefix.
- @leetcode\\.com$: Ensures the domain is exactly '@leetcode.com'.
- 'c' Option: This is the critical fix! It tells MySQL to treat 'com' and 'COM' 
  as different, ensuring we only pick up the lowercase version.
*/