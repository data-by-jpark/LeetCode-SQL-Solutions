/*
Problem: 1683. Invalid Tweets
Link: https://leetcode.com/problems/invalid-tweets/
Difficulty: Easy
Concepts: Basic Select, Filtering (WHERE), String Functions (LENGTH / CHAR_LENGTH)

Description:
Write a solution to find the IDs of the invalid tweets. 
A tweet is invalid if the number of characters used in the content of the tweet is strictly greater than 15.
Return the result table in any order.
*/

-- My Solution:
SELECT 
    tweet_id
FROM 
    Tweets
WHERE 
    LENGTH(content) > 15;

/*
Notes:
- The 'LENGTH()' function returns the length of a string.
- In some SQL dialects, 'CHAR_LENGTH()' is preferred for counting characters (especially with multi-byte characters), but 'LENGTH()' works for this problem.
- Strictly greater than 15 means we use the '>' operator.
*/