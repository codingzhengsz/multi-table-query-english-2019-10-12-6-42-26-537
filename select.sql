# 1.Query the existence of 1 course
select count( * ) from course where id = 1;

# 2.Query the presence of both 1 and 2 courses
select count( * ) from course where id = 1 and id = 2;

# 3.Query the student number and student name and average score of students whose average score is 60 or higher.
SELECT
	student.id,
	max( student.NAME ) AS NAME,
	avg( student_course.score ) AS score 
FROM
	student,
	student_course 
WHERE
	student.id = student_course.studentId 
	AND score >= 60 
GROUP BY
	student.id;

# 4.Query the SQL statement of student information that does not have grades in the student_course table
select * from student where student.id not in (select studentId from student_course);

# 5.Query all SQL with grades
select * from student where student.id in (select studentId from student_course);

# 6.Inquire about the information of classmates who have numbered 1 and also studied the course numbered 2
SELECT
	student.id,
	max( student.NAME ) AS NAME,
	max( student.age ) AS age,
	max( student.sex ) AS sex 
FROM
	student
	JOIN student_course 
WHERE
	student.id = student_course.studentId 
	AND student_course.courseId IN ( 1, 2 ) 
GROUP BY
	student.id;

# 7.Retrieve 1 student score with less than 60 scores in descending order
查询1课程分数小于60，按分数降序排列的学生信息
SELECT
	* 
FROM
	student,
	student_course 
WHERE
	student.id = student_course.studentId 
	AND student_course.courseId = 1 
	AND score < 60 
ORDER BY
	score DESC;

# 8.Query the average grade of each course. The results are ranked in descending order of average grade. When the average grades are the same, they are sorted in ascending order by course number.
SELECT
	sc.courseId,
	avg( sc.score ) AS avgScore 
FROM
	student_course sc 
GROUP BY
	sc.courseId 
ORDER BY
	avgScore DESC,
	sc.courseId;

# 9.Query the name and score of a student whose course name is "Math" and whose score is less than 60
# 查询课程名称为数学，且分数低于60的学生姓名和分数
SELECT
	s.`name`,
	sc.score 
FROM
	student s,
	student_course sc,
	course c 
WHERE
	sc.courseId = c.id 
	AND c.`name` = 'Math' 
	AND s.id = sc.studentId 
	AND score < 60;

