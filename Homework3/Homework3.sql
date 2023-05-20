use SEDC_ACADEMY_HOMEWORK

select *
from dbo.Student
where FirstName = 'Antonio'

select *
from dbo.Student
where DateOfBirth >= '1999-01-01'

select *
from dbo.Student
where LastName like 'J%'
and DateOfBirth like '1998-01%'

select *
from dbo.Student
order by FirstName

select LastName
from dbo.Student
union
select LastName
from dbo.Teacher

/*
alter Table [dbo].[Grade]  with check add constraint [FK_Grade_Course] foreign key([CourseID])
references [dbo].[Course] ([ID])
alter Table [dbo].[Grade] check constraint [FK_Grade_Course]

alter Table [dbo].[Grade]  with check add constraint [FK_Grade_Student] foreign key([StudentID])
references [dbo].[Student] ([ID])
alter Table [dbo].[Grade] check constraint [FK_Grade_Student]

alter Table [dbo].[Grade]  with check add constraint [FK_Grade_Teacher] foreign key([TeacherID])
references [dbo].[Teacher] ([ID])
alter Table [dbo].[Grade] check constraint [FK_Grade_Teacher]

alter Table [dbo].[GradeDetails]  with check add constraint [FK_GradeDetails_AchievementType] foreign key([AchievementTypeID])
references [dbo].[AchievementType] ([ID])
alter Table [dbo].[GradeDetails] check constraint [FK_GradeDetails_AchievementType]

alter Table [dbo].[GradeDetails]  with check add constraint [FK_GradeDetails_Grade] foreign key([GradeID])
references [dbo].[Grade] ([ID])
alter Table [dbo].[GradeDetails] check constraint [FK_GradeDetails_Grade]
*/

select cs.Name as CourseName, AType.Name as AchievementTypeName
from Course as cs
cross join AchievementType as AType

select T.FirstName,T.LastName,'--', G.Grade
from dbo.Teacher as T
left join dbo.Grade as G on T.ID = G.TeacherID
where G.TeacherID is null;