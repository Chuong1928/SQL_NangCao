--tạo bảng 
CREATE TABLE NhaCungCap 
(
	MaNhaCC NVARCHAR(50) PRIMARY KEY,
	TenNhaCC NVARCHAR(50)  NULL,
	DiaChi NVARCHAR(50)  NULL,
	SoDT NVARCHAR(50)  NULL,
	MaSoThue NVARCHAR(50)  NULL
) 
go
CREATE TABLE LoaiDichVu
(
	MaLoaiDV NVARCHAR(50) PRIMARY KEY,
	TenLoaiDV NVARCHAR(50) NULL

)
go
CREATE TABLE MucPhi
(
	MaMP NVARCHAR(50) PRIMARY KEY,
	DonGia NVARCHAR(50) NULL CHECK(DonGia>=0),
	MoTa NVARCHAR(50)  NULL,
	
)
GO
CREATE TABLE DongXe
(
	KyHieuDongXe NVARCHAR(50) PRIMARY KEY,
	HangXe NVARCHAR(50) NULL,
	SoChoNgoi int NULL CHECK(SoChoNgoi BETWEEN 2 AND 24)
)
GO

CREATE TABLE DangKyCungCap
(
	MaDKCC NVARCHAR(50)  PRIMARY KEY,
	MaNhaCC NVARCHAR(50) NOT NULL,
	MaLoaiDV NVARCHAR(50) NOT NULL,
	KyHieuDongXe NVARCHAR(50) NOT NULL,
	MaMP NVARCHAR(50) NOT NULL,
	NgayBatDauCungCap NVARCHAR(50) NULL,
	NgayKetThucCung NVARCHAR(50) NULL,
	SoLuongXeDangKy NVARCHAR(50) null
)
--khóa ngoài diagram
ALTER TABLE dbo.DangKyCungCap
ADD CONSTRAINT FK_DKCC_NCC
FOREIGN KEY (MaNhaCC)
REFERENCES dbo.NhaCungCap(MaNhaCC)
ON UPDATE CASCADE
ON DELETE NO ACTION

ALTER TABLE dbo.DangKyCungCap
ADD CONSTRAINT FK_DKCC_LOAIDV
FOREIGN KEY (MaLoaiDV)
REFERENCES dbo.LoaiDichVu(MaLoaiDV)
ON UPDATE CASCADE
ON DELETE NO ACTION

ALTER TABLE dbo.DangKyCungCap
ADD CONSTRAINT FK_DKCC_DONGXE
FOREIGN KEY (KyHieuDongXe)
REFERENCES dbo.DongXe(KyHieuDongXe)
ON UPDATE CASCADE
ON DELETE NO ACTION

ALTER TABLE dbo.DangKyCungCap
ADD CONSTRAINT FK_DKCC_MP
FOREIGN KEY (MaMP)
REFERENCES dbo.MucPhi(MaMP)
ON UPDATE CASCADE
ON DELETE NO ACTION


--chèn dữ liệu
--nhà cung cấp
INSERT INTO dbo.NhaCungCap
(
    MaNhaCC,
    TenNhaCC,
    DiaChi,
    SoDT,
    MaSoThue
)
VALUES
(   N'CC01', -- MaNhaCC - nvarchar(50)
    N'Công ty ATN', -- TenNhaCC - nvarchar(50)
    N'22 Lê lợi', -- DiaChi - nvarchar(50)
    N'0543854789', -- SoDT - nvarchar(50)
    N'301-214-547'  -- MaSoThue - nvarchar(50)
    )
	INSERT INTO dbo.NhaCungCap
(
    MaNhaCC,
    TenNhaCC,
    DiaChi,
    SoDT,
    MaSoThue
)
VALUES
(   N'CC02', -- MaNhaCC - nvarchar(50)
    N'ông Lê Chi Hải', -- TenNhaCC - nvarchar(50)
    N'101 trần phú', -- DiaChi - nvarchar(50)
    N'0543826987', -- SoDT - nvarchar(50)
    N'301-558-587'  -- MaSoThue - nvarchar(50)
    )
INSERT INTO dbo.NhaCungCap
(
    MaNhaCC,
    TenNhaCC,
    DiaChi,
    SoDT,
    MaSoThue
)
VALUES
(   N'CC03', -- MaNhaCC - nvarchar(50)
    N'Công ty AMES', -- TenNhaCC - nvarchar(50)
    N'47 Hải Phòng', -- DiaChi - nvarchar(50)
    N'0543814587', -- SoDT - nvarchar(50)
    N'301-580-366'  -- MaSoThue - nvarchar(50)
    )
	--loại dịch vụ
