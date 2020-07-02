--tạo bảng
CREATE TABLE HOCSINH
( 
	MaHocSinh NVARCHAR(50) PRIMARY KEY,
	TenHocSinh NVARCHAR(50) NULL,
	NamSinh NVARCHAR(50) NULL,
	GioiTinh NVARCHAR(50) NULL,
	TenLop NVARCHAR(50) NULL
)
 CREATE TABLE KHOI(
	MaKhoi NVARCHAR(50) PRIMARY KEY,
	TenKhoi NVARCHAR(50) NULL
 )
  CREATE TABLE DETHI(
	MaDeThi NVARCHAR(50) PRIMARY KEY,
	TenDeThi NVARCHAR(50) NULL,
	ThoiGianThi NVARCHAR(50) NULL,
	SoCauHoi NVARCHAR(50) NULL,
	TrangThai NVARCHAR(50) NULL
  )
  CREATE TABLE CAUHOI (
  MaCauHoi NVARCHAR(50) PRIMARY KEY,
  MaKhoi NVARCHAR(50) NOT NULL,
  NoiDung NVARCHAR(50) NULL,
  DapAnA NVARCHAR(50) NULL,
   DapAnB NVARCHAR(50) NULL,
    DapAnC NVARCHAR(50) NULL,
	 DapAnD NVARCHAR(50) NULL,
	DapAnDung NVARCHAR(50) NULL
  )
CREATE TABLE DETHI_CAUHOI(
	MaDeThi NVARCHAR(50) NOT NULL,
	MaCauHoi NVARCHAR(50) NOT NULL
	--CONSTRAINT DT_CH PRIMARY KEY (MaDeThi,MaCauHoi)
)
CREATE TABLE KETQUA(
	MaHocSinh NVARCHAR(50) NOT NULL,
	MaDeThi NVARCHAR(50) NOT NULL,
	MaCauHoi NVARCHAR(50) NOT NULL,
	DapAn NVARCHAR(50) NULL
	--CONSTRAINT ketqua PRIMARY KEY (MaHocSinh,MaDeThi,MaCauHoi)
)

--tao diagram
AlTER TABLE dbo.KETQUA
ADD CONSTRAINT FK_KetQua_Hocsinh
FOREIGN KEY (MaHocSinh)
REFERENCES dbo.HOCSINH(MaHocSinh)
ON UPDATE CASCADE
ON DELETE NO ACTION

AlTER TABLE dbo.KETQUA
ADD CONSTRAINT FK_KetQua_Dethi
FOREIGN KEY (MaDeThi)
REFERENCES dbo.DETHI(MaDeThi)
ON UPDATE CASCADE
ON DELETE NO ACTION

AlTER TABLE dbo.KETQUA
ADD CONSTRAINT FK_KetQua_CauHoi
FOREIGN KEY (MaCauHoi)
REFERENCES dbo.CAUHOI(MaCauHoi)
ON UPDATE CASCADE
ON DELETE NO ACTION

AlTER TABLE dbo.CAUHOI
ADD CONSTRAINT FK_CH_KHOI
FOREIGN KEY (MaKhoi)
REFERENCES dbo.KHOI(MaKhoi)
ON UPDATE CASCADE
ON DELETE NO ACTION

AlTER TABLE dbo.DETHI_CAUHOI
ADD CONSTRAINT FK_DTCH_CH
FOREIGN KEY (MaCauHoi)
REFERENCES dbo.CAUHOI(MaCauHoi)
ON UPDATE CASCADE
ON DELETE NO ACTION

AlTER TABLE dbo.DETHI_CAUHOI
ADD CONSTRAINT FK_DTCH_DT
FOREIGN KEY (MaDeThi)
REFERENCES dbo.DETHI(MaDeThi)
ON UPDATE CASCADE
ON DELETE NO ACTION

--insert data
--hocsinh
INSERT INTO dbo.HOCSINH
        ( MaHocSinh ,
          TenHocSinh ,
          NamSinh ,
          GioiTinh ,
          TenLop
        )
