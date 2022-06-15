create database student_management ;
use student_management;

create table class(
id int primary key auto_increment,
`name` varchar (50));

create table teacher(
 id int primary key auto_increment,
 `name` varchar(50),
 age int,
 contry varchar (50)
 );