INSERT INTO dbo.LoaiDichVu
(
    MaLoaiDV,
    TenLoaiDV
)
VALUES
(   N'DV01', -- MaLoaiDV - nvarchar(50)
    N'Dịch Vụ thuê xe tự lái'  -- TenLoaiDV - nvarchar(50)
    )
	
	INSERT INTO dbo.LoaiDichVu
(
    MaLoaiDV,
    TenLoaiDV
)
VALUES
(   N'DV02', -- MaLoaiDV - nvarchar(50)
    N'Cho thuê xe theo hợp đồng'  -- TenLoaiDV - nvarchar(50)
    )

	--dòng xe
 INSERT INTO dbo.DongXe
 (
     KyHieuDongXe,
     HangXe,
     SoChoNgoi
 )
 VALUES
 (   N'Vios', -- KyHieuDongXe - nvarchar(50)
     N'Toyota', -- HangXe - nvarchar(50)
     5    -- SoChoNgoi - int
     )

	INSERT INTO dbo.DongXe
 (
     KyHieuDongXe,
     HangXe,
     SoChoNgoi
 )
 VALUES
 (   N'Grand-i10', -- KyHieuDongXe - nvarchar(50)
     N'Huyndai', -- HangXe - nvarchar(50)
     4   -- SoChoNgoi - int
     )
INSERT INTO dbo.DongXe
 (
     KyHieuDongXe,
     HangXe,
     SoChoNgoi
 )
 VALUES
 (   N'Forte', -- KyHieuDongXe - nvarchar(50)
     N'KIA', -- HangXe - nvarchar(50)
     7   -- SoChoNgoi - int
     )

INSERT INTO dbo.DongXe
 (
     KyHieuDongXe,
     HangXe,
     SoChoNgoi
 )
 VALUES
 (   N'Hieace', -- KyHieuDongXe - nvarchar(50)
     N'Toyota', -- HangXe - nvarchar(50)
     16   -- SoChoNgoi - int
     )

--mức phí
INSERT INTO dbo.MucPhi
(
    MaMP,
    DonGia,
    MoTa
)
VALUES
(   N'MP1', -- MaMP - nvarchar(50)
    N'10000', -- DonGia - nvarchar(50)
    N'áp dụng từ 1/2016'  -- MoTa - nvarchar(50)
    )

INSERT INTO dbo.MucPhi
(
    MaMP,
    DonGia,
    MoTa
)
VALUES
(   N'MP2', -- MaMP - nvarchar(50)
    N'12000', -- DonGia - nvarchar(50)
    N'áp dụng từ 4/2016'  -- MoTa - nvarchar(50)
    )

INSERT INTO dbo.MucPhi
(
    MaMP,
    DonGia,
    MoTa
)
VALUES
(   N'MP3', -- MaMP - nvarchar(50)
    N'15000', -- DonGia - nvarchar(50)
    N'áp dụng từ 4/2016'  -- MoTa - nvarchar(50)
    )
	--dangkycc
INSERT INTO dbo.DangKyCungCap
(
    MaDKCC,
    MaNhaCC,
    MaLoaiDV,
    KyHieuDongXe,
    MaMP,
    NgayBatDauCungCap,
    NgayKetThucCung,
    SoLuongXeDangKy
)
VALUES
(   N'D01', -- MaDKCC - nvarchar(50)
    N'CC01', -- MaNhaCC - nvarchar(50)
    N'DV01', -- MaLoaiDV - nvarchar(50)
    N'Vios', -- KyHieuDongXe - nvarchar(50)
    N'MP1', -- MaMP - nvarchar(50)
    N'2016-01-15', -- NgayBatDauCungCap - nvarchar(50)
    N'2016-12-31', -- NgayKetThucCung - nvarchar(50)
    N'10'  -- SoLuongXeDangKy - nvarchar(50)
    )

	INSERT INTO dbo.DangKyCungCap
(
    MaDKCC,
    MaNhaCC,
    MaLoaiDV,
    KyHieuDongXe,
    MaMP,
    NgayBatDauCungCap,
    NgayKetThucCung,
    SoLuongXeDangKy
)
VALUES
(   N'D02', -- MaDKCC - nvarchar(50)
    N'CC02', -- MaNhaCC - nvarchar(50)
    N'DV01', -- MaLoaiDV - nvarchar(50)
    N'Grand-i10', -- KyHieuDongXe - nvarchar(50)
    N'MP2', -- MaMP - nvarchar(50)
    N'2016-03-01', -- NgayBatDauCungCap - nvarchar(50)
    N'2016-12-31', -- NgayKetThucCung - nvarchar(50)
    N'5'  -- SoLuongXeDangKy - nvarchar(50)
    )

	INSERT INTO dbo.DangKyCungCap
