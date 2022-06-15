drop database if exists castudy_modul_3;
create database castudy_modul_3;

use castudy_modul_3;

create table vi_tri(
id_vi_tri int primary key auto_increment,
ten_vi_tri varchar(45)
);

create table trinh_do(
id_trinh_do int primary key auto_increment,
ten_trinh_do varchar(45)
);

create table bo_phan(
id_bo_phan int primary key auto_increment,
ten_bo_phan varchar(45)
);

create table nhan_vien(
id_nhan_vien int primary key auto_increment,
ho_ten varchar (45),
ngay_sinh date,
so_cmnd varchar(45),
luong double,
sdt int (45),
email varchar(45),
dia_chi varchar(45),
id_vi_tri int,
id_trinh_do int,
id_bo_phan int,
foreign key(id_vi_tri)references vi_tri(id_vi_tri),
foreign key(id_trinh_do)references trinh_do(id_trinh_do),
foreign key(id_bo_phan)references bo_phan(id_bo_phan)
);

create table loai_khach(
id_loai_khach int primary key auto_increment,
ten_loai_khach varchar(45)
);

create table khach_hang(
id_khach_hang int primary key auto_increment,
ho_ten varchar(45),
ngay_sinh date,
gioi_tinh bit(1),
so_cmnd varchar(45),
sdt varchar(45),
email varchar(45),
dia_chi varchar(45),
id_loai_khach int,
foreign key(id_loai_khach)references loai_khach(id_loai_khach)
);

create table kieu_thue(
id_kieu_thue int primary key auto_increment,
ten_kieu_thue varchar(45)
);

create table loai_dich_vu(
id_loai_dich_vu int primary key auto_increment,
ten_loai_dich_vu varchar(45)
);

create table dich_vu(
id_dich_vu int primary key auto_increment,
ten_dich_vu varchar(45),
dien_tich int ,
chi_phi_thue double,
so_nguoi_o_toi_da int,
tieu_chuan_phong varchar(45),
mo_ta_tien_nghi_khac varchar(45),
dien_tich_ho_boi double,
so_tang int,
id_kieu_thue int,
id_loai_dich_vu int,
foreign key(id_kieu_thue)references kieu_thue(id_kieu_thue),
foreign key(id_loai_dich_vu)references loai_dich_vu(id_loai_dich_vu)
);

create table hop_dong(
id_hop_dong int primary key auto_increment,
ngay_lam_hop_dong datetime,
ngay_ket_thuc_hop_dong datetime,
tien_coc double,
id_nhan_vien int,
id_khach_hang int,
id_dich_vu int,
foreign key(id_nhan_vien)references nhan_vien(id_nhan_vien),
foreign key(id_khach_hang)references khach_hang(id_khach_hang),
foreign key(id_dich_vu)references dich_vu(id_dich_vu)
);

create table dich_vu_di_kem(
id_dich_vu_di_kem int primary key auto_increment,
ten_dich_vu_di_kem varchar(45),
gia double ,
don_vi varchar(45),
trang_thai varchar(45)
);

create table hop_dong_chi_tiet(
id_hop_dong_chi_tiet int primary key auto_increment,
so_luong int,
id_hop_dong int,
id_dich_vu_di_kem int,
foreign key(id_hop_dong)references hop_dong(id_hop_dong),
foreign key(id_dich_vu_di_kem)references dich_vu_di_kem(id_dich_vu_di_kem)
);

insert into `vi_tri` (`ten_vi_tri`) values ('Quản Lý'),('Nhân Viên');

insert into `trinh_do` (`ten_trinh_do`) values ('Trung Cấp'),('Cao Đẳng'),('Đại Học'),('Sau Đại Học');

insert into `bo_phan` (`ten_bo_phan`) values ('Sale-Marketing'),('Hành chính'),('Phục vụ'),('Quản lý');

