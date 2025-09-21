-- Projects table (new)
CREATE TABLE Projects (
    ProjID INT PRIMARY KEY,
    ProjName VARCHAR(100),
    DeptID INT,
    Budget DECIMAL(12,2),
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

-- Assignments table (new - many-to-many relation)
CREATE TABLE Assignments (
    EmpID INT,
    ProjID INT,
    Role VARCHAR(50),
    PRIMARY KEY (EmpID, ProjID),
    FOREIGN KEY (EmpID) REFERENCES Employees(EmpID),
    FOREIGN KEY (ProjID) REFERENCES Projects(ProjID)
);

-- Insert sample projects
INSERT INTO Projects VALUES
(201, 'Recruitment System', 1, 200000),
(202, 'Cloud Migration', 2, 500000),
(203, 'Financial Dashboard', 3, 300000);

-- Insert assignments
INSERT INTO Assignments VALUES
(101, 201, 'HR Lead'),
(102, 202, 'Cloud Engineer'),
(103, 202, 'DevOps'),
(104, 203, 'Finance Analyst'),
(105, 201, 'HR Assistant');
