create database dbdemo;
use dbdemo;
create table student (student_id int auto_increment primary key, 
student_name varchar(100) not null,  email varchar(100) not null,
enrollment_date date not null default(current_date()), specialisation varchar(100) );
 
create table dept (dept_id int auto_increment primary key, dept_name varchar(100) not null unique,
dept_head varchar(100) not null );
 
create table instructor( inst_id int auto_increment primary key, inst_name varchar(100) not null,
email varchar(100) unique not null, department_id int,
foreign key (department_id) references dept(dept_id) on delete set null );
 
create table course (course_id int auto_increment primary key, title varchar(100), 
credits int not null check(credits between 1 and 5),
instructor_id int,
department_id int not null,
foreign key(instructor_id) references instructor(inst_id) on delete set null,
foreign key(department_id) references dept(dept_id) on delete cascade );
 
create table enroll( enroll_id int auto_increment primary key, 
student_id int not null,
course_id int not null,
enrollment_date date not null default(current_date()),
grade enum('A','B', 'C','D','F','Incomplete') default 'Incomplete',
unique(student_id, course_id),
foreign key(student_id) references  student(student_id) on delete cascade,
foreign key(course_id) references course(course_id) on delete cascade );

insert into student(Student_name, email, specialisation) values
('Althaf', 'althaf@example.com', 'AI'),
('Mehak', 'mehak@example.com','DS'),
('Ganesh','ganesh@example.com','Cyber'),
('Jeena','jeena@example.com','Web');
 
 
insert into dept(dept_name, dept_head) values 
('Database', 'Dr.Hiren'),
('Data Science', 'Dr. Gayatri'),
('Science','Dr. Sholk');
 
insert into instructor(inst_name, email,department_id) values 
('Sneha', 'sneha@example.com',1),
('Riddhi', 'arti@example.com',2),
('Manvit','kiren@example.com',1);
 
insert into course(title, credits, instructor_id, department_id) values 
('AI', 4, 1,1),
('Web',3,2,2),
('Web',4,3,1);

INSERT INTO enroll (student_id, course_id, grade) VALUES
(1, 1, 'A'),
(1, 2, 'B'),
(2, 3, 'A'),
(3, 4, 'C'),
(4, 5, 'B'),
(5, 1, 'A'),
(5, 2, 'A');

select * from students;
select * from course;
select * from instructor;
select * from dept;
select * from enroll;

update enroll set grade='A' where enroll_id = 3;

select * from student order by enrollment_date desc limit 5;
 
select s.student_name as Student, c.title as course, i.inst_name as Instructor

from student s
join enroll e using(student_id)
join course c using(course_id)
join instructor i on c.instructor_id = i.inst_id;

select * from enroll;

DELIMITER //
create procedure enrollstud (IN student_id int, IN course_id int, IN grd enum('A','B','C','D','F','Incomplete'))
 
begin
insert into enroll (student_id, course_id, grade) values (student_id, course_id, grd);
end //
DELIMITER ;

call enrollstud(4,3,'8');

select * from enroll;
