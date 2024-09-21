-- 1. Create a table “book” with fields id, title, author, isbn, description --
create table book(
	id varchar(5),
	title varchar(100),
	author varchar(100),
	isbn varchar(22),
	description varchar(200)
);

-- 2. Add to the teaches table main_book field as reference to book table--
alter table teaches 
add main_book varchar(5),
add foreign key (main_book) references book(id);


--3. Add some books to ‘book’ table and bound these books to some teaches--
insert into book (id, title, author, isbn, description)
values
('CS-01', 'Database Systems', 'C. J. Date', '1234567890123', 'A classic book on database systems.'),
('CS-02', 'Artificial Intelligence', 'Stuart Russell', '9876543210123', 'Comprehensive guide to AI.'),
('CS-03', 'Introduction to Algorithms', 'Cormen et al.', '1234987654321', 'Algorithm book widely used in academia.');


-- 4. Show the content of table book with select query-- 
select id, title, author, isbn, description from book;


-- 5. Show course_id and year attribute from the table takes --
select course_id, year from takes;

--6. Show unique tuples of course_id and year from the table takes --
select distinct course_id, year from takes;

--7. Show the list of course_id that taken in 2010. --
select distinct course_id, year from takes
where year = 2010;

--8. Show the list of course_id that taken in the 2010th year fall semester. --
select distinct course_id, year, semester from takes 
where year = 2010 and semester = 'Fall';

--9. Show the list of course_id that taken in the 2010th year fall semester, or 2011th year spring semester.--
select distinct course_id, year, semester from takes 
where (year = 2010 and semester = 'Fall') or (year = 2011 and semester = 'Spring');

--10. Show the list of courses from ‘Cybernetics’ department that has more than 3 credits.--
select course_id, title, dept_name, credits from course
where dept_name = 'Cybernetics' and credits > 3;

-- 11. Show the student name, course_id, grade from taken courses--
-- there is no student names in table takes --
select id, course_id, grade from takes;

--12. Show the list of course titles with prerequisite course title --
select title, prereq_id from course, prereq 
where prereq.course_id = prereq_id;

--13. Show the student name and his advisor name --
select id, s_id from student, advisor 
where id = s_id ;

-- 14. Show the number of courses that available in the system in 2010 spring semester--
select count(*) as number_of_course from takes 
where semester = 'Spring' and year = 2010;

-- 15. Show the total credit of teaches that was available in the 2010 year spring semester. --
select sum(credits) as total_credits from course, takes 
where takes.semester = 'Spring' and year = 2010;

--16. Show the number of teaches per instructor in 2010 year--
select count(*) as number_of_teaches from teaches, instructor 
where year = 2010 and teaches.id = instructor.id ;

-- 17. Show the instructor name and number of advising students --


-- 18. Show the list of students with the name of their advisors--


