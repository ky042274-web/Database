CREATE DATABASE LIBERARY1;
USE LIBERARY1; 

CREATE TABLE STUDENT(
	Student_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT
);
CREATE TABLE Registration (
    Registration_ID INT PRIMARY KEY,
    Student_ID INT,
    Course_ID INT,
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID)
);

CREATE TABLE Department (
    Department_ID INT PRIMARY KEY,
    Department_Name VARCHAR(50),
    HOD VARCHAR(50)
);
CREATE TABLE Faculty (
    Faculty_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Subject VARCHAR(50),
    Department_ID INT,
    FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID)
);
CREATE TABLE Course (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(50),
    Credits INT,
    Department_ID INT,
    FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID)
);
CREATE TABLE Classroom (
    Classroom_ID INT PRIMARY KEY,
    Room_Number VARCHAR(10),
    Capacity INT
);
CREATE TABLE Registration (
    Registration_ID INT PRIMARY KEY,
    Student_ID INT,
    Course_ID INT,
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID)
);
