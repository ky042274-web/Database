create database collegeDB;
use collegeDB;

#students table
create table student(
student_ID int primary key,
Name varchar(50),
Age int
);
#Department table
create table department(
Department_ID int primary key,
Department_Name varchar(50),
HOD varchar(50)
);
#Faculty table
create table Faculty(
faculty_ID int primary key,
name varchar(60),
SUBJECT varchar(90),
Department_ID int,
foreign key(Department_ID) references Department (Department_ID)
);
#course table
create table course(
course_ID int primary key,
Course_name varchar(40),
credits int,
Department_ID INT,
foreign key(Department_ID) references Department(Department_ID)
);

#cLASSROOM TABLE
CREATE TABLE CLASSROOM(
classroom_ID int primary key,
room_number varchar(10),
capacity INT
);
#REgistration Table
create table registration(
registration_ID int primary key,
student_id int,
course_id int,
FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID)
);

INSERT INTO Student VALUES (1, 'Rahul', 20);
INSERT INTO Faculity VALUES(29,'Aman', 41);
INSERT INTO Department VALUES (101, 'Computer Science', 'Dr. Sharma');
INSERT INTO Course VALUES (201, 'DBMS', 4, 101);
INSERT INTO Classroom VALUES (301, 'A-101', 60);
INSERT INTO Registration VALUES (1, 1, 201);

SELECT * FROM students;
SELECT * FROM Course;
SELECT * FROM Registration;
SELECT * FROM Classroom;
SELECT * FROM Department;
SELECT * FROM Faculity;