VALUES  ( N'HS0001' , -- MaHocSinh - nvarchar(50)
          N'HocSinhA' , -- TenHocSinh - nvarchar(50)
          N'2013' , -- NamSinh - nvarchar(50)
          N'Nam' , -- GioiTinh - nvarchar(50)
          N'1/1'  -- TenLop - nvarchar(50)
        )
INSERT INTO dbo.HOCSINH
        ( MaHocSinh ,
          TenHocSinh ,
          NamSinh ,
          GioiTinh ,
          TenLop
        )
VALUES  ( N'HS0002' , -- MaHocSinh - nvarchar(50)
          N'HocSinhb' , -- TenHocSinh - nvarchar(50)
          N'2012' , -- NamSinh - nvarchar(50)
          N'Nu' , -- GioiTinh - nvarchar(50)
          N'2/2'  -- TenLop - nvarchar(50)
        )
INSERT INTO dbo.HOCSINH
        ( MaHocSinh ,
          TenHocSinh ,
          NamSinh ,
          GioiTinh ,
          TenLop
        )
VALUES  ( N'HS0003' , -- MaHocSinh - nvarchar(50)
          N'HocSinhA' , -- TenHocSinh - nvarchar(50)
          N'2012' , -- NamSinh - nvarchar(50)
          N'Nu' , -- GioiTinh - nvarchar(50)
          N'1/4'  -- TenLop - nvarchar(50)
        )
INSERT INTO dbo.HOCSINH
        ( MaHocSinh ,
          TenHocSinh ,
          NamSinh ,
          GioiTinh ,
          TenLop
        )
VALUES  ( N'HS0004' , -- MaHocSinh - nvarchar(50)
          N'HocSinhC' , -- TenHocSinh - nvarchar(50)
          N'2010' , -- NamSinh - nvarchar(50)
          N'Nam' , -- GioiTinh - nvarchar(50)
          N'5/3'  -- TenLop - nvarchar(50)
        )
INSERT INTO dbo.HOCSINH
        ( MaHocSinh ,
          TenHocSinh ,
          NamSinh ,
          GioiTinh ,
          TenLop
        )
VALUES  ( N'HS0005' , -- MaHocSinh - nvarchar(50)
          N'HocSinhB' , -- TenHocSinh - nvarchar(50)
          N'2013' , -- NamSinh - nvarchar(50)
          N'Nu' , -- GioiTinh - nvarchar(50)
          N'3/2'  -- TenLop - nvarchar(50)
        )
INSERT INTO dbo.HOCSINH
        ( MaHocSinh ,
          TenHocSinh ,
          NamSinh ,
          GioiTinh ,
          TenLop
        )
VALUES  ( N'HS0006' , -- MaHocSinh - nvarchar(50)
          N'HocSinhD' , -- TenHocSinh - nvarchar(50)
          N'2010' , -- NamSinh - nvarchar(50)
          N'Nu' , -- GioiTinh - nvarchar(50)
          N'1/4'  -- TenLop - nvarchar(50)
        )

--khoi
INSERT INTO dbo.KHOI
        ( MaKhoi, TenKhoi )
VALUES  ( N'K1', -- MaKhoi - nvarchar(50)
          N'Khoi Lop 1'  -- TenKhoi - nvarchar(50)
          )
INSERT INTO dbo.KHOI
        ( MaKhoi, TenKhoi )
VALUES  ( N'K2', -- MaKhoi - nvarchar(50)
          N'Khoi Lop 2'  -- TenKhoi - nvarchar(50)
          )
INSERT INTO dbo.KHOI
        ( MaKhoi, TenKhoi )
VALUES  ( N'K3', -- MaKhoi - nvarchar(50)
          N'Khoi Lop 3'  -- TenKhoi - nvarchar(50)
          )
INSERT INTO dbo.KHOI
        ( MaKhoi, TenKhoi )
VALUES  ( N'K4', -- MaKhoi - nvarchar(50)
          N'Khoi Lop 4'  -- TenKhoi - nvarchar(50)
          )
INSERT INTO dbo.KHOI
        ( MaKhoi, TenKhoi )