INSERT INTO `nhan_vien` (`ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `sdt`, `email`, `dia_chi`, `id_vi_tri`, `id_trinh_do`, `id_bo_phan`) VALUES 
( 'Nguyễn Văn An', '1970-11-07', '456231786', '10000000', '0901234121', 'annguyen@gmail.com', '295 Nguyễn Tất Thành, Đà Nẵng', '1', '3', '1'),
( 'Lê Văn Bình', '1997-04-09', '654231234', '7000000', '0934212314', 'binhlv@gmail.com', '22 Yên Bái, Đà Nẵng', '1', '2', '2'),
( 'Hồ Thị Yến', '1995-12-12', '999231723', '14000000', '0412352315', 'thiyen@gmail.com', 'K234/11 Điện Biên Phủ, Gia Lai', '1', '3', '2'),
( 'Võ Công Toản', '1980-04-04', '123231365', '17000000', '0374443232', 'toan0404@gmail.com', '77 Hoàng Diệu, Quảng Trị', '1', '4', '4'),
( 'Nguyễn Bỉnh Phát', '1999-12-09', '454363232', '6000000', '0902341231', 'phatphat@gmail.com', '43 Yên Bái, Đà Nẵng', '2', '1', '1'),
( 'Khúc Nguyễn An Nghi', '2000-11-08', '964542311', '7000000', '0978653213', 'annghi20@gmail.com', '294 Nguyễn Tất Thành, Đà Nẵng', '2', '2', '3'),
( 'Nguyễn Hữu Hà', '1993-01-01', '534323231', '8000000', '0941234553', 'nhh0101@gmail.com', '4 Nguyễn Chí Thanh, Huế', '2', '3', '2'),
( 'Nguyễn Hà Đông', '1989-09-03', '234414123', '9000000', '0642123111', 'donghanguyen@gmail.com', '111 Hùng Vương, Hà Nội', '2', '4', '4'),
( 'Tòng Hoang', '1982-09-03', '256781231', '6000000', '0245144444', 'hoangtong@gmail.com', '213 Hàm Nghi, Đà Nẵng', '2', '4', '4'),
( 'Nguyễn Công Đạo', '1994-01-08', '755434343', '8000000', '0988767111', 'nguyencongdao12@gmail.com', '6 Hoà Khánh, Đồng Nai', '2', '3', '2');

INSERT INTO `loai_khach` ( `ten_loai_khach`) VALUES ('Diamond'),('Platinium'),('Gold'), ('Silver'), ('Member');

INSERT INTO `khach_hang` ( `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `sdt`, `email`, `dia_chi`, `id_loai_khach`) 
VALUES 
('Nguyễn Thị Hào', '1970-11-07', 0, '643431213', '0945423362', 'thihao07@gmail.com', '23 Nguyễn Hoàng, Đà Nẵng', '5'),
( 'Phạm Xuân Diệu', '1992-08-08', 1, '865342123', '0954333333', 'xuandieu92@gmail.com', 'K77/22 Thái Phiên, Quảng Trị', '3'),
('Trương Đình Nghệ', '1990-02-27', 1, '488645199', '0373213122', 'nghenhan2702@gmail.com', 'K323/12 Ông Ích Khiêm, Vinh', '1'),
('Dương Văn Quan', '1981-07-08', 1, '543432111', '0490039241', 'duongquan@gmail.com', 'K453/12 Lê Lợi, Đà Nẵng', '1'),
('Hoàng Trần Nhi Nhi', '1995-12-09', 0, '795453345', '0312345678', 'nhinhi123@gmail.com', '224 Lý Thái Tổ, Gia Lai', '4'),
('Tôn Nữ Mộc Châu', '2005-12-06', 0, '732434215', '0988888844', 'tonnuchau@gmail.com', '37 Yên Thế, Đà Nẵng', '4'),
('Nguyễn Thị Hào', '1999-04-08', 0, '965656433', '0763212345', 'haohao99@gmail.com', '55 Nguyễn Văn Linh, Kon Tum', '3'),
('Trần Đại Danh', '1994-07-01', 1, '432341235', '0643343433', 'danhhai99@gmail.com', '24 Lý Thường Kiệt, Quảng Ngãi', '1'),
('Nguyễn Tâm Đắc', '1989-07-01', 1, '344343432', '0987654321', 'dactam@gmail.com', '22 Ngô Quyền, Đà Nẵng', '2');

