ALTER PROCEDURE CreateGrade
    @StudentID INT,
    @TeacherID INT,
	@CourseID INT,
    @Grade DECIMAL(5,2),
    @Comment VARCHAR(100),
    @CreatedDate DATE,
    @TotalGradesForStudent INT OUTPUT,
    @MaxGradeForStudentAndTeacher DECIMAL(5,2) OUTPUT
AS
BEGIN
    -- Insert Grade header info into the Grade table
    INSERT INTO dbo.Grade (StudentID, TeacherID, CourseID,Grade, Comment, CreatedDate)
    VALUES (@StudentID, @TeacherID, @CourseID, @Grade, @Comment, @CreatedDate);

    -- Get the total number of grades for the student
    SELECT @TotalGradesForStudent = COUNT(*) 
    FROM dbo.Grade 
    WHERE StudentID = @StudentID;

    -- Get the maximum grade for the student and teacher
    SELECT @MaxGradeForStudentAndTeacher = MAX(Grade)
    FROM dbo.Grade
    WHERE StudentID = @StudentID
    AND TeacherID = @TeacherID;

    -- Return the resultsets
    SELECT @TotalGradesForStudent AS TotalGradesForStudent;

    SELECT @MaxGradeForStudentAndTeacher AS MaxGradeForStudentAndTeacher;
END;



DECLARE @TotalGrades INT;
DECLARE @MaxGrade DECIMAL(5,2);
DECLARE @CreatedDate DATETIME = GETDATE();

EXEC CreateGrade
    @StudentID = 1,
    @TeacherID = 2,
	@CourseID = 2,
    @Grade = 10,
    @Comment = 'Good job!',
    @CreatedDate = @CreatedDate,
    @TotalGradesForStudent = @TotalGrades OUTPUT,
    @MaxGradeForStudentAndTeacher = @MaxGrade OUTPUT;

select * 
from Grade
where Comment = 'Good job!'