(
    MaDKCC,
    MaNhaCC,
    MaLoaiDV,
    KyHieuDongXe,
    MaMP,
    NgayBatDauCungCap,
    NgayKetThucCung,
    SoLuongXeDangKy
)
VALUES
(   N'D03', -- MaDKCC - nvarchar(50)
    N'CC02', -- MaNhaCC - nvarchar(50)
    N'DV01', -- MaLoaiDV - nvarchar(50)
    N'Forte', -- KyHieuDongXe - nvarchar(50)
    N'MP3', -- MaMP - nvarchar(50)
    N'2016-03-01', -- NgayBatDauCungCap - nvarchar(50)
    N'2017-12-31', -- NgayKetThucCung - nvarchar(50)
    N'10'  -- SoLuongXeDangKy - nvarchar(50)
    )
	INSERT INTO dbo.DangKyCungCap
(
    MaDKCC,
    MaNhaCC,
    MaLoaiDV,
    KyHieuDongXe,
    MaMP,
    NgayBatDauCungCap,
    NgayKetThucCung,
    SoLuongXeDangKy
)
VALUES
(   N'D04', -- MaDKCC - nvarchar(50)
    N'CC03', -- MaNhaCC - nvarchar(50)
    N'DV02', -- MaLoaiDV - nvarchar(50)
    N'Hieace', -- KyHieuDongXe - nvarchar(50)
    N'MP3', -- MaMP - nvarchar(50)
    N'2015-01-01', -- NgayBatDauCungCap - nvarchar(50)
    N'2018-12-31', -- NgayKetThucCung - nvarchar(50)
    N'12'  -- SoLuongXeDangKy - nvarchar(50)
    )
	INSERT INTO dbo.DangKyCungCap
(
    MaDKCC,
    MaNhaCC,
    MaLoaiDV,
    KyHieuDongXe,
    MaMP,
    NgayBatDauCungCap,
    NgayKetThucCung,
    SoLuongXeDangKy
)
VALUES
(   N'D05', -- MaDKCC - nvarchar(50)
    N'CC03', -- MaNhaCC - nvarchar(50)
    N'DV01', -- MaLoaiDV - nvarchar(50)
    N'Vios', -- KyHieuDongXe - nvarchar(50)
    N'MP1', -- MaMP - nvarchar(50)
    N'2016-01-01', -- NgayBatDauCungCap - nvarchar(50)
    N'2016-12-31', -- NgayKetThucCung - nvarchar(50)
    N'4'  -- SoLuongXeDangKy - nvarchar(50)
    )
	go
--truy vấn
/*câu 1:	Câu 1: Thực hiện yêu cầu sau:
a.	Tạo một khung nhìn có tên là View_NhaCC_Vios để lấy được thông tin của tất cả nhà cung cấp có đăng ký dịch vụ 
dùng dòng xe Vios từ ngày 01/01/2016 trở về sau.
b.	Thông qua khung nhìn trên, cập nhật lại địa chỉ của các nhà cung cấp trong phạm vi của khung nhìn thành ‘Toyota Huế’
*/
--1a
	CREATE VIEW View_NhaCC_Vios
	AS 
		SELECT NhaCungCap.MaNhaCC,TenNhaCC,DiaChi,SoDT,SoLuongXeDangKy
		 FROM dbo.NhaCungCap INNER JOIN dbo.DangKyCungCap ON DangKyCungCap.MaNhaCC = NhaCungCap.MaNhaCC
		WHERE KyHieuDongXe=N'Vios' AND NgayBatDauCungCap>'2016-01-01' 
GO
	SELECT * FROM dbo.View_NhaCC_Vios
--1b
UPDATE dbo.View_NhaCC_Vios
SET DiaChi=N'Toyota Huế'
go
/*
câu 2:Câu 2: Tạo các Stored Procedure sau:
a.	proc_MucPhi_DeleteUnUsed: Dùng để xóa khỏi bảng MucPhi tất cả những mức phí hiện không được sử dụng.
b.	proc_DangKyCungCap_Insert: Dùng để bổ sung thêm 1 bản ghi mới vào bảng DangKyCungCap. Thủ tục này phải
 kiểm tra được tính đúng đắn và toàn vẹn của dữ liệu khi bổ sung.
 
*/
--2a
CREATE PROCEDURE MucPhi_DeleteUnUsed 
AS
	DELETE FROM dbo.MucPhi
	WHERE MaMP NOT IN  (SELECT MaMP FROM dbo.DangKyCungCap)

