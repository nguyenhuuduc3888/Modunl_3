drop database if exists quan_ly_sinh_vien;
create database quan_ly_sinh_vien ;

use quan_ly_sinh_vien;

create table class(
id_class INT primary key auto_increment,
ten_class varchar(60) not null,
start_date datetime not null,
status bit
);

create table student (
id_student int primary key auto_increment,
ten_student varchar(30) not null,
address varchar(60) ,
phone varchar (15),
`status` bit,
id_class int not null,
foreign key(id_class) references class(id_class)
);

create table `subject`(
id_sub int primary key auto_increment,
ten_sub varchar (50) not null,
credit tinyint NOT NULL DEFAULT 1 check (credit>=1),
`status` bit default 1
);

create table mark(
id_mark int not null primary key auto_increment,
id_sub int not null,
id_student int not null,
mark float default 0 check(mark between 0 and 100),
examtimes tinyint default 1,
unique (id_sub,id_student),
foreign key(id_sub)references `subject`(id_sub),
foreign key(id_student)references student(id_student)
);

insert into class 
values
(1,'A1','2008-12-20',1),
(2,'A2','2008-12-1',1),
(3,'B3',current_date(),0);

insert into student (ten_student,address,phone,`status`,id_class) 
values
('hung','ha noi','0912113113',1,1),
('manh','hcm','0123123123',0,2);
insert into student (ten_student,address,`status`,id_class)  values ('hoa','hai phong',1,1);

insert into `subject`
values
(1,'CF',5,1),
(2,'C',6,1),
(3,'HDJ',5,1),
(4,'RDBMS',10,1);
 
INSERT INTO mark(id_sub,id_student,mark,examtimes)
values
(1,1,8,1),
(1,2,10,2),
(2,1,12,1);

select *from student where `status`=true;
select*from subject where credit<10;

select s.id_student,s.ten_student,c.ten_class
 from student s join class c on s.id_class=c.id_class
 where c.ten_class='A1';
 
 select s.id_student ,s.ten_student,sub.ten_sub,m.mark
  from student s join mark m on s.id_student=m.id_student join subject sub on m.id_sub=sub.id_sub;
 
 select s.id_student,s.ten_student,sub.ten_sub,m.mark
 from student s join mark m on s.id_student=m.id_student join subject sub on m.id_sub=sub.id_sub
 where sub.ten_sub='CF'
 


