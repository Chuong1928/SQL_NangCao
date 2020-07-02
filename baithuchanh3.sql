--ThiSatHachNangCao
CREATE TABLE KHUVUC
(
	MaKV NVARCHAR(100) NOT NULL,
	TenKhuVuc NVARCHAR(100) NOT NULL,
	MoTa NVARCHAR(100) NOT NULL
	CONSTRAINT PK_KHUVUC PRIMARY KEY CLUSTERED
	(
		MaKV ASC
	) ON [PRIMARY]
)
ON [PRIMARY]
GO


CREATE TABLE LOAIXE
(
	MaLX NVARCHAR(100) NOT NULL,
	MaKV NVARCHAR(100) NOT NULL,
	TenLX NVARCHAR(100) NOT NULL,
	MoTa NVARCHAR(100) NOT NULL
	CONSTRAINT PK_LOAIXE PRIMARY KEY CLUSTERED
	(
		MaLX ASC
	) ON [PRIMARY]
)
ON [PRIMARY]
GO

CREATE TABLE DOXE
(
	MaDX NVARCHAR(100) NOT NULL,
	MaLX NVARCHAR(100) NOT NULL,
	MaNV NVARCHAR(100) NOT NULL,
	MaPhi NVARCHAR(100) NOT NULL,
	BienSoXe NVARCHAR(100) NOT NULL,
	TGVao DATETIME NOT NULL,
	TGRa DATETIME NOT NULL
	CONSTRAINT PK_DOXE PRIMARY KEY CLUSTERED
	(
		MaDX ASC
	) ON [PRIMARY]
)
ON [PRIMARY]
GO

CREATE TABLE NHANVIEN
(
	MaNV NVARCHAR(100) NOT NULL,
	TenNV NVARCHAR(100) NOT NULL,
	NgaySinh DATE NOT NULL,
	DiaChi NVARCHAR(100) NOT NULL,
	SoDT NVARCHAR(100) NOT NULL
	CONSTRAINT PK_NHANVIEN PRIMARY KEY CLUSTERED
	(
		MaNV ASC
	) ON [PRIMARY]
)
ON [PRIMARY]
GO

CREATE TABLE PHIDOXE
(
	MaPhi NVARCHAR(100) NOT NULL,
	TGbatdau TIME NOT NULL,
	TGkethuc TIME NOT NULL,
	MucPhi MONEY NOT NULL,
	MoTa NVARCHAR(100)
	CONSTRAINT PK_PHIDOXE PRIMARY KEY CLUSTERED
	(
		MaPhi ASC
	) ON [PRIMARY]
)
ON [PRIMARY]
GO


ALTER TABLE dbo.DOXE WITH CHECK ADD CONSTRAINT FK_DOXE_LOAIXE
FOREIGN KEY (MaLX) REFERENCES dbo.LOAIXE (MaLX)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE dbo.DOXE CHECK CONSTRAINT FK_DOXE_LOAIXE
GO


ALTER TABLE dbo.DOXE WITH CHECK ADD CONSTRAINT FK_DOXE_NHANVIEN
FOREIGN KEY (MaNV) REFERENCES dbo.NHANVIEN (MaNV)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE dbo.DOXE CHECK CONSTRAINT FK_DOXE_NHANVIEN
GO


ALTER TABLE dbo.DOXE WITH CHECK ADD CONSTRAINT FK_DOXE_PHIDOXE
FOREIGN KEY (MaPhi) REFERENCES dbo.PHIDOXE (MaPhi)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE dbo.DOXE CHECK CONSTRAINT FK_DOXE_PHIDOXE
GO


ALTER TABLE dbo.LOAIXE WITH CHECK ADD CONSTRAINT FK_LOAIXE_KHUVUC
FOREIGN KEY (MaKV) REFERENCES dbo.KHUVUC (MaKV)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE dbo.LOAIXE CHECK CONSTRAINT FK_LOAIXE_KHUVUC
GO


SET NOCOUNT ON
-------------------Khu vực-----------------------
INSERT dbo.KHUVUC
        ( MaKV, TenKhuVuc, MoTa )
