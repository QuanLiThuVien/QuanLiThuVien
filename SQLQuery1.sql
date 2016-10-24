create database QuanLiThuVien
create table QuanTri
(
	ID nvarchar(10) primary key not null,
	HoTen nvarchar(250),
	TenNguoiDung nvarchar(250),
	MatKhau nvarchar(20),
	SDT nvarchar(11),
	DiaChi nvarchar(max)
)
create table LoaiSach
(
	ID bigint primary key identity not null,
	Ten nvarchar(250)
)
create table TacGia
(
	ID bigint primary key identity not null,
	HoTen nvarchar(250),
	NoiCongTac nvarchar(250)
)
create table DauSach
(
	ID bigint primary key identity not null,
	Ten nvarchar(max),
	ID_TacGia bigint references TacGia(ID),
	Loai bigint references LoaiSach(ID),
	TrangThai nvarchar(250),
	MieuTa nvarchar(max),
	Soluong float
)
create table Sach
(
	ID bigint primary key identity not null,
	ID_DauSach bigint references DauSach(ID),
	TinhTrang nvarchar(20),
	GhiChu nvarchar(250)
)
create table DocGia
(
	ID nvarchar(20) primary key not null,
	HoTen nvarchar(100),
	DiaChi nvarchar(250),
	SDT nvarchar(11),
	NgayCapThe datetime,
	NgayHetHan datetime,
	NamTotNghiep varchar(4),
	Email nvarchar(30),
	SLuongGioiHan float,
	NgayGioiHan float
)
create table PhieuMuon
(
	ID bigint primary key identity not null,
	ID_DocGia nvarchar(20) references DocGia(ID),
	ID_NguoiDung nvarchar(10) references QuanTri(ID),
	NgayMuon datetime,
	NgayGHTra datetime,           
)
create table ChiTietPhieuMuon
(
	ID bigint primary key identity not null,
	ID_PhieuMuon bigint references PhieuMuon(ID),
	ID_DauSach bigint references DauSach(ID),
	ID_Sach bigint references Sach(ID),
	SoLuong float,
	TinhTrang nvarchar(250)
)

