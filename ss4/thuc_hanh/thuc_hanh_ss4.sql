use quan_ly_nhan_vien;

select address ,count(id_student) as so_luong_hoc_sinh
from student
group by address;

select s.ten_student,s.id_student, avg(mark) as diem_trung_binh
from student s
join mark m on s.id_student=m.id_student
group by s.ten_student,s.id_student;

select s.ten_student,s.id_student, avg(mark) as diem_trung_binh
from student s
join mark m on s.id_student=m.id_student
group by s.ten_student,s.id_student
having diem_trung_binh >9;

select s.ten_student,s.id_student, avg(mark) as diem_trung_binh
from student s
join mark m on s.id_student=m.id_student
group by s.ten_student,s.id_student  
having avg(mark) >= ALL (SELECT AVG(mark) FROM mark GROUP BY mark.id_student);





