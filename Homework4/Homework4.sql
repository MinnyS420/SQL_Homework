SELECT
  t.ID,
  t.FirstName,
  COUNT(g.grade) AS grade_count
FROM
  dbo.Teacher t
JOIN
  Grade g ON t.ID = g.TeacherID
GROUP BY
  t.ID, t.FirstName
ORDER BY
  t.ID ASC;


SELECT
  t.ID,
  t.FirstName,
  COUNT(g.grade) AS grade_count
FROM
  dbo.Teacher t
JOIN
  Grade g ON t.ID = g.TeacherID
WHERE
  g.StudentID < 100
GROUP BY
  t.ID, t.FirstName
ORDER BY
  t.ID ASC;


SELECT
  StudentID,
  MAX(Grade) AS MaximalGrade,
  AVG(Grade) AS AverageGrade
FROM
  dbo.Grade
GROUP BY
  StudentID
ORDER BY
  StudentID ASC;


SELECT
  t.ID,
  t.FirstName,
  COUNT(g.grade) AS grade_count
FROM
  dbo.Teacher t
JOIN
  Grade g ON t.ID = g.TeacherID
GROUP BY
  t.ID, t.FirstName
HAVING
  COUNT(g.grade) > 200
ORDER BY
  t.ID ASC;


SELECT
  StudentID,
  COUNT(Grade) AS GradeCount,
  MAX(Grade) AS MaximalGrade,
  AVG(Grade) AS AverageGrade
FROM
  Grade
GROUP BY
  StudentID
HAVING
  MAX(Grade) = AVG(Grade)
ORDER BY
  StudentID ASC;


SELECT
  s.FirstName,
  s.LastName,
  g.GradeCount,
  g.MaximalGrade,
  g.AverageGrade
FROM
  (
    SELECT
      StudentID,
      COUNT(Grade) AS GradeCount,
      MAX(Grade) AS MaximalGrade,
      AVG(Grade) AS AverageGrade
    FROM
      dbo.Grade
    GROUP BY
      StudentID
    HAVING
      MAX(Grade) = AVG(Grade)
  ) g
JOIN
  Student s ON s.ID = g.StudentID;


CREATE VIEW vv_StudentGrades AS
SELECT
  StudentID,
  COUNT(Grade) AS GradeCount
FROM
  dbo.Grade
GROUP BY
  StudentID;


CREATE VIEW vv_StudentGrades1 AS
SELECT
  s.FirstName,
  s.LastName,
  COUNT(g.Grade) AS GradeCount
FROM
  dbo.Grade g
JOIN
  Student s ON s.ID = g.StudentID
GROUP BY
  s.FirstName,
  s.LastName;


SELECT *
FROM vv_StudentGrades
ORDER BY GradeCount DESC;