INSERT INTO `kieu_thue` ( `ten_kieu_thue`) VALUES ('year'), ('month'),('day'), ('hour');

INSERT INTO `loai_dich_vu` ( `ten_loai_dich_vu`) VALUES ('Villa'),('House'), ('Room');

INSERT INTO `dich_vu` (`ten_dich_vu`, `dien_tich`, `chi_phi_thue`, `so_nguoi_o_toi_da`, `tieu_chuan_phong`, `mo_ta_tien_nghi_khac`, `dien_tich_ho_boi`, `so_tang`, `id_kieu_thue`, `id_loai_dich_vu`)
 VALUES
 ( 'Villa Beach Front', '25000', '10000000', '10', 'vip', 'Có hồ bơi', 500, '4', '3', '1'),
  ( 'House Princess 01', '14000', '5000000', '7', 'vip', 'Có thêm bếp nướng', null, '3', '2', '2'),
 ( 'Room Twin 01', '5000', '1000000', '2', 'normal', 'Có tivi', null, null, '4', '3'),
 ( 'Villa No Beach Front', '22000', '9000000', '8', 'normal', 'Có hồ bơi', 300, '3', '3', '1'),
 ( 'House Princess 02', '10000', '4000000', '5', 'normal', 'Có thêm bếp nướng', null, '2', '3', '2'),
 ( 'Room Twin 02', '3000', '900000', '2', 'normal', 'Có tivi', null,null, '4', '3');
 
 INSERT INTO `hop_dong` ( `ngay_lam_hop_dong`, `ngay_ket_thuc_hop_dong`, `tien_coc`, `id_nhan_vien`, `id_khach_hang`, `id_dich_vu`) 
 VALUES 
 ( '2020-12-08', '2020-12-08', 0, 3, 1, 3),
 ( '2020-07-14', '2020-07-21', 200000, 7, 3, 1),
  ( '2021-03-15', '2021-03-17', 50000, 3, 4, 2),
 ( '2021-01-14', '2021-01-18', 100000, 7, 5, 5),
  ( '2021-07-14', '2021-07-15', 0, 7, 2, 6),
 ( '2021-06-01', '2021-06-03', 0, 7, 7, 6),
 ( '2021-09-02', '2021-09-05', 100000, 7, 4, 4),
 ( '2021-06-17', '2021-06-18', 150000, 3, 4, 1),
  ( '2020-11-19', '2020-11-19', 0, 3, 4, 3),
 ( '2021-04-12', '2021-04-14', 0, 10, 3, 5),
 ( '2021-04-25', '2021-04-25', 0, 2, 2, 1),
 ( '2021-05-25', '2021-05-27', 0, 7, 7, 1);
 
 INSERT INTO`dich_vu_di_kem` ( `ten_dich_vu_di_kem`, `gia`, `don_vi`, `trang_thai`)
 VALUES 
 ( 'Karaoke', '10000', 'giờ', 'tiện nghi, hiện tại'),
 ( 'Thuê xe máy', '10000', 'chiếc', 'hỏng 1 xe'),
 ( 'Thuê xe đạp', '20000', 'chiếc', 'tốt'),
 ('Buffet buổi sáng', '15000', 'suất', 'đầy đủ đồ ăn, tráng miệng'),
 ( 'Buffet buổi trưa', '90000', 'suất', 'đầy đủ đồ ăn, tráng miệng'),
 ( 'Buffet buổi tối', '16000', 'suất', 'đầy đủ đồ ăn, tráng miệng');

INSERT INTO `hop_dong_chi_tiet` ( `so_luong`, `id_hop_dong`, `id_dich_vu_di_kem`) 
VALUES
 ('5', '2', '4'),
 ( '8', '2', '5'),
 ( '15', '2', '6'),
 ( '1', '3', '1'),
 ( '11', '3', '2'),
 ( '1', '1', '3'),
 ( '2', '1', '2'),
 ( '2', '12', '2');
 