VALUES  ( N'KV02', -- MaKV - nvarchar(100)
          N'Hai bánh', -- TenKhuVuc - nvarchar(100)
          N'Dành cho các loại xe hai bánh'  -- MoTa - nvarchar(100)
          )
INSERT dbo.KHUVUC
        ( MaKV, TenKhuVuc, MoTa )
VALUES  ( N'KV02', -- MaKV - nvarchar(100)
          N'Bốn bánh', -- TenKhuVuc - nvarchar(100)
          N'Dành cho các loại xe bốn bánh'  -- MoTa - nvarchar(100)
          )
--------------------Loại xe-----------------------
INSERT dbo.LOAIXE
        ( MaLX, MaKV, TenLX, MoTa )
VALUES  ( N'LX01', -- MaLX - nvarchar(100)
          N'KV01', -- MaKV - nvarchar(100)
          N'Xe hai bánh không có động cơ', -- TenLX - nvarchar(100)
          N'Thuộc dòng xe đạp'  -- MoTa - nvarchar(100)
          )
INSERT dbo.LOAIXE
        ( MaLX, MaKV, TenLX, MoTa )
VALUES  ( N'LX02', -- MaLX - nvarchar(100)
          N'KV01', -- MaKV - nvarchar(100)
          N'Xe hai bánh có động cơ', -- TenLX - nvarchar(100)
          N'Thuộc dòng xe máy'  -- MoTa - nvarchar(100)
          )
INSERT dbo.LOAIXE
        ( MaLX, MaKV, TenLX, MoTa )
VALUES  ( N'LX03', -- MaLX - nvarchar(100)
          N'KV02', -- MaKV - nvarchar(100)
          N'Xe bốn bánh', -- TenLX - nvarchar(100)
          N'Thuộc dòng xe bốn bánh'  -- MoTa - nvarchar(100)
          )
--------------------Nhân viên-----------------------
INSERT dbo.NHANVIEN
        ( MaNV, TenNV, NgaySinh, DiaChi, SoDT )
VALUES  ( N'NV001', -- MaNV - nvarchar(100)
          N'Nguyễn Văn Nam', -- TenNV - nvarchar(100)
          CAST('1988/11/10' AS DATE), -- NgaySinh - date
          N'Đà Nẵng', -- DiaChi - nvarchar(100)
          N'0905666222'  -- SoDT - nvarchar(100)
          )
INSERT dbo.NHANVIEN
        ( MaNV, TenNV, NgaySinh, DiaChi, SoDT )
VALUES  ( N'NV002', -- MaNV - nvarchar(100)
          N'Hoàng Quyên', -- TenNV - nvarchar(100)
          CAST('1995/02/21' AS DATE), -- NgaySinh - date
          N'Đà Nẵng', -- DiaChi - nvarchar(100)
          N'0905666223'  -- SoDT - nvarchar(100)
          )
INSERT dbo.NHANVIEN
        ( MaNV, TenNV, NgaySinh, DiaChi, SoDT )
VALUES  ( N'NV003', -- MaNV - nvarchar(100)
          N'Nguyễn Anh Vân', -- TenNV - nvarchar(100)
          CAST('1992/05/03' AS DATE), -- NgaySinh - date
          N'Đà Nẵng', -- DiaChi - nvarchar(100)
          N'0905666224'  -- SoDT - nvarchar(100)
          )
----------------------Phí đỗ xe-----------------------
INSERT dbo.PHIDOXE
        ( MaPhi ,
          TGbatdau ,
          TGkethuc ,
          MucPhi ,
          MoTa
        )
VALUES  ( N'P01' , -- MaPhi - nvarchar(100)
          CAST('7:00' AS TIME), -- TGbatdau - time
          CAST('23:00' AS TIME) , -- TGkethuc - time
          1000, -- MucPhi - money
          N'Xe gắn máy, xe đạp,ban ngày'  -- MoTa - nvarchar(100)
        )
