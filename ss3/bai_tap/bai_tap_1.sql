use quan_ly_sinh_vien;

select *from student 
where ten_student like 'H%';

select *from class
where  month(start_date)=12;

select *from subject
where credit between 3 and 5;

select s.ten_student,sub.ten_sub,m.mark
from student s  join mark m on s.id_student=m.id_student join `subject` sub on m.id_sub=sub.id_sub
order by mark desc;