create table PhieuTra
(
	ID bigint primary key identity,
	ID_DocGia nvarchar(20) references DocGia(ID),
	ID_NguoiDung nvarchar(10) references QuanTri(ID),
	NgayTra date
)
create table ChiTietPhieuTra
(
	ID bigint primary key identity,
	ID_PhieuTra bigint references PhieuTra(ID),
	ID_DauSach bigint references DauSach(ID),
	SoLuong float,
	ID_Sach bigint references Sach(ID),
	
)
/*================= PHẦN NHẬP DỮ LIỆU =================*/
-- Nhập dữ liệu cho bảng  loại sách
insert into LoaiSach (Ten) values
(N'Tiểu thuyết'),
(N'Văn học Cổ điển'),
(N'Tình cảm'),
(N'Trinh thám'),
(N'Viễn tưởng'),
(N'Lịch sử'),
(N'Thiếu nhi'),
(N'Truyện tranh'),
(N'Công nghệ thông tin'),
(N'Tiếng anh'),
(N'Y dược'),
(N'Pháp luật')
-- Nhập dữ liệu cho bảng tac giả
insert into TacGia(HoTen,NoiCongTac) values 
(N'Hoàng Đạo Thủy',N''),
(N'Đỗ Hoàng Diệu',N''),
(N'Phương Bạch Vũ',N''),
(N'Bồ Tùng Linh',N''),
(N'Mặc Mặc An Nhiên',N''),
(N'Thùy Uyên',N''),
(N'Thích Nhất Hạnh',N''),
(N'Trúc Khê',N'')
-- Nhập dữ liệu cho bảng đầu sách
insert into DauSach (MieuTa,Soluong,Ten,TrangThai) values
(N'',10,N'Hà Nội Thanh Lịch',N''),
(N'',10,N'Lam Vỹ',N''),
(N'',10,N'Thiên Môn Chi Hùng',N''),
(N'',10,N'Liêu Trai Chí Dị',N''),
(N'',10,N'Mộng Xưa Thành Cũ',N''),
(N'',10,N'Những Ngôi Sao Nhỏ',N''),
(N'',10,N'Khéo Tay Hay Làm',N''),
(N'',10,N'Khởi Đầu Đam Mê Cùng Photoshop CC 2015',N''),
(N'',10,N'Tự Học Excel 2010',N''),
(N'',10,N'Hương Vị Của Đất',N''),
(N'',10,N'Giai Thoại Dan Gian Việt Nam',N''),
(N'',10,N'Góc Nhin Sử Việt - Cao Bá Quát',N'')
-- Nhập dữ liệu cho bảng sách.
insert into Sach (ID_DauSach, TinhTrang, GhiChu) values
('1',N'Khả Dụng',''),
('1',N'Khả Dụng',''),
('1',N'Khả Dụng',''),
('1',N'Khả Dụng',''),
('1',N'Khả Dụng',''),
('1',N'Khả Dụng',''),
('1',N'Khả Dụng',''),
('1',N'Khả Dụng',''),
('1',N'Khả Dụng',''),
('1',N'Khả Dụng',''),
('2',N'Khả Dụng',''),
('2',N'Khả Dụng',''),
('2',N'Khả Dụng',''),
('2',N'Khả Dụng',''),
('2',N'Khả Dụng',''),
('2',N'Khả Dụng',''),
('2',N'Khả Dụng',''),
('2',N'Khả Dụng',''),
('2',N'Khả Dụng',''),
('2',N'Khả Dụng',''),
('3',N'Khả Dụng',''),
('3',N'Khả Dụng',''),
('3',N'Khả Dụng',''),
('3',N'Khả Dụng',''),
('3',N'Khả Dụng',''),
('3',N'Khả Dụng',''),
('3',N'Khả Dụng',''),
('3',N'Khả Dụng',''),
('3',N'Khả Dụng',''),
('3',N'Khả Dụng',''),
('4',N'Khả Dụng',''),
('4',N'Khả Dụng',''),
('4',N'Khả Dụng',''),
('4',N'Khả Dụng',''),
('4',N'Khả Dụng',''),
('4',N'Khả Dụng',''),
('4',N'Khả Dụng',''),
('4',N'Khả Dụng',''),
('4',N'Khả Dụng',''),
('4',N'Khả Dụng',''),
('5',N'Khả Dụng',''),
('5',N'Khả Dụng',''),
('5',N'Khả Dụng',''),
('5',N'Khả Dụng',''),
('5',N'Khả Dụng',''),
('5',N'Khả Dụng',''),
('5',N'Khả Dụng',''),
('5',N'Khả Dụng',''),
('5',N'Khả Dụng',''),
('5',N'Khả Dụng',''),
('6',N'Khả Dụng',''),
('6',N'Khả Dụng',''),
('6',N'Khả Dụng',''),
('6',N'Khả Dụng',''),
('6',N'Khả Dụng',''),
('6',N'Khả Dụng',''),
('6',N'Khả Dụng',''),
('6',N'Khả Dụng',''),
('6',N'Khả Dụng',''),
('6',N'Khả Dụng',''),
('7',N'Khả Dụng',''),
('7',N'Khả Dụng',''),
('7',N'Khả Dụng',''),
('7',N'Khả Dụng',''),
('7',N'Khả Dụng',''),
('7',N'Khả Dụng',''),
('7',N'Khả Dụng',''),
('7',N'Khả Dụng',''),
('7',N'Khả Dụng',''),
('7',N'Khả Dụng',''),
('8',N'Khả Dụng',''),
('8',N'Khả Dụng',''),
('8',N'Khả Dụng',''),
('8',N'Khả Dụng',''),
('8',N'Khả Dụng',''),
('8',N'Khả Dụng',''),
('8',N'Khả Dụng',''),
('8',N'Khả Dụng',''),
('8',N'Khả Dụng',''),
('8',N'Khả Dụng',''),
('9',N'Khả Dụng',''),
('9',N'Khả Dụng',''),
('9',N'Khả Dụng',''),
('9',N'Khả Dụng',''),
('9',N'Khả Dụng',''),
('9',N'Khả Dụng',''),
('9',N'Khả Dụng',''),
('9',N'Khả Dụng',''),
('9',N'Khả Dụng',''),
('9',N'Khả Dụng',''),
('10',N'Khả Dụng',''),
('10',N'Khả Dụng',''),
('10',N'Khả Dụng',''),
('10',N'Khả Dụng',''),
('10',N'Khả Dụng',''),
('10',N'Khả Dụng',''),
('10',N'Khả Dụng',''),
('10',N'Khả Dụng',''),
('10',N'Khả Dụng',''),
('10',N'Khả Dụng','')
-- NhậNp dữ liệu cho bảng độc giả 
insert into DocGia (ID,HoTen,DiaChi,SDT,NgayCapThe,NgayHetHan,NamTotNghiep,Email,SLuongGioiHan,NgayGioiHan) values
('DG001',N'Thái Văn Thiên','82/10 Võ Thị Hồi, Hóc Môn, TP HCM','0907095201',convert(date,'14/10/2016',103),convert(date,'10/14/2017',103),'2018','thaithienars@gmail.com','4','20'),
('DG002',N'Phạm Lê Duy Anh','12/26 Trần Bình Trọng, Quận 5, TP HCM','0903102845',convert(date,'17/9/2016',103),convert(date,'17/9/2017',103),'2018','duyanhpham@gmail.com','4','20'),
('DG003',N'Thạch Thị Kiều Linh','30/23 D1, Bình Thanh, TP HCM','01223731932',convert(date,'23/3/2016',103),convert(date,'23/3/2017',103),'2019','kieulinhpham@gmail.com','4','20'),
('DG005',N'Huỳnh Hữu Duy','102/14 Nguyễn Văn Linh, Quận 7, TP HCM','01217346472',convert(date,'20/9/2016',103),convert(date,'20/9/2017',103),'2018','duyhuynh@gmail.com','4','20'),
('DG006',N'Nguyễn Thanh Thư','245/23 Quốc Lộ 22, Hóc Môn, TP HCM','01882748383',convert(date,'14/2/2014',103),convert(date,'14/2/2017',103),'2018','thanhthunguyen@gmail.com','4','20'),
('DG007',N'Lý Chí Cường','37/17 Bà Hạt, Quận 10, TP HCM','0903136078',convert(date,'17/8/2015',103),convert(date,'17/8/2017',103),'2018','lychicuong2246@gmail.com','4','20'),
('DG008',N'Phùng Thái Thiên Trang','204 An Dương Vương, Quận 5, TP HCM','0903721837',convert(date,'1/1/2013',103),convert(date,'1/1/2019',103),'','thientrangphung@gmail.com','5','30'),
('DG009',N'Phan Thị Kim Loan','26/4 QL 1A, Thủ Đức, TP HCM','0902748132',convert(date,'15/5/2015',103),convert(date,'15/5/2018',103),'','kimloanpt@gmail.com','5','30'),
('DG010',N'Cao Thái Phương Thanh','26/3 An Dương Vương, Quận 5, TP HCM','0973274824',convert(date,'28/4/2015',103),convert(date,'28/4/2017',103),'','caothaiphuongthai@gmail.com','5','30')
go
-- Nhập dữ liệu cho bảng phiếu mượn
insert into PhieuMuon (ID_DocGia, ID_NguoiDung, NgayMuon, NgayGHTra) values
('DG002','',convert(date,'6/3/2016',103),convert(date,'26/3/2016',103)),
('DG004','',convert(date,'7/3/2016',103),convert(date,'27/3/2016',103)),
('DG002','',convert(date,'9/3/2016',103),convert(date,'29/3/2016',103)),
('DG005','',convert(date,'9/3/2016',103),convert(date,'29/3/2016',103)),
('DG001','',convert(date,'9/3/2016',103),convert(date,'29/3/2016',103)),
('DG008','',convert(date,'13/3/2016',103),convert(date,'13/4/2016',103)),
('DG010','',convert(date,'13/3/2016',103),convert(date,'13/4/2016',103)),
('DG006','',convert(date,'13/3/2016',103),convert(date,'3/4/2016',103)),
('DG007','',convert(date,'17/3/2016',103),convert(date,'7/4/2016',103)),
('DG001','',convert(date,'17/3/2016',103),convert(date,'7/4/2016',103)),
('DG002','',convert(date,'20/3/2016',103),convert(date,'10/4/2016',103)),
('DG003','',convert(date,'20/3/2016',103),convert(date,'10/4/2016',103)),
('DG004','',convert(date,'20/3/2016',103),convert(date,'10/4/2016',103)),
('DG009','',convert(date,'25/3/2016',103),convert(date,'25/4/2016',103)),
('DG010','',convert(date,'25/3/2016',103),convert(date,'25/3/2016',103)),
('DG004','',convert(date,'2/4/2016',103),convert(date,'22/4/2016',103)),
('DG005','',convert(date,'2/4/2016',103),convert(date,'22/4/2016',103)),
('DG007','',convert(date,'2/4/2016',103),convert(date,'22/4/2016',103)),
('DG001','',convert(date,'6/4/2016',103),convert(date,'26/4/2016',103)),
('DG008','',convert(date,'6/4/2016',103),convert(date,'6/5/2016',103)),
('DG006','',convert(date,'6/4/2016',103),convert(date,'26/4/2016',103)),
('DG007','',convert(date,'10/4/2016',103),convert(date,'30/4/2016',103)),
('DG010','',convert(date,'10/4/2016',103),convert(date,'10/5/2016',103)),
('DG007','',convert(date,'15/4/2016',103),convert(date,'15/5/2016',103)),
('DG001','',convert(date,'15/4/2016',103),convert(date,'5/5/2016',103))
-- Nhập dữ liệu cho bảng chi tiết phiếu mượn
insert into ChiTietPhieuMuon (ID_PhieuMuon,ID_DauSach,ID_Sach, SoLuong, TinhTrang) values
('','1','1','1',N'Đã Trả'),
('','1','2','1',N'Đã Trả'),
('','1','3','1',N'Đã Trả'),
('','1','4','1',N'Đã Trả'),
('','1','5','1',N'Đã Trả'),
('','1','6','1',N'Đã Trả'),
('','1','7','1',N'Đã Trả'),
('','1','8','1',N'Đã Trả'),
('','1','9','1',N'Đã Trả'),
('','1','10','1',N'Đã Trả'),
('','2','11','1',N'Đã Trả'),
('','2','12','1',N'Đã Trả'),
('','2','13','1',N'Đã Trả'),
('','2','14','1',N'Đã Trả'),
('','2','15','1',N'Đã Trả'),
('','2','16','1',N'Đã Trả'),
('','2','17','1',N'Đã Trả'),
('','2','18','1',N'Đã Trả'),
('','2','19','1',N'Đã Trả'),
('','2','20','1',N'Đã Trả'),
('','3','21','1',N'Đã Trả'),
('','3','22','1',N'Đã Trả'),
('','3','23','1',N'Đã Trả'),
('','3','24','1',N'Đã Trả'),
('','3','25','1',N'Đã Trả')
-- Nhập dữ liệu cho bảng phiếu trả
insert into PhieuTra (ID_DocGia,ID_NguoiDung, NgayTra) values 
('DG002','',CONVERT(date,'10/3/2016',103)),
('DG004','',CONVERT(date,'15/3/2016',103)),
('DG002','',CONVERT(date,'20/3/2016',103)),
('DG005','',CONVERT(date,'25/3/2016',103)),
('DG001','',CONVERT(date,'27/3/2016',103)),
('DG008','',CONVERT(date,'17/3/2016',103)),
('DG010','',CONVERT(date,'20/3/2016',103)),
('DG006','',CONVERT(date,'21/3/2016',103)),
('DG007','',CONVERT(date,'27/3/2016',103)),
('DG001','',CONVERT(date,'29/3/2016',103)),
('DG002','',CONVERT(date,'25/3/2016',103)),
('DG003','',CONVERT(date,'27/32016',103)),
('DG004','',CONVERT(date,'29/3/2016',103)),
('DG009','',CONVERT(date,'10/4/2016',103)),
('DG010','',CONVERT(date,'12/4/2016',103)),
('DG004','',CONVERT(date,'13/4/2016',103)),
('DG005','',CONVERT(date,'13/4/2016',103)),
('DG007','',CONVERT(date,'16/4/2016',103)),
('DG001','',CONVERT(date,'19/4/2016',103)),
('DG008','',CONVERT(date,'20/4/2016',103)),
('DG006','',CONVERT(date,'21/4/2016',103)),
('DG007','',CONVERT(date,'25/4/2016',103)),
('DG010','',CONVERT(date,'29/4/2016',103)),
('DG007','',CONVERT(date,'1/5/2016',103)),
('DG001','',CONVERT(date,'2/5/2016',103))
-- Nhập dữ liệu cho bảng chi tiết phiếu trả.
insert into ChiTietPhieuTra (ID_PhieuTra,ID_DauSach,ID_Sach,SoLuong) values
('','1','1','1'),
('','1','2','1'),
('','1','3','1'),
('','1','4','1'),
('','1','5','1'),
('','1','6','1'),
('','1','7','1'),
('','1','8','1'),
('','1','9','1'),
('','1','10','1'),
('','2','11','1'),
('','2','12','1'),
('','2','13','1'),
('','2','14','1'),
('','2','15','1'),
('','2','16','1'),
('','2','17','1'),
('','2','18','1'),
('','2','19','1'),
('','2','20','1'),
('','3','21','1'),
('','3','22','1'),
('','3','23','1'),
('','3','24','1'),
('','3','25','1')
--Thực thi câu truy vấn cho yêu cầu đồ án.

	-- thống kê số lượng tồn của đầu sách tại một thời điểm
		-- lấy dữ liệu từ bảng đầu sách
 create proc sp_SoLuongDauSach
