create database bai_1;
use bai_1;
create table Class(
id int primary key auto_increment,
name varchar(200)
);
create table Teacher(
id int primary key auto_increment,
name varchar(200),
age int,
country varchar(50)
);
insert into Class(id, name) values (1, "Module 1"), (2, "Module 2"), (3, "Module 3");
update Class set name = "Module 4" where id = 3;
delete from Class where id = 2;
select * from Class;
insert into Teacher (id, name, age, country) values (1, "Huy", 24, "Viet Nam"), (2, "Huy1", 31, "Viet Nam"), (3, "Huy2", 23, "Viet Nam");
select * from Teacher;
update Teacher set name = "Huy" where id = 3;
delete from Teacher where id = 2;