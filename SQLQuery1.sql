create database QuanLiThuVien
go
use QuanLiThuVien

go
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
	NgayCapThe nvarchar(50),
	NgayHetHan nvarchar(50),
	NamTotNghiep varchar(4),
	Email nvarchar(30),
	SLuongGioiHan float,
	NgayGioiHan float
)
create table PhieuMuon
(
	ID bigint primary key identity not null,
	ID_DocGia nvarchar(20) references DocGia(ID),
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
	NgayTra datetime
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
go
-- NhậNp dữ liệu cho bảng độc giả 
insert into DocGia (ID,HoTen,DiaChi,SDT,NgayCapThe,NgayHetHan,NamTotNghiep,Email,SLuongGioiHan,NgayGioiHan) values
('DG001',N'Thái Văn Thiên','82/10 Võ Thị Hồi, Hóc Môn, TP HCM','0907095201','14/10/2016','14/10/2017','2018','thaithienars@gmail.com',4,20),
('DG002',N'Phạm Lê Duy Anh','12/26 Trần Bình Trọng, Quận 5, TP HCM','0903102845','17/9/2016','17/9/2017','2018','duyanhpham@gmail.com',4,20),
('DG003',N'Thạch Thị Kiều Linh','30/23 D1, Bình Thanh, TP HCM','01223731932','23/3/2016','23/3/2017','2019','kieulinhpham@gmail.com',4,20),
('DG005',N'Huỳnh Hữu Duy','102/14 Nguyễn Văn Linh, Quận 7, TP HCM','01217346472','9/9/2016','20/9/2017','2018','duyhuynh@gmail.com',4,20),
('DG006',N'Nguyễn Thanh Thư','245/23 Quốc Lộ 22, Hóc Môn, TP HCM','01882748383','14/2/2014','14/2/2017','2018','thanhthunguyen@gmail.com',4,20),
('DG007',N'Lý Chí Cường','37/17 Bà Hạt, Quận 10, TP HCM','0903136078','17/8/2015','17/8/2017','2018','lychicuong2246@gmail.com',4,20),
('DG008',N'Phùng Thái Thiên Trang','204 An Dương Vương, Quận 5, TP HCM','0903721837','1/1/2013','1/1/2019','','thientrangphung@gmail.com',5,30),
('DG009',N'Phan Thị Kim Loan','26/4 QL 1A, Thủ Đức, TP HCM','0902748132','15/5/2015','15/5/2018','','kimloanpt@gmail.com',5,30),
('DG010',N'Cao Thái Phương Thanh','26/3 An Dương Vương, Quận 5, TP HCM','0973274824','28/4/2015','28/4/2017','','caothaiphuongthai@gmail.com',5,30)
go
-- Nhập dữ liệu cho bảng phiếu mượn
insert into PhieuMuon values
--('DG002','3/6/2016','3/26/2016'),
('DG002','3/7/2016','3/27/2016'),
('DG002','3/9/2016','3/29/2016'),
('DG005','3/9/2016','3/29/2016'),
('DG001','3/9/2016','3/29/2016'),
('DG008','3/13/2016','4/13/2016'),
('DG010','3/13/2016','4/13/2016'),
('DG006','3/13/2016','4/3/2016'),
('DG007','3/17/2016','4/7/2016'),
('DG001','3/17/2016','4/7/2016'),
('DG002','3/20/2016','4/10/2016'),
('DG003','3/20/2016','4/10/2016'),
('DG002','3/20/2016','4/10/2016'),
('DG009','3/25/2016','4/25/2016'),
('DG010','3/25/2016','3/27/2016'),
('DG002','4/2/2016','4/22/2016'),
('DG005','4/2/2016','4/22/2016'),
('DG007','4/2/2016','4/22/2016'),
('DG001','4/6/2016','4/26/2016'),
('DG008','4/6/2016','5/6/2016'),
('DG006','4/6/2016','4/26/2016'),
('DG007','4/10/2016','4/30/2016'),
('DG010','4/10/2016','5/10/2016'),
('DG007','5/14/2016','5/15/2016'),
('DG001','4/15/2016','5/5/2016')
-- Nhập dữ liệu cho bảng chi tiết phiếu mượn
insert into ChiTietPhieuMuon (ID_PhieuMuon,ID_DauSach,ID_Sach, SoLuong, TinhTrang) values
('1','1','1','1',N'Đã Trả'),
('2','1','2','1',N'Đã Trả'),
('3','1','3','1',N'Đã Trả'),
('4','1','4','1',N'Đã Trả'),
('5','1','5','1',N'Đã Trả'),
('6','1','6','1',N'Đã Trả'),
('7','1','7','1',N'Đã Trả'),
('8','1','8','1',N'Đã Trả'),
('9','1','9','1',N'Đã Trả'),
('10','1','10','1',N'Đã Trả'),
('11','2','11','1',N'Đã Trả'),
('12','2','12','1',N'Đã Trả'),
('13','2','13','1',N'Đã Trả'),
('14','2','14','1',N'Đã Trả'),
('15','2','15','1',N'Đã Trả'),
('16','2','16','1',N'Đã Trả'),
('17','2','17','1',N'Đã Trả'),
('18','2','18','1',N'Đã Trả'),
('19','2','19','1',N'Đã Trả'),
('20','2','20','1',N'Đã Trả'),
('21','3','21','1',N'Đã Trả'),
('22','3','22','1',N'Đã Trả'),
('23','3','23','1',N'Đã Trả'),
('24','3','24','1',N'Đã Trả')
go
-- Nhập dữ liệu cho bảng phiếu trả
insert into PhieuTra (ID_DocGia,NgayTra) values 
('DG002','10/5/2016'),
('DG002','3/15/2016'),
('DG002','3/20/2016'),
('DG005','3/25/2016'),
('DG001','3/27/2016'),
('DG008','3/17/2016'),
('DG010','3/20/2016'),
('DG006','3/21/2016'),
('DG007','3/27/2016'),
('DG001','3/29/2016'),
('DG002','3/25/2016'),
('DG003','3/27/2016'),
('DG002','3/29/2016'),
('DG009','4/10/2016'),
('DG010','4/12/2016'),
('DG002','4/13/2016'),
('DG005','4/13/2016'),
('DG007','4/16/2016'),
('DG001','4/19/2016'),
('DG008','4/20/2016'),
('DG006','4/21/2016'),
('DG007','4/25/2016'),
('DG010','4/25/2016'),
('DG007','5/1/2016'),
('DG001','5/2/2016')
-- Nhập dữ liệu cho bảng chi tiết phiếu trả.
insert into ChiTietPhieuTra (ID_PhieuTra,ID_DauSach,ID_Sach,SoLuong) values
('1','1','1','1'),
('2','1','2','1'),
('3','1','3','1'),
('4','1','4','1'),
('5','1','5','1'),
('6','1','6','1'),
('7','1','7','1'),
('8','1','8','1'),
('9','1','9','1'),
('10','1','10','1'),
('11','2','11','1'),
('12','2','12','1'),
('13','2','13','1'),
('14','2','14','1'),
('15','2','15','1'),
('16','2','16','1'),
('17','2','17','1'),
('18','2','18','1'),
('19','2','19','1'),
('20','2','20','1'),
('21','3','21','1'),
('22','3','22','1'),
('23','3','23','1'),
('24','3','24','1'),
('25','3','25','1')
go
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
exec sp_SoLuongDauSach
go
				
	-- lấy dữ liệu từ bảng chi tiết phiếu mượn
	go
			create proc sp_SoLuongMuon
			@ngay nvarchar(50)
			as
			begin
				select sum(ChiTietPhieuMuon.SoLuong) as SoLuong,ChiTietPhieuMuon.ID_DauSach
				from ChiTietPhieuMuon, PhieuMuon
				where ChiTietPhieuMuon.ID_PhieuMuon= PhieuMuon.ID and PhieuMuon.NgayMuon between '3/7/2016' and @ngay
				group by ChiTietPhieuMuon.ID_DauSach
			end
go
	-- lấy dữ liệu từ bảng chi tiết phiếu trả
			create proc sp_SoLuongTra
			@ngay nvarchar(50)
			as
				begin
				select sum(ChiTietPhieuTra.SoLuong) as SoLuong,ChiTietPhieuTra.ID_DauSach
				from ChiTietPhieuTra,PhieuTra
				where ChiTietPhieuTra.ID_PhieuTra=PhieuTra.ID and PhieuTra.NgayTra between '3/7/2016' and @ngay
				group by ChiTietPhieuTra.ID_DauSach
			end
			go
			exec sp_SoLuongTra '5/14/2016'
			go
	-- Danh sách sách mượn sách mượn của độc giả trong một khoảng thời gian
		create proc sp_DanhSachSachMuon
		@ngaybatdau nvarchar(50),
		@ngayketthuc nvarchar(50)
		as
		begin
			select DocGia.ID,DocGia.HoTen,DauSach.Ten,PhieuMuon.NgayMuon,ChiTietPhieuMuon.SoLuong
			 from ChiTietPhieuMuon, PhieuMuon, DocGia,DauSach
			 where ChiTietPhieuMuon.ID_PhieuMuon=PhieuMuon.ID and DocGia.ID=PhieuMuon.ID_DocGia
			  and ChiTietPhieuMuon.ID_DauSach=DauSach.ID
			 and NgayMuon between @ngaybatdau and @ngayketthuc
		end
		go
		exec sp_DanhSachSachMuon '3/7/2016', '5/14/2016'
		go
	-- Số lượng sách mượn trong một khodảng thời gian
	go
	create proc sp_SoLuongSachMuon
	@ngaybatdau nvarchar(50),
	@ngayketthuc nvarchar(50)
	as
	begin
		select sum(SoLuong) as SoLuong, PhieuMuon.ID_DocGia,DocGia.HoTen
		from ChiTietPhieuMuon,PhieuMuon,DocGia
		where ChiTietPhieuMuon.ID_PhieuMuon=PhieuMuon.ID
		 and NgayMuon between @ngaybatdau and @ngayketthuc
		 group by ChiTietPhieuMuon.ID_PhieuMuon,PhieuMuon.ID_DocGia,DocGia.HoTen
	end
	go
	exec sp_SoLuongSachMuon '3/7/2016', '5/14/2016'
	go
	
	-- Pro mượn sách
		-- Nhập phiếu mượn
		create proc NhapPhieuMuon
		@ID_DocGia nvarchar(50),
		@NgayMuon nvarchar(50),
		@ngaygioihantra nvarchar(50)
		as
		begin
			insert into PhieuMuon  values(@ID_DocGia,@NgayMuon,@ngaygioihantra)
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
		@NgayTra nvarchar(50)
		as
		begin
			insert into PhieuTra(ID_DocGia,NgayTra) values(@ID_DocGia,@NgayTra)
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
		-- proc hiển thị thông tin sách
		create proc sp_thongtinsach
		as
		begin
			select * from DauSach d join Sach s on d.ID=s.ID_DauSach
			where TinhTrang=N'Khả Dụng'
		end
		go
		exec sp_thongtinsach
		go
		-- proc hiển thị thông tin đọc giả
		create proc sp_thongtindocgia
		as
		begin
		select *
		 from DocGia 
		end
		go






			






