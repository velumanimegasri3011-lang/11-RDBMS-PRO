CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50)
);

CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);
Step 2: Insert sample values

sql
INSERT INTO Department VALUES
(1, 'Computer Science'),
(2, 'Information Technology'),
(3, 'Electronics');

INSERT INTO Student VALUES
(101, 'Arun', 1),
(102, 'Priya', 2),
(103, 'Kumar', 3);

INSERT INTO Course VALUES
(201, 'DBMS'),
(202, 'Python'),
(203, 'Networking');

INSERT INTO Enrollment VALUES
(1, 101, 201),
(2, 102, 202),
(3, 103, 203);
Step 3: Create the view StudentDetails

sql
CREATE VIEW StudentDetails AS
SELECT
    S.StudentName,
    C.CourseName,
    D.DepartmentName
FROM Student S
JOIN Enrollment E ON S.StudentID = E.StudentID
JOIN Course C ON E.CourseID = C.CourseID
JOIN Department D ON S.DepartmentID = D.DepartmentID;
Step 4: Display the view

sql
SELECT * FROM StudentDetails;