VALUES  ( N'K5', -- MaKhoi - nvarchar(50)
          N'Khoi Lop 5'  -- TenKhoi - nvarchar(50)
          )

--dethi
INSERT INTO dbo.DETHI
        ( MaDeThi ,
          TenDeThi ,
          ThoiGianThi ,
          SoCauHoi ,
          TrangThai
        )
VALUES  ( N'DTA001' , -- MaDeThi - nvarchar(50)
          N'De thi 1' , -- TenDeThi - nvarchar(50)
          N'2017-11-20' , -- ThoiGianThi - nvarchar(50)
          N'30' , -- SoCauHoi - nvarchar(50)
          N'Da phat hanh'  -- TrangThai - nvarchar(50)
        )
INSERT INTO dbo.DETHI
        ( MaDeThi ,
          TenDeThi ,
          ThoiGianThi ,
          SoCauHoi ,
          TrangThai
        )
VALUES  ( N'DTA002' , -- MaDeThi - nvarchar(50)
          N'De thi 2' , -- TenDeThi - nvarchar(50)
          N'2017-12-21' , -- ThoiGianThi - nvarchar(50)
          N'20' , -- SoCauHoi - nvarchar(50)
          N'Chua phat hanh'  -- TrangThai - nvarchar(50)
        )
INSERT INTO dbo.DETHI
        ( MaDeThi ,
          TenDeThi ,
          ThoiGianThi ,
          SoCauHoi ,
          TrangThai
        )
VALUES  ( N'DTB001' , -- MaDeThi - nvarchar(50)
          N'De thi 3' , -- TenDeThi - nvarchar(50)
          N'2017-12-22' , -- ThoiGianThi - nvarchar(50)
          N'30' , -- SoCauHoi - nvarchar(50)
          N'Da phat hanh'  -- TrangThai - nvarchar(50)
        )
INSERT INTO dbo.DETHI
        ( MaDeThi ,
          TenDeThi ,
          ThoiGianThi ,
          SoCauHoi ,
          TrangThai
        )
VALUES  ( N'DTB002' , -- MaDeThi - nvarchar(50)
          N'De thi 4' , -- TenDeThi - nvarchar(50)
          N'2016-09-10' , -- ThoiGianThi - nvarchar(50)
          N'20' , -- SoCauHoi - nvarchar(50)
          N'Da phat hanh'  -- TrangThai - nvarchar(50)
        )
INSERT INTO dbo.DETHI
        ( MaDeThi ,
          TenDeThi ,
          ThoiGianThi ,
          SoCauHoi ,
          TrangThai
        )
VALUES  ( N'DTC001' , -- MaDeThi - nvarchar(50)
          N'De thi 5' , -- TenDeThi - nvarchar(50)
          N'2010-05-01' , -- ThoiGianThi - nvarchar(50)
          N'25' , -- SoCauHoi - nvarchar(50)
          N'Da phat hanh'  -- TrangThai - nvarchar(50)
        )
INSERT INTO dbo.DETHI
        ( MaDeThi ,
          TenDeThi ,
          ThoiGianThi ,
          SoCauHoi ,
          TrangThai
        )
VALUES  ( N'DTD001' , -- MaDeThi - nvarchar(50)
          N'De thi 7' , -- TenDeThi - nvarchar(50)
          N'2017-12-21' , -- ThoiGianThi - nvarchar(50)
          N'3' , -- SoCauHoi - nvarchar(50)
          N'Da phat hanh'  -- TrangThai - nvarchar(50)
        )
--CAUHOI
INSERT INTO dbo.CAUHOI
        ( MaCauHoi ,
          MaKhoi ,
          NoiDung ,
          DapAnA ,
          DapAnB ,
          DapAnC ,
          DapAnD ,
          DapAnDung
        )
VALUES  ( N'CH0001' , -- MaCauHoi - nvarchar(50)
          N'K2' , -- MaKhoi - nvarchar(50)
          N'ABC' , -- NoiDung - nvarchar(50)
          N'DA A' , -- DapAnA - nvarchar(50)
          N'DA B' , -- DapAnB - nvarchar(50)
          N'DA C' , -- DapAnC - nvarchar(50)
          N'DA D' , -- DapAnD - nvarchar(50)
          N'A'  -- DapAnDung - nvarchar(50)
        )
