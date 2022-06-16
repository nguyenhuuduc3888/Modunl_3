use quan_ly_sinh_vien;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select s.* ,max(credit) as  credit_lon_nhat
from  `subject`s
group by s.credit
having credit_lon_nhat >= all (select max(credit) from `subject` group by credit);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select s.*,max(m.mark) as diem_thi_lon_nhat
from `subject` s
join mark m on s.id_sub=m.id_sub
group by s.id_sub
having diem_thi_lon_nhat >= all (select max(mark) from mark group by id_sub);

 -- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
 select s.*,avg(mark)  as diem_trung_binh
 from student s
 join mark m on s.id_student = m.id_student
 group by s.id_student
 order by mark desc
 
 





