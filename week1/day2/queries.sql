--- SQL Joins Assignment – LEFT JOIN, RIGHT JOIN, FULL JOIN
-- Query 1: Display all students and the courses they are enrolled in. Include students who are not enrolled in any course.
SELECT s.student_name, c.course_name
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
LEFT JOIN courses c ON e.course_id = c.course_id;
-- Query 2: Find all courses that currently have no students enrolled.
SELECT c.course_id,c.course_name
FROM courses c
LEFT JOIN enrollments e ON c.course_id=e.course_id
WHERE e.course_id IS NULL;
-- Query 3: Display all instructors and the courses they teach, including instructors who are not assigned to any course.
SELECT i.instructor_name, c.course_name
FROM instructors i
LEFT JOIN courses c ON i.instructor_id = c.instructor_id;
-- Query 4: Find all courses that do not have an instructor assigned.
SELECT c.course_id,c.course_name
FROM courses c
LEFT JOIN instructors i ON c.instructor_id=i.instructor_id
WHERE c.instructor_id IS NULL;
-- Query 5: Display all students and enrollment information using a RIGHT JOIN.
SELECT s.student_name,e.*
FROM students s
RIGHT JOIN enrollments e ON s.student_id=e.student_id;
-- Query 6: Find students who are not enrolled in any course.
SELECT s.student_id,s.student_name
FROM students s
LEFT JOIN enrollments e ON s.student_id=e.student_id
WHERE e.student_id IS NULL;
-- Query 7: Use a FULL OUTER JOIN to display all students and enrollments, including unmatched rows from both tables.
SELECT s.student_name, e.*
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
UNION
SELECT s.student_name, e.*
FROM students s
RIGHT JOIN enrollments e ON s.student_id = e.student_id;
-- Query 8: Find all courses that have never appeared in the enrollments table.
SELECT c.course_id,c.course_name
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
WHERE e.course_id IS NULL;
-- Query 9: Display all instructors and courses using a FULL OUTER JOIN and identify unmatched rows.
SELECT i.instructor_name,c.course_name
FROM instructors i
LEFT JOIN courses c ON i.instructor_id=c.course_id
UNION
SELECT i.instructor_name,c.course_name
FROM instructors i
RIGHT JOIN courses c ON i.instructor_id=c.course_id;
-- Query 10: Create a report showing: student name, course name, and instructor name. Include rows even if course or instructor information is missing
SELECT s.student_name, c.course_name, i.instructor_name
FROM enrollments e
LEFT JOIN students s ON e.student_id = s.student_id
LEFT JOIN courses c ON e.course_id = c.course_id
LEFT JOIN instructors i ON c.instructor_id = i.instructor_id;
-- Bonus Challenge: Write a query that lists every student and every course, even if there is no enrollment relationship between them.
SELECT s.student_name, c.course_name
FROM students s
CROSS JOIN courses c;