INSERT INTO dbo.CAUHOI
        ( MaCauHoi ,
          MaKhoi ,
          NoiDung ,
          DapAnA ,
          DapAnB ,
          DapAnC ,
          DapAnD ,
          DapAnDung
        )
VALUES  ( N'CH0002' , -- MaCauHoi - nvarchar(50)
          N'K2' , -- MaKhoi - nvarchar(50)
          N'ABC' , -- NoiDung - nvarchar(50)
          N'DA A' , -- DapAnA - nvarchar(50)
          N'DA B' , -- DapAnB - nvarchar(50)
          N'DA C' , -- DapAnC - nvarchar(50)
          N'DA D' , -- DapAnD - nvarchar(50)
          N'B'  -- DapAnDung - nvarchar(50)
        )
INSERT INTO dbo.CAUHOI
        ( MaCauHoi ,
          MaKhoi ,
          NoiDung ,
          DapAnA ,
          DapAnB ,
          DapAnC ,
          DapAnD ,
          DapAnDung
        )
VALUES  ( N'CH0003' , -- MaCauHoi - nvarchar(50)
          N'K1' , -- MaKhoi - nvarchar(50)
          N'ABC' , -- NoiDung - nvarchar(50)
          N'DA A' , -- DapAnA - nvarchar(50)
          N'DA B' , -- DapAnB - nvarchar(50)
          N'DA C' , -- DapAnC - nvarchar(50)
          N'DA D' , -- DapAnD - nvarchar(50)
          N'A'  -- DapAnDung - nvarchar(50)
        )
INSERT INTO dbo.CAUHOI
        ( MaCauHoi ,
          MaKhoi ,
          NoiDung ,
          DapAnA ,
          DapAnB ,
          DapAnC ,
          DapAnD ,
          DapAnDung
        )
VALUES  ( N'CH0004' , -- MaCauHoi - nvarchar(50)
          N'K3' , -- MaKhoi - nvarchar(50)
          N'ABC' , -- NoiDung - nvarchar(50)
          N'DA A' , -- DapAnA - nvarchar(50)
          N'DA B' , -- DapAnB - nvarchar(50)
          N'DA C' , -- DapAnC - nvarchar(50)
          N'DA D' , -- DapAnD - nvarchar(50)
          N'C'  -- DapAnDung - nvarchar(50)
        )

--dethi_cauhoi
INSERT INTO dbo.DETHI_CAUHOI
        ( MaDeThi, MaCauHoi )
VALUES  ( N'DTA001', -- MaDeThi - nvarchar(50)
          N'CH0001'  -- MaCauHoi - nvarchar(50)
          )
INSERT INTO dbo.DETHI_CAUHOI
        ( MaDeThi, MaCauHoi )
VALUES  ( N'DTA001', -- MaDeThi - nvarchar(50)
          N'CH0002'  -- MaCauHoi - nvarchar(50)
          )
INSERT INTO dbo.DETHI_CAUHOI
        ( MaDeThi, MaCauHoi )
VALUES  ( N'DTA002', -- MaDeThi - nvarchar(50)
          N'CH0003'  -- MaCauHoi - nvarchar(50)
          )
INSERT INTO dbo.DETHI_CAUHOI
        ( MaDeThi, MaCauHoi )
VALUES  ( N'DTB002', -- MaDeThi - nvarchar(50)
          N'CH0004'  -- MaCauHoi - nvarchar(50)
          )
INSERT INTO dbo.DETHI_CAUHOI
        ( MaDeThi, MaCauHoi )
VALUES  ( N'DTD001', -- MaDeThi - nvarchar(50)
          N'CH0001'  -- MaCauHoi - nvarchar(50)
          )
INSERT INTO dbo.DETHI_CAUHOI
        ( MaDeThi, MaCauHoi )
