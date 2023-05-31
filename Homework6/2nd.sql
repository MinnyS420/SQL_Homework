ALTER PROCEDURE CreateGradeDetail
    @GradeID INT,
    @AchievementTypeID INT,
    @AchievementPoints INT,
    @AchievementMaxPoints INT,
    @AchievementDate DATE,
    @GradePoints DECIMAL(10,2) OUTPUT
AS
BEGIN
    -- Insert the new grade detail record
    INSERT INTO dbo.GradeDetails (GradeID, AchievementTypeID, AchievementPoints, AchievementMaxPoints, AchievementDate)
    VALUES (@GradeID, @AchievementTypeID, @AchievementPoints, @AchievementMaxPoints, @AchievementDate)
    
    -- Calculate the grade points
    SELECT @GradePoints = SUM(CAST(AD.AchievementPoints AS DECIMAL(10,2)) / CAST(AD.AchievementMaxPoints AS DECIMAL(10,2)) * AT.ParticipationRate)
    FROM dbo.GradeDetails AD
    INNER JOIN dbo.Grade G ON G.ID = AD.GradeID
    INNER JOIN dbo.AchievementType AT ON AT.ID = AD.AchievementTypeID
    WHERE G.ID = @GradeID
END

DECLARE @GradePoints DECIMAL(10,2)
DECLARE @AchievementDate DATETIME = GETDATE();

EXEC CreateGradeDetail @GradeID = 1, @AchievementTypeID = 1, @AchievementPoints = 80, @AchievementMaxPoints = 100, @AchievementDate = @AchievementDate, @GradePoints = @GradePoints OUTPUT

SELECT @GradePoints AS GradePoints


SELECT *
from GradeDetails
where AchievementDate like '2023%'