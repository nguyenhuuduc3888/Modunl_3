drop database if  exists demo;

create database demo;

use demo;

create table products(
id int primary key auto_increment,
ma_san_pham int,
ten_san_pham varchar(50),
gia_san_pham double,
so_luong_san_pham int,
mo_ta_san_pham varchar(100),
trang_thai_san_pham varchar(50)
);

INSERT INTO products ( `ma_san_pham`, `ten_san_pham`, `gia_san_pham`, `so_luong_san_pham`, `mo_ta_san_pham`, `trang_thai_san_pham`)
 VALUES 
(1, 'Điện Thoại', 1000, 10, 'Còn Hàng', 'Hàng Mới'),
( 2, 'Điều Hoà', 2000, 20, 'Còn Hàng', 'Hàng Mới'),
(3, 'Tủ Lạnh', 3000, 30, 'Còn Hàng', 'Hàng Mới'),
( 4, 'Máy Lọc  Nước', 4000, 40, 'Còn Hàng', 'Hàng Mới');

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create index index_1 on products(ma_san_pham);

-- Tạo Composite Index trêproductsindex_1n bảng Products (sử dụng 2 cột productName và productPrice)
create index index_2 on products(ten_san_pham,gia_san_pham);

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view products_view as select ma_san_pham, ten_san_pham, gia_san_pham, trang_thai_san_pham from products;

-- Tiến hành sửa đổi view
update products_view set ma_san_pham =10, ten_san_pham='Máy Tính', gia_san_pham=2000, trang_thai_san_pham ='Bình Thường'
where ma_san_pham =1;

-- Tiến hành xoá view
delete from products_view 
where ma_san_pham=10;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure  product_all ()
begin 
select* from products;
end//
delimiter ;

-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure  product_add (
in ma_san_pham int ,
in ten_san_pham varchar(50),
in gia_san_pham double,
in so_luong_san_pham int,
in mo_ta_san_pham varchar(100),
in trang_thai_san_pham varchar(50) )
begin 
INSERT INTO products ( `ma_san_pham`, `ten_san_pham`, `gia_san_pham`, `so_luong_san_pham`, `mo_ta_san_pham`, `trang_thai_san_pham`)
 VALUES ( ma_san_pham,ten_san_pham,gia_san_pham,so_luong_san_pham,mo_ta_san_pham,trang_thai_san_pham);
end
//delimiter ; 

-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure  product_update (
in id_product int,
in ma_san_pham int ,
in ten_san_pham varchar(50),
in gia_san_pham double,
in so_luong_san_pham int,
in mo_ta_san_pham varchar(100),
in trang_thai_san_pham varchar(50) )
begin 
update products 
                set `ma_san_pham` = ma_san_pham, 
					`ten_san_pham`=ten_san_pham, 
                    `gia_san_pham`=gia_san_pham,
                    `so_luong_san_pham` = so_luong_san_pham,
                    `mo_ta_san_pham`= mo_ta_san_pham ,
                    `trang_thai_san_pham`=trang_thai_san_pham
     where `id`= id_product;
end
//delimiter ;

-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure product_detele(
in id_product int )
begin
delete from products
           where `id` =id_product;
end
//delimiter ;







  
  