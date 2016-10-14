create database QuanLiThuVien
create table QuanTri
(
	ID nvarchar(10) primary key,
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
	NamTotNghiep datetime,
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
	ID_PhieuMuon bigint references PhieuMuon(ID),
	ID_Sach bigint references Sach(ID),
	SoLuong float,
	TinhTrang nvarchar(250)
)

create table DangKi
(
	ID bigint primary key identity not null, 
	ID_DocGia nvarchar(20) references DocGia(ID),
	ID_Sach bigint references Sach(ID),
	NgayDK datetime,
	TinhTrang nvarchar(20)
)

create table PhieuTra
(
	ID bigint primary key identity,
	ID_PhieuMuon bigint references PhieuMuon(ID),
	NgayTra datetime
)
create table ChiTietPhieuTra
(
	ID bigint primary key identity,
	ID_PhieuTra bigint references PhieuTra(ID),
	ID_Sach bigint references Sach(ID),
)
/*================= PHẦN NHẬP DỮ LIỆU =================*/

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

insert into TacGia(HoTen,NoiCongTac) values 
(N'Hoàng Đạo Thủy',N''),
(N'Đỗ Hoàng Diệu',N''),
(N'Phương Bạch Vũ',N''),
(N'Bồ Tùng Linh',N''),
(N'Mặc Mặc An Nhiên',N''),
(N'Thùy Uyên',N''),
(N'Thích Nhất Hạnh',N''),
(N'Trúc Khê',N'')

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

insert into DocGia (ID,HoTen,DiaChi,SDT,NgayCapThe,NgayHetHan,NamTotNghiep,Email,SLuongGioiHan,NgayGioiHan) values
('DG001',N'Thái Văn Thiên','82/10 Võ Thị Hồi, Hóc Môn, TP HCM','0907095201','14/10/2016','10/14/2017','2018','thaithienars@gmail.com','4','20'),
('DG002',N'Phạm Lê Duy Anh','12/26 Trần Bình Trọng, Quận 5, TP HCM','0903102845','17/9/2016','17/9/2017','2018','duyanhpham@gmail.com','4','20'),
('DG003',N'Thạch Thị Kiều Linh','30/23 D1, Bình Thanh, TP HCM','01223731932','23/3/2016','23/3/2017','2019','kieulinhpham@gmail.com','4','20'),
('DG005',N'Huỳnh Hữu Duy','102/14 Nguyễn Văn Linh, Quận 7, TP HCM','01217346472','20/9/2016','20/9/2017','2018','duyhuynh@gmail.com','4','20'),
('DG006',N'Phan Thị Kim Loan','26/4 QL 1A, Thủ Đức, TP HCM','0902748132','15/5/2015','15/5/2018','','kimloanpt@gmail.com','5','30'),
('DG007',N'Cao Thái Phương Thanh','26/3 An Dương Vương, Quận 5, TP HCM','0973274824','28/4/2015','28/4/2017','','caothaiphuongthai@gmail.com','5','30')










