DROP DATABASE IF EXISTS student_management;
CREATE DATABASE student_management;
USE student_management;
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    major VARCHAR(100),
    email VARCHAR(100)
);
INSERT INTO students (name, age, major, email) VALUES
('Alex Carter', 20, 'Data Science', 'alex.carter@example.com'),
('Emma Wilson', 21, 'Business', 'emma.wilson@example.com'),
('Liam Brown', 19, 'Computer Science', 'liam.brown@example.com'),
('Olivia Davis', 22, 'Economics', 'olivia.davis@example.com'),
('Noah Miller', 20, 'Information Systems', 'noah.miller@example.com'),
('Sophia Taylor', 21, 'Marketing', 'sophia.taylor@example.com'),
('James Anderson', 23, 'Finance', 'james.anderson@example.com'),
('Ava Thomas', 19, 'Data Science', 'ava.thomas@example.com'),
('William Jackson', 22, 'Computer Science', 'william.jackson@example.com'),
('Mia White', 20, 'Business', 'mia.white@example.com'),
('Benjamin Harris', 21, 'Economics', 'benjamin.harris@example.com'),
('Isabella Martin', 22, 'Marketing', 'isabella.martin@example.com'),
('Lucas Thompson', 19, 'Finance', 'lucas.thompson@example.com'),
('Charlotte Garcia', 20, 'Data Science', 'charlotte.garcia@example.com'),
('Henry Martinez', 23, 'Information Systems', 'henry.martinez@example.com'),
('Amelia Robinson', 21, 'Business', 'amelia.robinson@example.com'),
('Daniel Clark', 20, 'Computer Science', 'daniel.clark@example.com'),
('Harper Rodriguez', 19, 'Economics', 'harper.rodriguez@example.com'),
('Matthew Lewis', 22, 'Finance', 'matthew.lewis@example.com'),
('Evelyn Lee', 21, 'Marketing', 'evelyn.lee@example.com');
SELECT COUNT(*) FROM students;
SELECT * FROM students;