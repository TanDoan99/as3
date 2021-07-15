
GO
/****** Object:  Table [dbo].[EMPMAJOR]    Script Date: 06/01/2015 17:22:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EMPMAJOR](
	[emp_no] [char](6) NOT NULL,
	[major] [char](3) NOT NULL,
	[major_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Major] PRIMARY KEY CLUSTERED 
(
	[emp_no] ASC,
	[major] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EMP]    Script Date: 06/01/2015 17:22:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EMP](
	[emp_no] [char](6) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[dept_no] [char](3) NOT NULL,
	[job] [varchar](50) NULL,
	[salary] [money] NOT NULL,
	[bonus] [money] NULL,
	[ed_level] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[emp_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DEPT]    Script Date: 06/01/2015 17:22:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DEPT](
	[dept_no] [char](3) NOT NULL,
	[dept_name] [varchar](50) NOT NULL,
	[mgn_no] [char](6) NULL,
	[admr_dept] [char](3) NOT NULL,
	[location] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[dept_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[dept_name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EMPPROJACT]    Script Date: 06/01/2015 17:22:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EMPPROJACT](
	[emp_no] [char](6) NOT NULL,
	[proj_no] [char](6) NOT NULL,
	[act_no] [int] NOT NULL,
 CONSTRAINT [PK_EPA] PRIMARY KEY CLUSTERED 
(
	[emp_no] ASC,
	[proj_no] ASC,
	[act_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ACT]    Script Date: 06/01/2015 17:22:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ACT](
	[act_no] [int] NOT NULL,
	[act_des] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[act_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_Dept]    Script Date: 06/01/2015 17:22:33 ******/
ALTER TABLE [dbo].[DEPT]  WITH CHECK ADD  CONSTRAINT [FK_Dept] FOREIGN KEY([mgn_no])
REFERENCES [dbo].[EMP] ([emp_no])
GO
ALTER TABLE [dbo].[DEPT] CHECK CONSTRAINT [FK_Dept]
GO
/****** Object:  ForeignKey [FK__EMP__dept_no__3E52440B]    Script Date: 06/01/2015 17:22:33 ******/
ALTER TABLE [dbo].[EMP]  WITH CHECK ADD FOREIGN KEY([dept_no])
REFERENCES [dbo].[DEPT] ([dept_no])
ON DELETE CASCADE
GO
/****** Object:  ForeignKey [FK_Major]    Script Date: 06/01/2015 17:22:33 ******/
ALTER TABLE [dbo].[EMPMAJOR]  WITH CHECK ADD  CONSTRAINT [FK_Major] FOREIGN KEY([emp_no])
REFERENCES [dbo].[EMP] ([emp_no])
GO
ALTER TABLE [dbo].[EMPMAJOR] CHECK CONSTRAINT [FK_Major]
GO
/****** Object:  ForeignKey [FK_EPA1]    Script Date: 06/01/2015 17:22:33 ******/
ALTER TABLE [dbo].[EMPPROJACT]  WITH CHECK ADD  CONSTRAINT [FK_EPA1] FOREIGN KEY([emp_no])
REFERENCES [dbo].[EMP] ([emp_no])
GO
ALTER TABLE [dbo].[EMPPROJACT] CHECK CONSTRAINT [FK_EPA1]
GO
/****** Object:  ForeignKey [FK_EPA2]    Script Date: 06/01/2015 17:22:33 ******/
ALTER TABLE [dbo].[EMPPROJACT]  WITH CHECK ADD  CONSTRAINT [FK_EPA2] FOREIGN KEY([act_no])
REFERENCES [dbo].[ACT] ([act_no])
GO
ALTER TABLE [dbo].[EMPPROJACT] CHECK CONSTRAINT [FK_EPA2]
GO
--1
INSERT INTO EMP(emp_no,last_name,first_name,dept_no,job,salary,bonus,ed_level)
VALUES ('E001','Tran','Van Anh','D02','Dev IT',2500,100,7)
	   ,('E002','Le','Van Banh','D02','Test ',1500,200,6)
	   ,('E003','Nguyen','Van Tranh','D03','QA',2000,300,8)
	   ,('E004','Doan','Van Hau','D05','Manager IT',3500,100,9)
	   ,('E005','Pham','Thi Anh','D04','Hr',1500,200,7)
	   ,('E006','Tran','Trung Thanh','D06','Big Data',2700,50,8)
	   ,('E007','Vo','Anh Hao','D07','Front End',1200,100,5)
	   ,('E008','Tran','Le Hoa','D08','Designer',1600,100,6)

