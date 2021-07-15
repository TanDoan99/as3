CREATE TABLE San_Pham(
	Ma_SP int not null IDENTITY(1,1) PRIMARY KEY,
	Ten_SP nvarchar(100),
	Don_Gia money
)
CREATE TABLE Khach_Hang(
	Ma_KH int not null PRIMARY KEY,
	Ten_KH nvarchar(100),
	Phone_No int,
	Ghi_Chu nvarchar(255)
)
CREATE TABLE Don_Hang(
	Ma_DH int not null PRIMARY KEY,
	Ngay_DH date,
	Ma_SP int not null FOREIGN KEY REFERENCES San_Pham(Ma_SP),
	So_Luong int,
	Ma_KH int not null FOREIGN KEY REFERENCES Khach_Hang(Ma_KH)
)
INSERT INTO San_Pham(Ten_SP,Don_Gia)
VALUES (N'Lap Top nhà Táo',600000000)
	   ,(N'Điện Thoại Vờ Tu',800000000)
	   ,(N'Đồng Hồ Thụy Sĩ',100000000)

INSERT INTO Khach_Hang(Ma_KH,Ten_KH,Phone_No,Ghi_Chu)
VALUES (1,N'Nguyễn Văn A',357589683,'No')
	   ,(2,N'Nguyễn Thị B',965834724,'No')
	   ,(3,N'Nguyễn Văn C',865724135,'No')

INSERT INTO Don_Hang(Ma_DH,Ngay_DH,Ma_SP,So_Luong,Ma_KH)
VALUES (1,'2021-06-15',2,5,3)
	   ,(2,'2021-03-05',1,3,1)
	   ,(3,'2021-01-10',2,8,2)

CREATE VIEW View_DonHang AS
SELECT a.Ten_KH,b.Ngay_DH,c.Ten_SP,b.So_Luong,SUM(b.So_Luong*c.Don_Gia) AS Thanh_Tien FROM Khach_Hang a
INNER JOIN Don_Hang b ON a.Ma_KH=b.Ma_KH
INNER JOIN San_Pham c ON b.Ma_SP=c.Ma_SP
GROUP BY a.Ten_KH,b.Ngay_DH,c.Ten_SP,b.So_Luong