INSERT dbo.PHIDOXE
        ( MaPhi ,
          TGbatdau ,
          TGkethuc ,
          MucPhi ,
          MoTa
        )
VALUES  ( N'P02' , -- MaPhi - nvarchar(100)
          CAST('7:00' AS TIME) , -- TGbatdau - time
          CAST('23:00' AS TIME) , -- TGkethuc - time
          5000 , -- MucPhi - money
          N'Xe ô tô, ban ngày'  -- MoTa - nvarchar(100)
        )
INSERT dbo.PHIDOXE
        ( MaPhi ,
          TGbatdau ,
          TGkethuc ,
          MucPhi ,
          MoTa
        )
VALUES  ( N'P03' , -- MaPhi - nvarchar(100)
          CAST('23:00' AS TIME) , -- TGbatdau - time
          CAST('7:00' AS TIME) , -- TGkethuc - time
          3000 , -- MucPhi - money
          N'Xe gắn máy, xe đạp, ban đêm'  -- MoTa - nvarchar(100)
        )
INSERT dbo.PHIDOXE
        ( MaPhi ,
          TGbatdau ,
          TGkethuc ,
          MucPhi ,
          MoTa
        )
VALUES  ( N'P04' , -- MaPhi - nvarchar(100)
		  CAST('23:00' AS TIME) , -- TGbatdau - time
          CAST('7:00' AS TIME) , -- TGkethuc - time
          10000 , -- MucPhi - money
          N'Xe ô tô, ban đêm'  -- MoTa - nvarchar(100)
        ) 
----------------------Đỗ xe------------------------------------
INSERT dbo.DOXE
        ( MaDX ,
          MaLX ,
          MaNV ,
          MaPhi ,
          BienSoXe ,
          TGVao ,
          TGRa
        )
VALUES  ( N'DX001' , -- MaDX - nvarchar(100)
          N'LX03' , -- MaLX - nvarchar(100)
          N'NV001' , -- MaNV - nvarchar(100)
          N'P01' , -- MaPhi - nvarchar(100)
          N'43H-03941' , -- BienSoXe - nvarchar(100)
          CAST('2015/11/07 7:00' AS DATETIME) , -- TGVao - datetime
          CAST('2015/11/07 17:00' AS DATETIME)  -- TGRa - datetime
        )
INSERT dbo.DOXE
        ( MaDX ,
          MaLX ,
          MaNV ,
          MaPhi ,
          BienSoXe ,
          TGVao ,
          TGRa
        )
VALUES  ( N'DX002' , -- MaDX - nvarchar(100)
          N'LX01' , -- MaLX - nvarchar(100)
          N'NV002' , -- MaNV - nvarchar(100)
          N'P02' , -- MaPhi - nvarchar(100)
          N'487' , -- BienSoXe - nvarchar(100)
          CAST('2015/11/20 9:00' AS DATETIME) , -- TGVao - datetime
          CAST('2015/11/20 10:00' AS DATETIME)  -- TGRa - datetime
        )
INSERT dbo.DOXE
        ( MaDX ,
          MaLX ,
          MaNV ,
          MaPhi ,
          BienSoXe ,
          TGVao ,
          TGRa
        )
VALUES  ( N'DX003' , -- MaDX - nvarchar(100)
          N'LX03' , -- MaLX - nvarchar(100)
          N'NV001' , -- MaNV - nvarchar(100)
          N'P04' , -- MaPhi - nvarchar(100)
          N'75U-36584' , -- BienSoXe - nvarchar(100)
          CAST('2015/12/21 9:00' AS DATETIME) , -- TGVao - datetime
          CAST('2015/12/27 15:00' AS DATETIME)  -- TGRa - datetime
        )

SET NOCOUNT OFF

/* CÂU 3b CSDL ThiSatHach*/
/* 3a thực hiện đăng ký mới mỗi lượt đỗ xe thì hiển thị tổng số luowth đỗ xe của tất cả các loại xe cần đỗ*/

