drop database if  exists chuyen_doi_erd;

create database chuyen_doi_erd;

use chuyen_doi_erd;

create table phieu_xuat(
so_san_pham int primary key,
ngay_san_xuat int 
);

create table vat_tu(
ma_vat_tu int primary key,
ten_vat_tu varchar(100)
);

create table chi_tiet_phieu_xuat(
so_san_pham int ,
ma_vat_tu int,
don_gia_san_xuat int,
so_luong_san_xuat int,
 PRIMARY KEY (so_san_pham ,ma_vat_tu),
 FOREIGN KEY(so_san_pham) REFERENCES phieu_xuat(so_san_pham),
 FOREIGN KEY(ma_vat_tu) REFERENCES vat_tu(ma_vat_tu)
);

create table don_dh(
so_dh int primary key,
ngay_dh int
);

create table chi_tiet_don_dat_hang(
ma_vat_tu int ,
so_dh int,
primary key(ma_vat_tu,so_dh),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu),
foreign key(so_dh) references don_dh(so_dh)
);

create table nha_cung_cap(
so_dh int ,
ma_ncc int,
ten_ncc varchar(50),
dia_chi varchar(50),
primary key(ma_ncc),
foreign key(so_dh) references don_dh(so_dh)
);

create table sdt(
sdt varchar(11),
ma_ncc int,
primary key (sdt),
foreign key (ma_ncc) references nha_cung_cap(ma_ncc)
);

create table phieu_nhap(
so_pn int primary key,
ngay_nhap varchar (50)
);

create table chi_tiet_phieu_nhap(
so_pn int,
ma_vat_tu int,
dg_nhap int,
sl_nhap int,
primary key (so_pn,ma_vat_tu),
foreign key(so_pn)references phieu_nhap(so_pn),
foreign key(ma_vat_tu)references vat_tu(ma_vat_tu)
);


