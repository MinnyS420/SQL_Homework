DECLARE @FirstName VARCHAR(50); -- Declare the scalar variable

SET @FirstName = 'Antonio'; -- Assign value 'Antonio' to the FirstName variable

-- Find all students having FirstName same as the variable
SELECT *
FROM dbo.Student
WHERE FirstName = @FirstName;


DECLARE @StudentTable TABLE (
    StudentId INT,
    StudentName VARCHAR(50),
    DateOfBirth DATE
);

-- Fill the table variable with all female students
INSERT INTO @StudentTable (StudentId, StudentName, DateOfBirth)
SELECT ID, FirstName, DateOfBirth
FROM dbo.Student
WHERE Gender = 'F';


-- Declare the temporary table
CREATE TABLE #TempTable (
    LastName VARCHAR(50),
    EnrolledDate DATE
);

-- Fill the temp table with all male students having first name starting with 'A'
INSERT INTO #TempTable (LastName, EnrolledDate)
SELECT LastName, EnrolledDate
FROM dbo.Student
WHERE Gender = 'M' AND FirstName LIKE 'A%';

-- Retrieve the students from the table whose last name is 7 characters
SELECT *
FROM #TempTable
WHERE LEN(LastName) = 7;


SELECT *
FROM dbo.Teacher
WHERE LEN(FirstName) < 5 AND LEFT(FirstName, 3) = LEFT(LastName, 3);