VALUES  ( N'DTD001', -- MaDeThi - nvarchar(50)
          N'CH0002'  -- MaCauHoi - nvarchar(50)
          )
--KETQUA
INSERT INTO dbo.KETQUA
        ( MaHocSinh, MaDeThi, MaCauHoi, DapAn )
VALUES  ( N'HS0001', -- MaHocSinh - nvarchar(50)
          N'DTA001', -- MaDeThi - nvarchar(50)
          N'CH0001', -- MaCauHoi - nvarchar(50)
          N'A'  -- DapAn - nvarchar(50)
          )
INSERT INTO dbo.KETQUA
        ( MaHocSinh, MaDeThi, MaCauHoi, DapAn )
VALUES  ( N'HS0001', -- MaHocSinh - nvarchar(50)
          N'DTA001', -- MaDeThi - nvarchar(50)
          N'CH0002', -- MaCauHoi - nvarchar(50)
          N'B'  -- DapAn - nvarchar(50)
          )
INSERT INTO dbo.KETQUA
        ( MaHocSinh, MaDeThi, MaCauHoi, DapAn )
VALUES  ( N'HS0001', -- MaHocSinh - nvarchar(50)
          N'DTA002', -- MaDeThi - nvarchar(50)
          N'CH0003', -- MaCauHoi - nvarchar(50)
          N'C'  -- DapAn - nvarchar(50)
          )
INSERT INTO dbo.KETQUA
        ( MaHocSinh, MaDeThi, MaCauHoi, DapAn )
VALUES  ( N'HS0002', -- MaHocSinh - nvarchar(50)
          N'DTA001', -- MaDeThi - nvarchar(50)
          N'CH0001', -- MaCauHoi - nvarchar(50)
          N'D'  -- DapAn - nvarchar(50)
          )
INSERT INTO dbo.KETQUA
        ( MaHocSinh, MaDeThi, MaCauHoi, DapAn )
VALUES  ( N'HS0002', -- MaHocSinh - nvarchar(50)
          N'DTA001', -- MaDeThi - nvarchar(50)
          N'CH0002', -- MaCauHoi - nvarchar(50)
          N'C'  -- DapAn - nvarchar(50)
          )
INSERT INTO dbo.KETQUA
        ( MaHocSinh, MaDeThi, MaCauHoi, DapAn )
VALUES  ( N'HS0002', -- MaHocSinh - nvarchar(50)
          N'DTA002', -- MaDeThi - nvarchar(50)
          N'CH0003', -- MaCauHoi - nvarchar(50)
          N'B'  -- DapAn - nvarchar(50)
          )
INSERT INTO dbo.KETQUA
        ( MaHocSinh, MaDeThi, MaCauHoi, DapAn )
VALUES  ( N'HS0003', -- MaHocSinh - nvarchar(50)
          N'DTB002', -- MaDeThi - nvarchar(50)
          N'CH0004', -- MaCauHoi - nvarchar(50)
          N'A'  -- DapAn - nvarchar(50)
          )
INSERT INTO dbo.KETQUA
        ( MaHocSinh, MaDeThi, MaCauHoi, DapAn )
VALUES  ( N'HS0004', -- MaHocSinh - nvarchar(50)
          N'DTD001', -- MaDeThi - nvarchar(50)
          N'CH0001', -- MaCauHoi - nvarchar(50)
          N'A'  -- DapAn - nvarchar(50)
          )
INSERT INTO dbo.KETQUA
        ( MaHocSinh, MaDeThi, MaCauHoi, DapAn )
VALUES  ( N'HS0004', -- MaHocSinh - nvarchar(50)
          N'DTD001', -- MaDeThi - nvarchar(50)
          N'CH0002', -- MaCauHoi - nvarchar(50)
          N'B'  -- DapAn - nvarchar(50)
          )

--câu 1a:
go
CREATE VIEW V_ThoiGianThi
AS
	SELECT HOCSINH.MaHocSinh,TenHocSinh,NamSinh,GioiTinh,TenDeThi FROM dbo.HOCSINH INNER  JOIN dbo.KETQUA ON KETQUA.MaHocSinh = HOCSINH.MaHocSinh 
	INNER JOIN dbo.DETHI ON DETHI.MaDeThi = KETQUA.MaDeThi
	WHERE GioiTinh=N'Nu' AND ThoiGianThi > '2017-11-20'
