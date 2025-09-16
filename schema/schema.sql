-- Departments table
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50)
);

-- Employees table
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    DeptID INT,
    HireDate DATE,
    Salary DECIMAL(10,2),
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

-- Insert sample data
INSERT INTO Departments VALUES (1, 'HR'), (2, 'IT'), (3, 'Finance');

INSERT INTO Employees VALUES
(101, 'Alice', 1, '2020-01-15', 50000),
(102, 'Bob', 2, '2019-03-20', 60000),
(103, 'Charlie', 2, '2021-07-01', 55000),
(104, 'David', 3, '2018-11-12', 70000),
(105, 'Eva', 1, '2022-05-30', 45000);
