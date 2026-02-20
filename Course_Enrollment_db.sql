-- Create Database
CREATE DATABASE course_enrollment_db;
USE course_enrollment_db;

-- ==============================
-- Table: Student
-- ==============================
CREATE TABLE student (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    enrollment_date DATE NOT NULL DEFAULT (CURRENT_DATE()),
    specialisation VARCHAR(100)
);

-- ==============================
-- Table: Department
-- ==============================
CREATE TABLE dept (
    dept_id INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL,
    dept_head VARCHAR(100) NOT NULL
);

-- ==============================
-- Table: Instructor
-- ==============================
CREATE TABLE instructor (
    inst_id INT AUTO_INCREMENT PRIMARY KEY,
    inst_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES dept(dept_id)
    ON DELETE SET NULL
);

-- ==============================
-- Table: Course
-- ==============================
CREATE TABLE course (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    credits INT NOT NULL CHECK (credits BETWEEN 1 AND 5),
    instructor_id INT,
    department_id INT NOT NULL,
    FOREIGN KEY (instructor_id) REFERENCES instructor(inst_id)
    ON DELETE SET NULL,
    FOREIGN KEY (department_id) REFERENCES dept(dept_id)
    ON DELETE CASCADE
);

-- ==============================
-- Table: Enroll
-- ==============================
CREATE TABLE enroll (
    enroll_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE NOT NULL DEFAULT (CURRENT_DATE()),
    grade ENUM('A','B','C','D','F','Incomplete') DEFAULT 'Incomplete',
    UNIQUE(student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id)
    ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES course(course_id)
    ON DELETE CASCADE
);

-- ==============================
-- Insert Data into Student
-- ==============================
INSERT INTO student (student_name, email, specialisation) VALUES
('Altaf', 'altaf@example.com', 'AI'),
('Mehak', 'mehak@example.com', 'DS'),
('Ganesh', 'ganesh@example.com', 'Cyber'),
('Jeena', 'jeena@example.com', 'Web');

-- ==============================
-- Insert Data into Department
-- ==============================
INSERT INTO dept (dept_name, dept_head) VALUES
('Database', 'Dr. Hiren'),
('Data Science', 'Dr. Gayatri'),
('Science', 'Dr. Sholk');

-- ==============================
-- Insert Data into Instructor
-- ==============================
INSERT INTO instructor (inst_name, email, department_id) VALUES
('Sneha', 'sneha@example.com', 1),
('Riddhi', 'riddhi@example.com', 2),
('Manvit', 'manvit@example.com', 1);

-- ==============================
-- Insert Data into Course
-- ==============================
INSERT INTO course (title, credits, instructor_id, department_id) VALUES
('AI', 4, 1, 1),
('Web', 3, 2, 2),
('Cyber Security', 4, 3, 1);

-- ==============================
-- Insert Data into Enroll
-- ==============================
INSERT INTO enroll (student_id, course_id, grade) VALUES
(1, 1, 'A'),
(1, 2, 'B'),
(2, 3, 'A'),
(3, 1, 'C');

-- ==============================
-- Select Queries (View Data)
-- ==============================
SELECT * FROM student;
SELECT * FROM dept;
SELECT * FROM instructor;
SELECT * FROM course;
SELECT * FROM enroll;

-- ==============================
-- Update Query
-- ==============================
UPDATE enroll
SET grade='A'
WHERE enroll_id = 3;

-- ==============================
-- Join Query (Student + Course + Instructor)
-- ==============================
SELECT 
    s.student_name AS Student,
    c.title AS Course,
    i.inst_name AS Instructor,
    e.grade AS Grade
FROM student s
JOIN enroll e ON s.student_id = e.student_id
JOIN course c ON e.course_id = c.course_id
JOIN instructor i ON c.instructor_id = i.inst_id;

-- ==============================
-- Stored Procedure
-- ==============================
DELIMITER //

CREATE PROCEDURE enrollstud(
    IN student_id INT,
    IN course_id INT,
    IN grd ENUM('A','B','C','D','F','Incomplete')
)
BEGIN
    INSERT INTO enroll (student_id, course_id, grade)
    VALUES (student_id, course_id, grd);
END //

DELIMITER ;

-- ==============================
-- Procedure Call Example
-- ==============================
CALL enrollstud(4, 2, 'B');
CALL enrollstud(4, 2, 'B');