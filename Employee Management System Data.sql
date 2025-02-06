-- schema.sql: Defines the database schema for Employee Management System
-- create database
CREATE DATABASE EmployeeDB;
USE EmployeeDB;
-- create employee table
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender ENUM('Male', 'Female', 'Other'),
    DOB DATE,
    DepartmentID INT,
    Salary DECIMAL(10,2),
    JoiningDate DATE
);
select * from employees;

-- Create Department Table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(50)
);
select * from Departments;
 
-- Create Attendance Table
CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY AUTO_INCREMENT,
    EmpID INT,
    Date DATE,
    Status ENUM('Present', 'Absent', 'Leave'),
    FOREIGN KEY (EmpID) REFERENCES Employees(EmpID)
);
select * from attendance;

-- data.sql: Inserts sample data into the tables
-- Insert Departments
INSERT INTO Departments (DepartmentName) VALUES
('HR'),
('Finance'),
('IT'),
('Marketing');

-- Insert Employees
INSERT INTO Employees (FirstName, LastName, Gender, DOB, DepartmentID, Salary, JoiningDate) VALUES
('Arfath', 'Khan', 'Male', '1990-05-10', 1, 50000.00, '2020-03-15'),
('Shibra', 'Banu', 'Female', '1992-07-22', 2, 60000.00, '2019-08-10'),
('Moin', 'Shaik', 'Male', '1988-12-02', 3, 75000.00, '2018-06-25'),
('Sana', 'Khan', 'Female', '1995-09-15', 4, 55000.00, '2021-01-05');

-- Insert Attendance Records
INSERT INTO Attendance (EmpID, Date, Status) VALUES
(1, '2024-02-01', 'Present'),
(2, '2024-02-01', 'Absent'),
(3, '2024-02-01', 'Present'),
(4, '2024-02-01', 'Leave');

-- queries.sql: Sample queries for data analysis
-- Retrieve all from Employees
select * from employees;

-- Get total employees in each department
select DepartmentName, count(EmpId) 
from Employees e
join Departments d 
on e.departmentId = d.departmentId
group by d.DepartmentName;

-- Find employees who joined before 2020
select Firstname, Lastname, Joiningdate from Employees
where joiningDate < '2020-01-01' ;

-- Find employees earning above 60,000
select firstname, lastname, salary 
from employees
where salary > 60000;

-- Find attendance record for a specific employee (Arftah khan)
select e.firstname, e.lastname, a.date, a.Status
from employees e 
join attendance a 
on e.EmpId = a.EmpId
where firstname = 'Arfath';






