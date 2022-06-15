use castudy_modul_3;

SELECT * FROM nhan_vien
WHERE (ho_ten like 'H%' or  ho_ten like 'T%' or ho_ten like 'K%' ) and char_length(ho_ten)<15; 

SELECT*FROM khach_hang
WHERE (dia_chi like N'%Đà Nẵng%' or  dia_chi like N'%Quảng Trị%' ) and (YEAR(CURDATE()) - YEAR(ngay_sinh)) between 18 and 50