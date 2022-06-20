use castudy_modul_3;

-- task 2 Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
SELECT * FROM nhan_vien
WHERE (ho_ten like 'H%' or  ho_ten like 'T%' or ho_ten like 'K%' ) and char_length(ho_ten)<15; 

-- task 3 Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
SELECT*FROM khach_hang
WHERE (dia_chi like N'%Đà Nẵng%' or  dia_chi like N'%Quảng Trị%' ) and (YEAR(CURDATE()) - YEAR(ngay_sinh)) between 18 and 50;

-- task 4 Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng.
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
SELECT hd.id_khach_hang,kh.ho_ten,lk.ten_loai_khach, count(hd.id_khach_hang) as so_lan_thue
from hop_dong hd
join khach_hang kh on hd.id_khach_hang=kh.id_khach_hang
join loai_khach lk on kh.id_loai_khach=lk.id_loai_khach
where  ten_loai_khach='Diamond'
group by id_khach_hang
order by so_lan_thue ;

-- task 5 Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
-- (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet)
-- cho tất cả các khách hàng đã từng đặt phòng.
-- (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
select kh.id_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.id_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc_hop_dong,  ifnull(chi_phi_thue,0)+ ifnull (so_luong*gia,0) as tong_tien
from khach_hang kh 
left join loai_khach lk  on kh.id_loai_khach=lk.id_loai_khach
left join hop_dong hd on kh.id_khach_hang=hd.id_khach_hang
left join dich_vu dv on hd.id_dich_vu=dv.id_dich_vu
left join hop_dong_chi_tiet hdct on hd.id_hop_dong=hdct.id_hop_dong
left join dich_vu_di_kem dvdk on hdct.id_dich_vu_di_kem=dvdk.id_dich_vu_di_kem
group by kh.id_khach_hang;

-- task6 Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của 
-- tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
select dv.id_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu 
from dich_vu dv
join loai_dich_vu ldv on dv.id_loai_dich_vu =  ldv.id_loai_dich_vu
join hop_dong hd on dv.id_dich_vu = hd.id_dich_vu
group by dv.id_dich_vu
having dv.id_dich_vu not in
(select dv.id_dich_vu 
from dich_vu dv
join loai_dich_vu ldv on dv.id_loai_dich_vu =  ldv.id_loai_dich_vu
join hop_dong hd on dv.id_dich_vu = hd.id_dich_vu
where ( month(hd.ngay_lam_hop_dong) between 1 and 3) and year(hd.ngay_lam_hop_dong)=2021 
group by dv.id_dich_vu);
 
 -- task7 Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu 
 -- của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
 select dv.id_dich_vu,dv.ten_dich_vu,dv.dien_tich,dv.so_nguoi_o_toi_da,dv.chi_phi_thue, ldv.ten_loai_dich_vu ,hd.ngay_lam_hop_dong
 from dich_vu dv 
 join loai_dich_vu ldv on dv.id_loai_dich_vu = ldv.id_loai_dich_vu
 join hop_dong hd on dv.id_dich_vu = hd.id_dich_vu
 group by dv.id_dich_vu
 having dv.id_dich_vu not in
(select dv.id_dich_vu
from dich_vu dv
join loai_dich_vu ldv on dv.id_loai_dich_vu = ldv.id_loai_dich_vu
join hop_dong hd on dv.id_dich_vu = hd.id_dich_vu
where year(ngay_lam_hop_dong) =2021);

-- task 8 cach 1
select distinct ho_ten from khach_hang;
-- task 8 cach 2
select ho_ten from khach_hang
group by ho_ten;
-- task 8 cach 3
select ho_ten from khach_hang
union
select ho_ten from khach_hang;

-- task 9 Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng
-- trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select month(ngay_lam_hop_dong) as thang ,count(hd.id_khach_hang) as so_lan_dat_phong_trong_thang
from hop_dong hd
where  year (ngay_lam_hop_dong)=2021
group by thang
order by ngay_lam_hop_dong;

-- task 10 Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm.
-- Kết quả hiển thị bao gồm ..ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc..,
-- so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
 select hd.id_hop_dong,hd.ngay_lam_hop_dong,hd.ngay_ket_thuc_hop_dong,hd.tien_coc,sum(ifnull(hdct.so_luong,0)) as so_luong_dich_vu_di_kem
 from hop_dong hd
 left join hop_dong_chi_tiet hdct on hd.id_hop_dong         = hdct.id_hop_dong
 left join dich_vu_di_kem dvdk    on hdct.id_dich_vu_di_kem = dvdk.id_dich_vu_di_kem
 group by id_hop_dong
 order by so_luong_dich_vu_di_kem desc;
 
 -- task 11 Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là
 -- “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
 select dvdk.*,kh.dia_chi,lk.ten_loai_khach
 from dich_vu_di_kem dvdk 
 join hop_dong_chi_tiet hdct on dvdk.id_dich_vu_di_kem = hdct.id_dich_vu_di_kem
 join hop_dong hd   on hdct.id_hop_dong = hd.id_hop_dong
 join khach_hang kh on hd.id_khach_hang = hd.id_khach_hang
 join loai_khach lk on kh.id_loai_khach = lk.id_loai_khach
 where lk.ten_loai_khach = 'Diamond' and  (kh.dia_chi  like '%Vinh%' or kh.dia_chi like '%Quãng Ngãi%');
 
 
 -- task 12 Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng),
 -- ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc 
 -- của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
 select hd.id_hop_dong,nv.ho_ten as ho_ten_nhan_vien,kh.ho_ten,kh.sdt,dv.id_dich_vu,dv.ten_dich_vu,sum(ifnull(hdct.so_luong,0)) as so_luong_dich_vu_di_kem,hd.tien_coc
 from hop_dong hd
  join nhan_vien nv  on hd.id_nhan_vien  = nv.id_nhan_vien
  join khach_hang kh on hd.id_khach_hang = kh.id_khach_hang
  join dich_vu dv    on hd.id_dich_vu    = dv.id_dich_vu
  join hop_dong_chi_tiet hdct on hd.id_hop_dong = hdct.id_hop_dong
 where (month(ngay_lam_hop_dong) between 10 and 12)  and year(ngay_lam_hop_dong)=2020
 group by hd.id_hop_dong;
 
 -- task 13 Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
 -- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
 select dvdk.*, max(hdct.so_luong) as su_dung_nhieu_nhat
 from hop_dong_chi_tiet hdct
 join dich_vu_di_kem dvdk on hdct.id_dich_vu_di_kem = dvdk.id_dich_vu_di_kem
 group by dvdk.ten_dich_vu_di_kem
 having su_dung_nhieu_nhat >= all(select max(so_luong) from hop_dong_chi_tiet );
 
 -- task 14 Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
 -- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).
