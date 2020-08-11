--Find all Students with FirstName = Antonio​

select *
from Student
where FirstName='Antonio'

--Find all Students with DateOfBirth greater than ‘01.01.1999’​

select *
from Student
where DateOfBirth> '1999-01-01'
order by DateOfBirth asc 

--Find all Male students​
select *
from Student
where Gender='m'

--Find all Students with LastName starting With ‘T’​
select *
from Student
where  LastName like 't%'

--Find all Students Enrolled in January/1998​
select *
from Student
where EnrolledDate >= '1998-01-01' and EnrolledDate <'1998-02-01'


--Find all Students with LastName starting With ‘J’ enrolled in January/1998​
select *
from Student
where LastName like 'j%' and EnrolledDate >= '1998-01-01' and EnrolledDate <'1998-02-01'


--Find all Students with FirstName = Antonio ordered by Last Name​
select *
from Student
where FirstName='Antonio'
order by LastName asc

--List all Students ordered by FirstName​
select *
from Student
order by FirstName asc

--Find all Male students ordered by EnrolledDate, starting from the last enrolled
select *
from Student
order by EnrolledDate desc

--List all Teacher First Names and Student First Names in single result set with duplicates​
select FirstName
from Teacher
union all
select FirstName
from Student

--List all Teacher Last Names and Student Last Names in single result set. Remove duplicates​
select LastName
from Teacher
union 
select LastName
from Student

--List all common First Names for Teachers and Students

select FirstName
from Teacher
intersect 
select FirstName
from Student
group by FirstName


--Change GradeDetails table always to insert value 100 in AchievementMaxPoints column if no value is provided on insert

alter table GradeDetails
add constraint DF_GradeDetales_AchievementMaxPoints 
default 100 for [AchievementMaxPoints]

--Change GradeDetails table to prevent inserting AchievementPoints that will more than AchievementMaxPoints


alter table GradeDetails with check
add constraint CHK_GradeDetales_AchievementMaxPoints
check (AchievementPoints<=AchievementMaxPoints)

--Change AchievementType table to guarantee unique names across the Achievement types

alter table AchievementType
add constraint UC_AchievementType unique (name)


--List all possible combinations of Courses names and AchievementType names that can be passed by student
select c.Name as Courses, at.Name as AchievementType
from Course c
cross join AchievementType at


--List all Teachers that has any exam Grade
select distinct  t.FirstName, t.LastName  as Teacher
from Grade g
inner join Teacher as t on t.ID=g.TeacherID


--List all Teachers without exam Grade
select distinct t.FirstName, t.Lastname 
from Teacher t
left join Grade as g on t.ID=g.TeacherID
where g.TeacherID is null


--List all Students without exam Grade (using Right Join)

select distinct s.FirstName, s.LastName
from Grade g
right join Student as s on s.id=g.StudentID
where g.Grade is null
