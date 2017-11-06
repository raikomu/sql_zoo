# 1. List the teachers who have NULL for their department.
SELECT name FROM teacher WHERE dept IS NULL

# 2. Note the INNER JOIN misses the teachers with no department and the departments with no teacher. 
SELECT teacher.name, dept.name FROM teacher INNER JOIN dept ON (teacher.dept=dept.id)

# 3. Use a different JOIN so that all teachers are listed. 
SELECT teacher.name, dept.name
  FROM teacher LEFT JOIN dept
    ON (teacher.dept = dept.id)

# 4. Use a different JOIN so that all departments are listed. 
SELECT teacher.name, dept.name
  FROM teacher RIGHT JOIN dept
    ON (teacher.dept = dept.id)

# 5. Use COALESCE to print the mobile number.
SELECT name, COALESCE(mobile, '07986 444 2266') FROM teacher

# 6. Use the COALESCE function and a LEFT JOIN to print the teacher name and department name. 
SELECT teacher.name, COALESCE(dept.name, 'None')
  FROM teacher LEFT JOIN dept
    ON teacher.dept = dept.id

# 7. Use COUNT to show the number of teachers and the number of mobile phones. 
SELECT COUNT(teacher.id), COUNT(mobile) FROM teacher

# 8. Use COUNT and GROUP BY dept.name to show each department and the number of staff. 
SELECT dept.name, COUNT(teacher.id)
  FROM teacher RIGHT JOIN dept
    ON dept.id = teacher.dept
    GROUP BY dept.name

# 9. Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2 and 'Art' otherwise. 
SELECT name, CASE WHEN dept IN(1, 2) THEN 'Sci' ELSE 'Art' END
  FROM teacher

# 10. Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2,
#    show 'Art' if the teacher's dept is 3 and 'None' otherwise. 
SELECT name, CASE WHEN dept IN(1, 2) THEN 'Sci' WHEN dept = 3 THEN 'Art' ELSE 'None' END
  FROM teacher

### LESSON 08+ ###

# 1. Show the the percentage who STRONGLY AGREE
SELECT A_STRONGLY_AGREE
  FROM nss
 WHERE question='Q01'
   AND institution='Edinburgh Napier University'
   AND subject='(8) Computer Science'

# 2. Show the institution and subject where the score is at least 100 for question 15. 
SELECT institution, subject
  FROM nss
 WHERE question='Q15'
   AND score >= 100

# 3. Show the institution and score where the score for '(8) Computer Science' is less than 50 for question 'Q15' 
SELECT institution, score
  FROM nss
 WHERE subject = '(8) Computer Science'
   AND score < 50
   AND question = 'Q15'

# 4. Show the subject and total number of students who responded to question 22 for each of the subjects
#    '(8) Computer Science' and '(H) Creative Arts and Design'.
SELECT subject, SUM(response)
  FROM nss
 WHERE question = 'Q22'
   AND subject IN('(8) Computer Science', '(H) Creative Arts and Design')
   GROUP BY subject

# 5. Show the subject and total number of students who A_STRONGLY_AGREE to question 22 for each of the subjects
#    '(8) Computer Science' and '(H) Creative Arts and Design'. 
SELECT subject, SUM(A_STRONGLY_AGREE * response / 100)
  FROM nss
 WHERE question = 'Q22'
   AND subject IN('(8) Computer Science', '(H) Creative Arts and Design')
   GROUP BY subject

# 6. Show the percentage of students who A_STRONGLY_AGREE to question 22 for the subject
#    '(8) Computer Science' show the same figure for the subject '(H) Creative Arts and Design'.
SELECT subject, ROUND(SUM(response * A_STRONGLY_AGREE) / SUM(response))
  FROM nss
 WHERE subject IN('(8) Computer Science', '(H) Creative Arts and Design')
   AND question = 'Q22'
   GROUP BY subject

# 7. Show the average scores for question 'Q22' for each institution that include 'Manchester' in the name. 
SELECT institution, ROUND(SUM(response * score) / SUM(response))
  FROM nss
 WHERE question = 'Q22'
   AND institution LIKE '%Manchester%'
 GROUP BY institution

# 8. Show the institution, the total sample size and the number of computing students for institutions in 
#    Manchester for 'Q01'.
SELECT institution, SUM(sample), SUM(CASE WHEN subject = '(8) Computer Science' THEN sample END)
  FROM nss
 WHERE institution LIKE '%Manchester%'
   AND question = 'Q01'
 GROUP BY institution
 