create database QuanLiThuVien
go
use QuanLiThuVien

go
create table LoaiSach
(
	ID bigint primary key identity not null,
	Ten nvarchar(250) not null
)
create table TacGia
(
	ID bigint primary key identity not null,
	HoTen nvarchar(250) not null,
	NoiCongTac nvarchar(250)
)
create table DauSach
(
	ID bigint primary key identity not null,
	Ten nvarchar(max) not null,
	ID_TacGia bigint references TacGia(ID) not null,
	Loai bigint references LoaiSach(ID) not null,
	TrangThai nvarchar(250) not null,
	MieuTa nvarchar(max) ,
	NgayNhap datetime not null,
	Soluong float not null
)
create table Sach
(
	ID bigint primary key identity not null,
	ID_DauSach bigint references DauSach(ID) not null,
	TinhTrang nvarchar(20)  null,
	GhiChu nvarchar(250)  null
)
create table DocGia
(
	ID nvarchar(20) primary key not null,
	HoTen nvarchar(100) not null,
	DiaChi nvarchar(250) not null,
	SDT nvarchar(11) not null,
	NgayCapThe datetime not null,
	NgayHetHan datetime not null,
	NamTotNghiep varchar(4) not null,
	Email nvarchar(30) not null,
	SLuongGioiHan float not null,
	NgayGioiHan float not null
)
create table PhieuMuon
(
	ID bigint primary key identity not null,
	ID_DocGia nvarchar(20) references DocGia(ID) not null,
	NgayMuon datetime not null,
	NgayGHTra datetime not null,           
)
create table ChiTietPhieuMuon
(
	ID bigint primary key identity not null,
	ID_PhieuMuon bigint references PhieuMuon(ID) not null,
	ID_DauSach bigint references DauSach(ID) not null,
	ID_Sach bigint references Sach(ID) not null,
	SoLuong float not null,
	TinhTrang nvarchar(250) null
)

