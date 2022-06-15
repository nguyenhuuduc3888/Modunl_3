use castudy_modul_3;

-- task 2
SELECT * FROM nhan_vien
WHERE (ho_ten like 'H%' or  ho_ten like 'T%' or ho_ten like 'K%' ) and char_length(ho_ten)<15; 

-- task 3
SELECT*FROM khach_hang
WHERE (dia_chi like N'%Đà Nẵng%' or  dia_chi like N'%Quảng Trị%' ) and (YEAR(CURDATE()) - YEAR(ngay_sinh)) between 18 and 50;

-- task 4
SELECT hd.id_khach_hang,kh.ho_ten, count(hd.id_khach_hang) as so_lan_thue
from hop_dong hd
join khach_hang kh on hd.id_khach_hang=kh.id_khach_hang
join loai_khach lk on kh.id_loai_khach=lk.id_loai_khach
 where  ten_loai_khach='Diamond'
GROUP BY id_khach_hang 
order by so_lan_thue ;

-- task 5
select kh.id_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.id_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc_hop_dong,sum(chi_phi_thue+so_luong*gia) as tong_tien
from khach_hang kh 
left join loai_khach lk  on kh.id_loai_khach=lk.id_loai_khach
left join hop_dong hd on kh.id_khach_hang=hd.id_khach_hang
left join dich_vu dv on hd.id_dich_vu=dv.id_dich_vu
left join hop_dong_chi_tiet hdct on hd.id_hop_dong=hdct.id_hop_dong
left join dich_vu_di_kem dvdk on hdct.id_dich_vu_di_kem=dvdk.id_dich_vu_di_kem
group by kh.id_khach_hang;

-- task6 chua xong
select dv.id_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu ,count(hd.id_hop_dong) as so_lan_thue
from hop_dong hd
left join dich_vu dv on hd.id_dich_vu = dv.id_dich_vu
join loai_dich_vu ldv on dv.id_loai_dich_vu=ldv.id_loai_dich_vu
 where (month(hd.ngay_lam_hop_dong) between 1 and 3) and year(hd.ngay_lam_hop_dong)=2021 
group by hd.id_hop_dong having so_lan_thue=0 










