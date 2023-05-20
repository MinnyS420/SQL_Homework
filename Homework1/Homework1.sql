--create database SEDCACADEMYDB
use SEDCACADEMYDB

create table dbo.Students
(
	Id INT IDENTITY(1,1),
	FirstName NVARCHAR(20) NULL,
	LastName NVARCHAR(20) NULL,
	DateOfBirth DATE NULL,
	EnrolledDate INT NULL,
	Gender CHAR (1) NULL,
	NacionallDNumber INT NULL,
	StudentCardNumber INT NULL
)

create table dbo.Teachers
(
	Id INT IDENTITY(1,1),
	FirstName NVARCHAR(20) NULL,
	LastName NVARCHAR(20) NULL,
	DateOfBirth DATE NULL,
	AcademicRank NVARCHAR NULL,
	HireDate INT NULL
)

create table dbo.Grades
(
	Id INT IDENTITY(1,1),
	StudentID INT NULL,
	CourseID INT NULL,
	TeacherID INT NULL,
	Grade INT NULL,
	Comment NVARCHAR(100) NULL,
	CreatedDate DATE NULL,
)

create table dbo.Courses
(
	[Id] INT IDENTITY(1,1),
	[Name] NVARCHAR(20) NULL,
	[Credit] INT NULL,
	[AcademicYear] DATE NULL,
	[Semester] NVARCHAR NULL
)

create table dbo.GradeDetails
(
	Id INT IDENTITY(1,1),
	GradeID INT NULL,
	AchievementTypeID INT NULL,
	AchievementPoints INT NULL,
	AchievementMaxPoints INT NULL,
	AchievementDate DATE NULL
)

create table dbo.AchievementTypes
(
	[Id] INT IDENTITY(1,1),
	[Name] NVARCHAR(20) NULL,
	[Description] NVARCHAR(200) NULL,
	[ParticipationRate] DECIMAL(10,2) NULL
)

select *
from dbo.Students