CREATE TRIGGER cau1 ON dbo.DOXE
AFTER INSERT
AS
	BEGIN
		DECLARE @MALX NVARCHAR(100)
		SELECT @MALX=MALX FROM Inserted
		DECLARE @tong INT
		SELECT @tong=COUNT(*)
		FROM dbo.DOXE
		WHERE MaLX=@MALX
		BEGIN
			PRINT N'Tổng số lượt đỗ xe cùng loại xe cần đỗ '+ CAST(@tong AS NVARCHAR(5))
		END
		
	END
GO
/*test*/
INSERT INTO dbo.DOXE
        ( MaDX ,
          MaLX ,
          MaNV ,
          MaPhi ,
          BienSoXe ,
          TGVao ,
          TGRa
        )
VALUES  ( N'DX02' , -- MaDX - nvarchar(100)
          N'LX03' , -- MaLX - nvarchar(100)
          N'NV001' , -- MaNV - nvarchar(100)
          N'P04' , -- MaPhi - nvarchar(100)
          N'487' , -- BienSoXe - nvarchar(100)
          '2014-11-30 07:00' , -- TGVao - datetime
          '2014-12-15 07:00'  -- TGRa - datetime
        )
SELECT * FROM dbo.DOXE
go
/* câu 3b khi cập nhật thời gian vào và thời gian ra của một lượt đỗ xe , kiểm tra xem thời gian cập nhật đó
có phù hợp hay không ( thời gian ra phải lơn hơn thời gian vào ít nhẩ 15 phút ) . nếu dữ liệu hợp lệ thì cho 
phép cập nhật nếu không thì phải hiển thị thông báo" thời gian vào ohari lớn hơn thời gian ra ít nhất 15 "
ALTER TRIGGER Trigger_2 ON dbo.DANGKYCUNGCAP
AFTER UPDATE
AS
BEGIN
	DECLARE @sodonghople INT
	SELECT @sodonghople=COUNT(*) FROM Inserted 
	WHERE Inserted.NgayBatDauCungCap>Inserted.NgayKetThucCungCap
	IF(@sodonghople>0)
		BEGIN
			PRINT N'Ngày kết thúc cung cấp phải lớn hơn ngày bắt đầu cung cấp';
			ROLLBACK TRANSACTION
		END
	 DECLARE @ngay INT
	 SELECT @ngay= DATEDIFF(YEAR,Inserted.NgayBatDauCungCap,Inserted.NgayKetThucCungCap) FROM  Inserted
	 IF(@ngay>4)
		BEGIN
			PRINT N'phải nhỏ hơn 4 năm'
			ROLLBACK TRANSACTION
		END
END*/
CREATE TRIGGER cau2 ON dbo.DOXE
AFTER UPDATE
AS
	 BEGIN
	     DECLARE @hople INT
		 SELECT @hople=DATEDIFF(MINUTE,Inserted.TGVao,Inserted.TGRa) FROM Inserted
		 IF(@hople>15)
			BEGIN
			    PRINT N'Lớn Hơn 15 Phút !! Không thể chèn!!'
				ROLLBACK TRANSACTION
			END
	 END

	UPDATE dbo.DOXE SET TGVao='2014-11-30 7:00',TGRa='2014-11-30 7:30'
	WHERE MaDX='DX02'
	GO
    SELECT * FROM dbo.DOXE

--câu 3  viết trigger_1 thực hiện đăng ký mới một lượt đỗ xe mới thì hiển thị tổng số lượt đỗ xe của tất cả các
--xe cùng loại với xe cần đỗ
GO
SELECT * FROM dbo.DOXE INNER JOIN dbo.LoaiXe ON LoaiXe.MaLX = DOXE.MaLX
GO

CREATE TRIGGER cau3 ON dbo.DOXE
AFTER INSERT
AS
	BEGIN
		DECLARE @dem INT
		DECLARE @malx CHAR(4)
		SELECT @malx=  Inserted.MaLX FROM Inserted
		SELECT @dem=COUNT(*) FROM dbo.DOXE WHERE MaLX=@malx
		PRINT N'Tổng số lượt đỗ xe cỉa loại xe vừa nhập là '+CAST(@dem AS VARCHAR(5))
	END