select hd.id_hop_dong,dv.ten_dich_vu,dvdk.ten_dich_vu_di_kem,count(dvdk.id_dich_vu_di_kem) so_lan_su_dung
from  dich_vu_di_kem dvdk 
left join hop_dong_chi_tiet hdct on dvdk.id_dich_vu_di_kem = hdct.id_dich_vu_di_kem
left join hop_dong hd            on hdct.id_hop_dong    = hd.id_hop_dong
left join dich_vu dv             on hd.id_dich_vu       = dv.id_dich_vu
group by ten_dich_vu_di_kem
having  count(dvdk.id_dich_vu_di_kem) =1
order by id_hop_dong;

-- task 15 Hiển thi thông tin của tất cả nhân viên bao gồm 
-- ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
select nv.id_nhan_vien,nv.ho_ten,td.ten_trinh_do,bp.ten_bo_phan,nv.sdt,nv.dia_chi ,count(hd.id_hop_dong) hop_dong_duoc_lap
from hop_dong hd
join nhan_vien nv on hd.id_nhan_vien = nv.id_nhan_vien
join trinh_do td  on nv.id_trinh_do  = td.id_trinh_do
join bo_phan bp    on nv.id_bo_phan    = bp.id_bo_phan
group by id_nhan_vien
having count(hd.id_hop_dong) <=3;