DECLARE @a INT
EXECUTE @a = dbo.MucPhi_DeleteUnUsed
SELECT @a
	go
--2b

CREATE PROCEDURE DangKyCungCap_Insert @MaDKCC NVARCHAR(50),@MaNCC NVARCHAR(50),@MaLDV NVARCHAR(50),@kyhieudongxe NVARCHAR(50),@MaMP NVARCHAR(50),
@NgayBatDauCungCap NVARCHAR(50), @NgayKetThucCungCap NVARCHAR(50),@SoLuongXeDangKy NVARCHAR(50)
AS
	BEGIN
	    DECLARE @ncc INT
		--kiem tra MaDKCC nếu MaDKCC nhập vào đã tồn tại trong bảng DKCC thì mới được chèn vào
		SELECT @ncc=COUNT(*)
		FROM dbo.DangKyCungCap
		WHERE @MaDKCC=@MaDKCC
		IF(@ncc>0)
			BEGIN
				PRINT N'Mã Đăng Ký Đã Tồn Tại Không Thể Chèn !!'
			 	GOTO KETTHUC
			END
			--kiem tra dongxe nếu dòng xe đã tồn tại ở bảng dòng xe thì mới được phép đưa vào bảng DKCC
		SELECT @ncc=    COUNT(*)
		FROM dbo.DongXe
		WHERE KyHieuDongXe=@kyhieudongxe
				IF(@ncc=0)
					BEGIN
						PRINT N'Chưa Tồn Tại Ký Hiệu Dòng Xe KHông thể chèn !!'
						GOTO KETTHUC
					END
				
			--kiểm tra MaDV nếu MaDV nhập vào tồn tại trong bảng MaDV thì mới được quyền insert vào bảng DKCC
			SELECT @ncc=COUNT(*)
			FROM dbo.LoaiDichVu
			WHERE MaLoaiDV=@MaLDV
				IF(@ncc=0)
					BEGIN
						PRINT N'Mã Loại Dịch Vụ Chưa Tồn Tại Không Thể Chèn !'
						GOTO KETTHUC
					END
			-- kiểm tra mã mức phí nếu mã mức phí nhập vào tồn tại trong bảng thì mới được chèn vào bảng DKCC
			SELECT @ncc=COUNT(*)
			FROM dbo.MucPhi
			WHERE MaMP=@MaMP
			IF(@ncc=0)
				BEGIN 
					PRINT N'Mã MP Chưa Tồn Tại KHông thể chèn !!'
					GOTO KETTHUC
				END
				
			--kiểm tra mã nhà cung cấp nhập vào nếu nó tồn tại trong bảng nhà cc thì mới được phép chèn vào DKCC
			SELECT @ncc=COUNT(*)
			FROM dbo.NhaCungCap
			WHERE MaNhaCC=@MaNCC
				IF(@ncc=0)
				BEGIN 
					PRINT N'Mã Nhà Cung Cấp Chưa Tồn tại '
					GOTO KETTHUC
				END
		--chèn sau khi thỏa mã điều kiện
	INSERT INTO dbo.DangKyCungCap
	(
	    MaDKCC,
	    MaNhaCC,
	    MaLoaiDV,
	    KyHieuDongXe,
	    MaMP,
	    NgayBatDauCungCap,
	    NgayKetThucCung,
	    SoLuongXeDangKy
	)
	VALUES
	(  @MaDKCC,@MaNCC,@MaLDV,@kyhieudongxe,@MaMP,@NgayBatDauCungCap,@NgayKetThucCungCap,@SoLuongXeDangKy
	    )
		KETTHUC:
	END
	GO

DECLARE @test INT
EXECUTE @test = dbo.DangKyCungCap_Insert @MaDKCC = N'D01',             -- nvarchar(50)
                                         @MaNCC = N'CC01',              -- nvarchar(50)
                                         @MaLDV = N'DV01',              -- nvarchar(50)
                                         @kyhieudongxe = N'Forte',       -- nvarchar(50)
                                         @MaMP = N'MP1',               -- nvarchar(50)
                                         @NgayBatDauCungCap = N'2019-01-01',  -- nvarchar(50)
                                         @NgayKetThucCungCap = N'2020-01-01', -- nvarchar(50)
                                         @SoLuongXeDangKy = N'20'     -- nvarchar(50)

