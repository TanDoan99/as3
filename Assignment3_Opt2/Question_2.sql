--1
CREATE TABLE Employee_Table(
	Employee_Number int not null PRIMARY KEY,
	Employee_Name nvarchar(100),
	Department_Number int not null FOREIGN KEY REFERENCES Department(Department_Number)
)
CREATE TABLE Skill_Table(
	Skill_Code int not null PRIMARY KEY,
	Skill_Name nvarchar(100)
)

CREATE TABLE Employee_Skill_Table (
	Employee_Number int not null FOREIGN KEY REFERENCES Employee_Table(Employee_Number),
	Skill_Code int not null FOREIGN KEY REFERENCES Skill_Table(Skill_Code),
	Date_Registered date
)
ALTER TABLE Employee_Skill_Table
ADD CONSTRAINT pk_key PRIMARY KEY (Employee_Number,Skill_Code)
CREATE TABLE Department(
	Department_Number int not null PRIMARY KEY,
	Department_Name nvarchar(100)
)
INSERT INTO Department(Department_Number,Department_Name)
VALUES (1,'Phong IT')
	   ,(2,'Phong TESTER')
	   ,(3,'Phong DATA')

INSERT INTO Employee_Skill_Table(Employee_Number,Skill_Code,Date_Registered)
VALUES /*(3,1,'2019-08-15')
	   ,(1,2,'2020-03-12')
	   ,(2,3,'2018-04-04')*/
	   (3,3,'2020-05-12')
	   ,(2,1,'2018-06-04')


INSERT INTO Skill_Table(Skill_Code,Skill_Name)
VALUES (1,'Java')
	   ,(2,'Kiem Thu')
	   ,(3,'He Thong')

INSERT INTO Employee_Table(Employee_Number,Employee_Name,Department_Number)
VALUES /*(1,'Nguyen Van A',2)
	   ,(2,'Le Van B',3)
	   ,(3,'Tran Van C',1)*/
	   (4,'Le Van D',1)
	   ,(5,'Tran Van F',1)
--2
--2.a
SELECT a.Employee_Name as 'Names of the employees whose have skill of ‘Java’' FROM Employee_Table a
 JOIN Employee_Skill_Table b ON a.Employee_Number=b.Employee_Number
 JOIN Skill_Table c ON b.Skill_Code=c.Skill_Code
 WHERE c.Skill_Name='Java'
 --2.b
 SELECT a.Employee_Name as 'Names of the employees whose have skill of ‘Java’' FROM Employee_Table a
 ,Employee_Skill_Table b
 WHERE a.Employee_Number=b.Employee_Number AND b.Skill_Code IN (
 SELECT c.Skill_Code FROM Skill_Table c
 WHERE c.Skill_Name='Java'
 )
 --3
 SELECT b.Department_Name,STRING_AGG(a.Employee_Name,', ') as 'NV_Chung_Phong' FROM Employee_Table a
 INNER JOIN Department b ON a.Department_Number=b.Department_Number 
  
GROUP BY b.Department_Name,a.Department_Number
HAVING COUNT(a.Department_Number)>=3

--4
SELECT a.Employee_Number,a.Employee_Name FROM Employee_Table a
WHERE a.Employee_Number in (
	SELECT Employee_Number  FROM Employee_Skill_Table 
	GROUP BY Employee_Number
	HAVING COUNT(Employee_Number)>1
)

--5
CREATE VIEW EMP_VIEW AS
SELECT a.Employee_Number,a.Employee_Name,b.Department_Name FROM Employee_Table a
INNER JOIN Department b ON a.Department_Number=b.Department_Number
WHERE a.Employee_Number in (
	SELECT Employee_Number  FROM Employee_Skill_Table 
	GROUP BY Employee_Number
	HAVING COUNT(Employee_Number)>1
)
