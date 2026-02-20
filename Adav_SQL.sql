#Create the table
CREATE TABLE Students (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    course VARCHAR(50),
    marks INT,
    email VARCHAR(100)
);

-- Insert 10 sample records

INSERT INTO Students (id, name, course, marks, email) VALUES
(1, 'Amit Sharma', 'Computer Science', 85, 'amit.sharma@example.com'),
(2, 'Priya Verma', 'Information Technology', 90, 'priya.verma@example.com'),
(3, 'Rahul Singh', 'Data Science', 78, 'rahul.singh@example.com'),
(4, 'Sneha Gupta', 'Artificial Intelligence', 88, 'sneha.gupta@example.com'),
(5, 'Vikas Yadav', 'Cyber Security', 82, 'vikas.yadav@example.com'),
(6, 'Neha Patel', 'Machine Learning', 95, 'neha.patel@example.com'),
(7, 'Rohan Mehta', 'Software Engineering', 80, 'rohan.mehta@example.com'),
(8, 'Anjali Nair', 'Cloud Computing', 87, 'anjali.nair@example.com'),
(9, 'Karan Joshi', 'Database Systems', 76, 'karan.joshi@example.com'),
(10, 'Meera Iyer', 'Web Development', 89, 'meera.iyer@example.com');

create view students_view as
select name , course , marks 
from students;
select * from students_view ; 

CREATE VIEW FD_Std as
select name , course , marks
from students
where marks>80;

select * from FD_std;

#shows how view was created
show create view FD_std;

#update views
update students_view
set marks = 75
where 'Amit Sharma';

delete from students_view where name = 'Amit Sharma'