go
/*
câu 3:Câu 3: Viết trg_DangKyCungCap_Update cho bảng DangKyCungCap để khi cập nhật giá trị của cột NgayKetThucCungCap, 
cần kiểm tra xem thời gian cập nhật có phù hợp với qui định hay không (biết rằng, qui định là mỗi một dịch vụ khi đăng 
ký phải hoạt động ít nhất 1 năm). Nếu dữ liệu không hợp lệ thì không cho phép cập nhật
*/

/*
câu 4:Câu 4: Tạo  các hàm để thực hiện các yêu cầu sau:
a.	func_DemXeChoThue (@MucPhi): Đếm tổng số lượng xe đã được đăng ký cho thuê với mức phí là @MucPhi VNĐ/km. (1 điểm)			
b.	func_TimXe(@SoChoNgoi, @NgayCanThueXe): Để tìm kiếm thông tin về các nhà cung cấp, loại xe và mức phí của những xe có 
số chỗ ngồi là @SoChoNgoi và có đăng ký cung cấp dịch vụ vào thời điểm @NgayCanThueXe
*/
SELECT * FROM dbo.DongXe
SELECT * FROM dbo.DangKyCungCap
SELECT * FROM dbo.DangKyCungCap INNER JOIN dbo.MucPhi ON MucPhi.MaMP = DangKyCungCap.MaMP 
--câu 4a
	CREATE FUNCTION  func_DemXeChoThue(@Mucphi NVARCHAR(50))
	RETURNS INT
	AS
		BEGIN
			DECLARE @soluong INT
			SELECT @soluong =SUM(SoLuongXeDangKy)
			FROM dbo.DangKyCungCap INNER JOIN dbo.MucPhi ON MucPhi.MaMP = DangKyCungCap.MaMP
			WHERE DonGia=@Mucphi
			RETURN @soluong
		END
GO
SELECT dbo.func_DemXeChoThue('10000')
SELECT * FROM dbo.MucPhi
--câu 4b
GO
	CREATE FUNCTION func_TimXe(@SoChoNgoi NVARCHAR(50), @NgayCanThueXe NVARCHAR(50))
	RETURNS TABLE RETURN
	SELECT DangKyCungCap.MaNhaCC,TenNhaCC,DiaChi,SoDT,dbo.DongXe.KyHieuDongXe,dbo.MucPhi.DonGia
	FROM dbo.NhaCungCap INNER JOIN dbo.DangKyCungCap ON DangKyCungCap.MaNhaCC = NhaCungCap.MaNhaCC INNER JOIN
	dbo.MucPhi ON MucPhi.MaMP = DangKyCungCap.MaMP INNER JOIN dbo.DongXe ON DongXe.KyHieuDongXe = DangKyCungCap.KyHieuDongXe
	WHERE SoChoNgoi=@SoChoNgoi AND (@NgayCanThueXe BETWEEN NgayBatDauCungCap AND NgayKetThucCung)
	GO
    SELECT * FROM dbo.func_TimXe('5','2016-02-15')
/*
Câu 5: Tạo stored procedure proc_ThongKeXe @TuNgay, 
@DenNgay để thống kê xem trong khoảng thời gian từ @TuNgay đến @DenNgay nhà cung cấp nào có số lượng xe đăng ký cho thuê nhiều nhất
*/
CREATE PROCEDURE thongkexe @tungay NVARCHAR(50),@denngay NVARCHAR(50)

AS 
	SELECT dbo.NhaCungCap.MaNhaCC,TenNhaCC,DiaChi,SoDT,MaSoThue,SUM(SoLuongXeDangKy) AS solandangky
	 FROM dbo.NhaCungCap INNER JOIN dbo.DangKyCungCap ON DangKyCungCap.MaNhaCC = NhaCungCap.MaNhaCC
	--WHERE NgayBatDauCungCap>=@tungay AND NgayBatDauCungCap<=@denngay
GROUP BY dbo.NhaCungCap.MaNhaCC,TenNhaCC,DiaChi,SoDT,MaSoThue
	HAVING SUM(SoLuongXeDangKy)>=ALL (SELECT SUM(SoLuongXeDangKy) As soluong FROM dbo.DangKyCungCap
									 WHERE NgayBatDauCungCap>=@tungay AND NgayBatDauCungCap<=@denngay
									GROUP BY MaNhaCC
									)
DECLARE @b INT
EXECUTE @b=dbo.thongkexe @tungay = N'2015-01-01', -- nvarchar(50)
    @denngay = N'2019-01-01' -- nvarchar(50)
go
 