create table PhieuTra
(
	ID bigint primary key identity not null,
	ID_DocGia nvarchar(20) references DocGia(ID) not null,
	NgayTra datetime not null
)
create table ChiTietPhieuTra
(
	ID bigint primary key identity not null,
	ID_PhieuTra bigint references PhieuTra(ID) not null,
	ID_DauSach bigint references DauSach(ID) not null,
	SoLuong float,
	ID_Sach bigint references Sach(ID) not null,
	
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
insert into DauSach (MieuTa,Soluong,Ten,TrangThai,NgayNhap,ID_TacGia,Loai) values
(N'',10,N'Hà Nội Thanh Lịch',N'','3/5/2016',1,1),
(N'',10,N'Lam Vỹ',N'','3/5/2016',2,2),
(N'',10,N'Thiên Môn Chi Hùng',N'','3/5/2016',3,3),
(N'',10,N'Liêu Trai Chí Dị',N'','3/5/2016',4,4),
(N'',10,N'Mộng Xưa Thành Cũ',N'','3/5/2016',5,5),
(N'',10,N'Những Ngôi Sao Nhỏ',N'','3/5/2016',6,6),
(N'',10,N'Khéo Tay Hay Làm',N'','3/5/2016',7,7),
(N'',10,N'Khởi Đầu Đam Mê Cùng Photoshop CC 2015',N'','3/5/2016',8,8),
(N'',10,N'Tự Học Excel 2010',N'','3/5/2016',1,9),
(N'',10,N'Hương Vị Của Đất',N'','3/5/2016',2,10),
(N'',10,N'Giai Thoại Dan Gian Việt Nam',N'','3/5/2016',3,11),
(N'',10,N'Góc Nhin Sử Việt - Cao Bá Quát',N'','3/5/2016',4,12)
-- Nhập dữ liệu cho bảng sách.
insert into Sach (ID_DauSach, TinhTrang, GhiChu) values
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
('10',N'Khả Dụng',''),
('11',N'Khả Dụng',''),
('11',N'Khả Dụng',''),
('11',N'Khả Dụng',''),
('11',N'Khả Dụng',''),
('11',N'Khả Dụng',''),
('11',N'Khả Dụng',''),
('11',N'Khả Dụng',''),
('11',N'Khả Dụng',''),
('11',N'Khả Dụng',''),
('11',N'Khả Dụng','')
go
-- NhậNp dữ liệu cho bảng độc giả 
insert into DocGia (ID,HoTen,DiaChi,SDT,NgayCapThe,NgayHetHan,NamTotNghiep,Email,SLuongGioiHan,NgayGioiHan) values
('DG001',N'Thái Văn Thiên','82/10 Võ Thị Hồi, Hóc Môn, TP HCM','0907095201','10/14/2016','10/14/2017','2018','thaithienars@gmail.com',4,20),
('DG002',N'Phạm Lê Duy Anh','12/26 Trần Bình Trọng, Quận 5, TP HCM','0903102845','9/17/2016','9/17/2017','2018','duyanhpham@gmail.com',4,20),
('DG003',N'Thạch Thị Kiều Linh','30/23 D1, Bình Thanh, TP HCM','01223731932','3/23/2016','3/23/2017','2019','kieulinhpham@gmail.com',4,20),
('DG005',N'Huỳnh Hữu Duy','102/14 Nguyễn Văn Linh, Quận 7, TP HCM','01217346472','9/9/2016','9/20/2017','2018','duyhuynh@gmail.com',4,20),
('DG006',N'Nguyễn Thanh Thư','245/23 Quốc Lộ 22, Hóc Môn, TP HCM','01882748383','2/14/2014','2/14/2017','2018','thanhthunguyen@gmail.com',4,20),
('DG007',N'Lý Chí Cường','37/17 Bà Hạt, Quận 10, TP HCM','0903136078','8/17/2015','8/17/2017','2018','lychicuong2246@gmail.com',4,20),
('DG008',N'Phùng Thái Thiên Trang','204 An Dương Vương, Quận 5, TP HCM','0903721837','1/1/2013','1/1/2019','','thientrangphung@gmail.com',5,30),
('DG009',N'Phan Thị Kim Loan','26/4 QL 1A, Thủ Đức, TP HCM','0902748132','5/15/2015','5/15/2018','','kimloanpt@gmail.com',5,30),
('DG010',N'Cao Thái Phương Thanh','26/3 An Dương Vương, Quận 5, TP HCM','0973274824','4/28/2015','4/28/2017','','caothaiphuongthai@gmail.com',5,30)
go
-- Nhập dữ liệu cho bảng phiếu mượn
insert into PhieuMuon values
('DG002','3/6/2016','3/26/2016'),
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
('1','2','2','1',N'Đã Trả'),
('2','2','3','1',N'Đã Trả'),
('3','2','4','1',N'Đã Trả'),
('4','2','5','1',N'Đã Trả'),
('5','2','6','1',N'Đã Trả'),
('6','2','7','1',N'Đã Trả'),
('7','2','8','1',N'Đã Trả'),
('8','2','9','1',N'Đã Trả'),
('9','2','10','1',N'Đã Trả'),
('10','2','11','1',N'Đã Trả'),
('11','3','12','1',N'Đã Trả'),
('12','3','13','1',N'Đã Trả'),
('13','3','14','1',N'Đã Trả'),
('14','3','15','1',N'Đã Trả'),
('15','3','16','1',N'Đã Trả'),
('16','3','17','1',N'Đã Trả'),
('17','3','18','1',N'Đã Trả'),
('18','3','19','1',N'Đã Trả'),
('19','3','20','1',N'Đã Trả'),
('20','3','21','1',N'Đã Trả'),
('21','4','22','1',N'Đã Trả'),
('22','4','23','1',N'Đã Trả'),
('23','4','24','1',N'Đã Trả'),
('24','4','25','1',N'Đã Trả')
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
('1','2','2','1'),
('2','2','3','1'),
('3','2','4','1'),
('4','2','5','1'),
('5','2','6','1'),
('6','2','7','1'),
('7','2','8','1'),
('8','2','9','1'),
('9','2','10','1'),
('10','2','11','1'),
('11','3','12','1'),
('12','3','13','1'),
('13','3','14','1'),
('14','3','15','1'),
('15','3','16','1'),
('16','3','17','1'),
('17','3','18','1'),
('18','3','19','1'),
('19','3','20','1'),
('20','3','21','1'),
('21','4','22','1'),
('22','4','23','1'),
('23','4','24','1'),
('24','4','25','1'),
('25','4','26','1')
go
--Thực thi câu truy vấn cho yêu cầu đồ án.

	
				
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
	go
	-- Thông tin độc giả mượn sách
	create proc sp_thongtindocgia
	as
	begin
		select DocGia.ID as IDDocGia, DauSach.Ten as TenSach, ChiTietPhieuMuon.TinhTrang as TinhTrang,PhieuMuon.NgayMuon as NgayMuon
		from ChiTietPhieuMuon, PhieuMuon,DocGia,DauSach
		where ChiTietPhieuMuon.ID_PhieuMuon=PhieuMuon.ID and PhieuMuon.ID_DocGia=DocGia.ID and DauSach.ID=ChiTietPhieuMuon.ID_DauSach
		end
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
		
	