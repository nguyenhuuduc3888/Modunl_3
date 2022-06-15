use quan_ly_ban_hang;

insert into customer(c_name,c_age)
values 
('Minh Quang',10),('Ngoc Oanh',20),('Hong Ha ',50);

insert into `order`(c_id,o_date,o_total_price)
values
(1,'2006-03-21',null),
(2,'2006-03-23',null),
(1,'2006-03-16',null);

insert into product(p_name,p_price)
values
('May Giat',3),('Tu Lanh',5),('Dieu Hoa',7),('Quat',1),('Bep Dien',2);

insert into orderdetail(o_id,p_id,od_qty)
values
(1,1,3),(1,3,7),(1,4,2),(2,1,1),(3,1,8),(2,5,4),(2,3,3);

select o.o_id,o.o_date,o.o_total_price as tong_tien
from `order`o ;

select c.*,p.*
from customer c
join `order` o on c.c_id=o.c_id
join orderdetail odt on o.o_id=odt.o_id
join product p on odt.p_id=p.p_id;

select c.*, count(o.c_id) as so_lan_mua_hang
from customer c
left join  `order` o on c.c_id=o.c_id
group by c_id  having count(o.c_id)=0;

select o.o_id,o.o_date,sum(od_qty*p_price) 
from `order` o 
join orderdetail odt on o.o_id=odt.o_id
join product p on odt.p_id=p.p_id
group by o_id;