-- task 16 Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
update  nhan_vien nv
set `check` = 1
where nv.id_nhan_vien in (
select*from (select nv.id_nhan_vien from hop_dong hd
right join nhan_vien nv on hd.id_nhan_vien = nv.id_nhan_vien
right join trinh_do td  on nv.id_trinh_do  = td.id_trinh_do
right join bo_phan bp    on nv.id_bo_phan    = bp.id_bo_phan
group by id_nhan_vien
having count(hd.id_hop_dong) =0 ) temp
);
-- task 17 Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond,
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
update khach_hang kh set kh.id_loai_khach= 1
where kh.id_khach_hang in(
select*from (
select kh.id_khach_hang
from khach_hang kh 
left join loai_khach lk  on kh.id_loai_khach=lk.id_loai_khach
left join hop_dong hd on kh.id_khach_hang=hd.id_khach_hang
left join dich_vu dv on hd.id_dich_vu=dv.id_dich_vu
left join hop_dong_chi_tiet hdct on hd.id_hop_dong=hdct.id_hop_dong
left join dich_vu_di_kem dvdk on hdct.id_dich_vu_di_kem=dvdk.id_dich_vu_di_kem
where year(ngay_ket_thuc_hop_dong) =2021 and  ifnull(dv.chi_phi_thue,0)+ ifnull (hdct.so_luong*dvdk.gia,0)>10000000
group by lk.ten_loai_khach  having lk.ten_loai_khach= 'Platinium' )temp)
;

-- task 18 Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
update khach_hang kh set `check`=1
where kh.id_khach_hang in(
select*from(
select kh.id_khach_hang  from khach_hang kh
join hop_dong hd on kh.id_khach_hang= hd.id_hop_dong
where year(ngay_lam_hop_dong)<2021) temp);

-- task  19 Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
update dich_vu_di_kem dvdk set dvdk.gia=dvdk.gia*2
where dvdk.id_dich_vu_di_kem in(
select*from(
select dvdk.id_dich_vu_di_kem
 from hop_dong_chi_tiet hdct
 join dich_vu_di_kem dvdk on hdct.id_dich_vu_di_kem = dvdk.id_dich_vu_di_kem
 where hdct.so_luong >10 )temp);
 
-- task 20 	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm id 
-- (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
select id_nhan_vien,nv.ho_ten,nv.email,nv.sdt,nv.ngay_sinh,nv.dia_chi from nhan_vien nv
union 
select id_khach_hang,kh.ho_ten,kh.email,kh.sdt,kh.ngay_sinh,kh.dia_chi from khach_hang kh;

-- task 21 Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” 
-- và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.
create view view_nhan_vien
as select nv.* from nhan_vien nv
join hop_dong hd on nv.id_nhan_vien = hd.id_nhan_vien
where nv.dia_chi like '%Hải Châu%' and ngay_lam_hop_dong=12/12/2019;

-- task 22 Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành
-- “Liên Chiểu” đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.
update view_nhan_vien set nhan_vien.dia_chi="Liên Chiểu";

-- task 23 Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với
-- ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.
delimiter //
create procedure sp_xoa_khach_hang(
in id int )
begin
delete from khach_hang
           where `id_khach_hang` =id;
end
//delimiter ;

-- task 24 Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu sp_them_moi_hop_dong phải thực hiện kiểm tra
-- tính hợp lệ của dữ liệu bổ sung,  với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.
delimiter //
create procedure sp_them_moi_hop_dong(
in ngay_lam_hop_dong datetime,
in ngay_ket_thuc_hop_dong datetime,
in tien_coc double,
in id_nhan_vien int,
in id_khach_hang int,
in id_dich_vu int
 )
begin
insert into hop_dong(`ngay_lam_hop_dong`,`ngay_ket_thuc_hop_dong`,`tien coc`,`id_nhan_vien`,`id_khach_hang`,`id_dich_vu`)
values (ngay_lam_hop_dong,ngay_ket_thuc_hop_dong,tien_coc,id_nhan_vien,id_khach_hang,id_dich_vu);
end
//delimiter ;















 
  

 


 
 
 
 
 
 
 
 
