INSERT INTO ACT(act_no,act_des)
VALUES (1,'Code and test')
	   ,(2,'Writing document')
	   ,(3,'Add Text')
	   ,(4,'Nhap du lieu')
	   ,(5,'Viet test case')
	   ,(6,'Tạo chuc nang')
	   ,(7,'Phan tich du lieu')
	   ,(8,'Quan li ma nguon')

INSERT INTO EMPPROJACT(emp_no,proj_no,act_no)
VALUES ('E002','P001',1)
	   ,('E001','P002',3)
	   ,('E003','P003',5)
	   ,('E004','P004',6)
	   ,('E006','P005',4)
	   ,('E005','P006',2)
	   ,('E007','P007',7)
	   ,('E001','P008',8)

INSERT INTO DEPT(dept_no,dept_name,admr_dept,location)
VALUES ('D01','JAVA','A01','Toa nha A')
	   ,('D02','NODEJS','A02','Toa nha E')
	   ,('D03','KOLIN','A03','Toa nha B')
	   ,('D04','RUBY','A04','Toa nha C')
	   ,('D05','PHP','A05','Toa nha H')
	   ,('D06','IOT','A06','Toa nha G')
	   ,('D07','DATA','A07','Toa nha D')
	   ,('D08','TESTER','A08','Toa nha F')

INSERT INTO EMPMAJOR(emp_no,major,major_name)
VALUES ('E002','M01','MAT')
	   ,('E003','M02','CSI')
	   ,('E002','M03','CSI')
	   ,('E005','M04','ASP')
	   ,('E004','M05','BIOS')
	   ,('E006','M06','PSU')
	   ,('E007','M07','OS')
	   ,('E008','M08','E–card')
--2 
SELECT DISTINCT a.* FROM EMP a
INNER JOIN EMPPROJACT b ON a.emp_no=b.emp_no
--3
SELECT DISTINCT  a.* FROM EMP a
JOIN EMPMAJOR b ON a.emp_no=b.emp_no
WHERE b.major_name='MAT' OR b.major_name='CSI'
--4
SELECT*FROM EMP a
JOIN EMPPROJACT b ON a.emp_no=b.emp_no
JOIN ACT c ON b.act_no=c.act_no
WHERE c.act_no BETWEEN 90 AND 110
--5
/*WITH expression_name [ ( column_name [,...n] ) ]

AS

( 

   CTE_query_definition 

)

SELECT

FROM expression_name;*/

SELECT a.emp_no,a.last_name,a.first_name,a.salary,a.dept_no,b.DEPT_AVG_SAL FROM EMP a
LEFT JOIN 
(
SELECT dept_no,AVG(salary) as DEPT_AVG_SAL FROM EMP
GROUP BY dept_no
) AS b	
ON a.dept_no=b.dept_no
--6
WITH CTE_HocVan(emp_no,last_name,first_name,dept_no,job,salary,bonus,ed_level) as
(
	SELECT e.* FROM EMP e
	LEFT JOIN (
		SELECT dept_no,AVG(ed_level) as AVG_LEVEL FROM EMP e
		GROUP BY dept_no
	)as b ON e.dept_no=b.dept_no
	WHERE e.ed_level>b.AVG_LEVEL
)
SELECT *FROM CTE_HocVan 
--7 Trả lại số phòng ban, tên phòng ban và tổng biên chế cho phòng ban có biên chế cao nhất.
--Bảng lương sẽ được định nghĩa là tổng của tất cả các khoản lương và thưởng cho bộ phận.
go
WITH Sum_payroll as
(
		SELECT b.dept_no ,SUM(salary+bonus) as payroll FROM EMP e
		JOIN DEPT b ON e.dept_no=b.dept_no
		GROUP BY b.dept_no
)
SELECT TOP 1 DEPT.dept_no,DEPT.dept_name,Sum_payroll.payroll  FROM DEPT
JOIN Sum_payroll ON DEPT.dept_no=Sum_payroll.dept_no
ORDER BY Sum_payroll.payroll DESC

WITH Sum_payroll as
(
		SELECT b.dept_no,SUM(salary+bonus) as payroll FROM EMP e
		JOIN DEPT b ON e.dept_no=b.dept_no
		GROUP BY b.dept_no
)
SELECT TOP 1 DEPT.dept_no,DEPT.dept_name,Sum_payroll.payroll FROM DEPT,Sum_payroll
WHERE DEPT.dept_no=Sum_payroll.dept_no
ORDER BY Sum_payroll.payroll DESC
--8
SELECT TOP(5) emp_no,first_name,salary FROM EMP
GROUP BY emp_no,first_name,salary
ORDER BY salary  DESC



	