GO
SELECT * FROM dbo.V_ThoiGianThi
--câu 1b
UPDATE dbo.V_ThoiGianThi
SET GioiTinh=NULL
SELECT * FROM dbo.HOCSINH
--CÂU 2a
GO
CREATE PROCEDURE Sp_XoaCauHoi @MaCauHoi NVARCHAR(50)
AS
	
	BEGIN
		DELETE FROM dbo.CAUHOI
		WHERE MaCauHoi=@MaCauHoi
	END

DECLARE @check INT
EXECUTE @check=dbo.Sp_XoaCauHoi @MaCauHoi = N'CHHAHA' -- nvarchar(50)
--CÂU 2B
GO
CREATE PROCEDURE Sp_ThemNoiDungDT @MaDeThi NVARCHAR(50),@MaCauHoi NVARCHAR(50)
AS
	BEGIN
		--kiểm tra @MaDeThi nhập vào đã tồn tại trong bẳng DETHI hay chưa
		   DECLARE @check INT
			SELECT @check=COUNT(*)
			FROM dbo.DETHI
			WHERE MaDeThi=@MaDeThi
			IF(@check=0)
			BEGIN
				PRINT N'@MaDeThi Nhập vào chưa tồn tại trong bảng DETHI KHông thể chèn!!'
			 	GOTO KETTHUC
			END
		--kiểm tra @MaCauHoi nhập vào đã tồn tại trong bảng CAUHOI hay chưa
			SELECT @check=COUNT(*)
			FROM dbo.CAUHOI
			WHERE MaCauHoi=@MaCauHoi
			IF(@check=0)
			BEGIN
				PRINT N'@MaCauHoi Nhập vào chưa tồn tại trong bảng CAUHOI KHông thể chèn!!'
			 	GOTO KETTHUC
			END
			INSERT INTO dbo.DETHI_CAUHOI
			        ( MaDeThi, MaCauHoi )
			VALUES  ( @MaDeThi, -- MaDeThi - nvarchar(50)
			          @MaCauHoi  -- MaCauHoi - nvarchar(50)
			          )
		 KETTHUC:
	END
	--test
	DECLARE @test INT
	EXECUTE @test=dbo.Sp_ThemNoiDungDT @MaDeThi = N'DTHAHA', -- nvarchar(50)
	    @MaCauHoi = N'CHHAHA' -- nvarchar(50)
-- câu 4
GO
CREATE FUNCTION func_Dem1()
RETURNS INT
AS
	BEGIN
	    DECLARE @dem INT
		SELECT @dem=COUNT(MaDeThi) 
		FROM dbo.DETHI
		WHERE TrangThai=N'Chua phat hanh' AND YEAR(ThoiGianThi) BETWEEN 2016 AND 2017
		RETURN @dem 
	END
GO
SELECT dbo.func_Dem1()
go
--câu 5
CREATE PROCEDURE Sp_XoaDeThi
AS
 BEGIN
	CREATE TABLE BangTam(
		MDThii NVARCHAR(50)
	)
	INSERT INTO dbo.BangTam
	        (MDThii)
	SELECT dbo.DETHI.MaDeThi FROM dbo.DETHI INNER JOIN dbo.DETHI_CAUHOI ON DETHI_CAUHOI.MaDeThi = DETHI.MaDeThi
	WHERE (YEAR(ThoiGianThi) BETWEEN 2010 AND 2018) AND TrangThai=N'Da phat hanh'
	
	DELETE FROM dbo.DETHI
	WHERE MaDeThi IN (SELECT MDThii 
					FROM dbo.BangTam)
	DELETE FROM dbo.DETHI_CAUHOI
	WHERE MaDeThi IN (SELECT MDThii
					FROM dbo.BangTam)

 END
 -- chưa chạy
 DECLARE @n INT
 EXECUTE @n=dbo.Sp_XoaDeThi