as
begin
	select Ten, Loai, TrangThai, MieuTa, Soluong,ID
	from DauSach
end
go
				
	-- lấy dữ liệu từ bảng chi tiết phiếu mượn
			create proc sp_SoLuongMuon
			@ngay nvarchar(50)
			as
			begin
				select sum(ChiTietPhieuMuon.SoLuong),ChiTietPhieuMuon.ID_DauSach
				from ChiTietPhieuMuon, PhieuMuon
				where ChiTietPhieuMuon.ID_PhieuMuon= PhieuMuon.ID and PhieuMuon.NgayMuon between convert(date,'20/10/2016',103) and convert(date,@ngay,103)
				group by ChiTietPhieuMuon.ID_DauSach
			end
			go
	-- lấy dữ liệu từ bảng chi tiết phiếu trả
			create proc sp_SoLuongTra
			@ngay nvarchar(50)
			as
				begin
				select sum(ChiTietPhieuTra.SoLuong),ChiTietPhieuTra.ID_DauSach
				from ChiTietPhieuTra,PhieuTra
				where ChiTietPhieuTra.ID_PhieuTra=PhieuTra.ID and PhieuTra.NgayTra between convert(date,'20/10/2016',103) and convert(date,@ngay,103)
				group by ChiTietPhieuTra.ID_DauSach
			end
			go
	-- Danh sách sách mượn sách mượn của độc giả trong một khoảng thời gian
		create proc sp_DanhSachSachMuon
		@ngaybatdau nvarchar(50),
		@ngayketthuc nvarchar(50)
		as
		begin
			select *
			 from ChiTietPhieuMuon, PhieuMuon 
			 where ChiTietPhieuMuon.ID_PhieuMuon=PhieuMuon.ID 
			 and NgayMuon between convert(date,@ngaybatdau,103) and convert(date,@ngayketthuc,103)
		end
		go
	-- Số lượng sách mượn trong một khoảng thời gian
	create proc sp_SoLuongSachMuon
	@ngaybatdau nvarchar(50),
	@ngayketthuc nvarchar(50)
	as
	begin
		select sum(SoLuong)
		from ChiTietPhieuMuon,PhieuMuon
		where ChiTietPhieuMuon.ID_PhieuMuon=PhieuMuon.ID
		 and NgayMuon between convert(date,@ngaybatdau,103) and convert(date,@ngayketthuc,103)
		 group by ChiTietPhieuMuon.ID_PhieuMuon
	end
	go
	-- Pro mượn sách
		-- Nhập phiếu mượn
		create proc NhapPhieuMuon
		@ID_DocGia nvarchar(50),
		@ID_QuanTri nvarchar(10),
		@NgayMuon nvarchar(50),
		@ngaygioihantra nvarchar(50)
		as
		begin
			insert into PhieuMuon  values(@ID_DocGia,@ID_QuanTri, convert(date,@NgayMuon,103), convert(date,@ngaygioihantra,103))
		end
		go
		-- Nhập chi tiết phiếu mượn
		create proc NhapChiTietPhieuMuon
		@ID_PhieuMuon bigint,
		@ID_DauSach bigint,
		@ID_Sach bigint,
		@Soluong float
		as 
		begin
			insert into ChiTietPhieuMuon(ID_PhieuMuon,ID_DauSach,ID_Sach,SoLuong) values(@ID_PhieuMuon, @ID_DauSach,@ID_Sach,@Soluong)
		end
		go
	-- Pro trả sách.
		-- Nhập phiếu trả
		create proc NhapPhieuTra
		@ID_DocGia nvarchar(20),
		@ID_NguoiDung nvarchar(20),
		@NgayTra nvarchar(50)
		as
		begin
			insert into PhieuTra(ID_DocGia,ID_NguoiDung,NgayTra) values(@ID_DocGia,@ID_NguoiDung,convert(date,@NgayTra,103))
		end
		go
		-- Nhập chi tiết phiếu trả
		create proc NhapChiTietPhieuTra
		@ID_PhieuTra bigint,
		@ID_DauSach bigint,
		@Soluong float,
		@ID_Sach bigint
		as
		begin
			insert into ChiTietPhieuTra(ID_PhieuTra,ID_DauSach,SoLuong,ID_Sach) values(@ID_PhieuTra,@ID_DauSach,@Soluong,@ID_Sach)
		end
		go




			






