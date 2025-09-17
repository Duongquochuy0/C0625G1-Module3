create database quan_ly_ban_hang;
use quan_ly_ban_hang;
create table khach_hang(
id_kh int primary key,
name_kh varchar(50),
tuoi_kh int
);
create table dat_hang(
id_dh int primary key,
id_kh int,
ngay_dat_hang date,
gia_tien int,
foreign key (id_kh) references khach_hang(id_kh)
);
create table san_pham(
id_sp int primary key,
name_sp varchar(50),
gia_tien int
);
create table chi_tiet_don_hang(
id_dh int,
id_sp int,
so_luong int,
primary key (id_dh, id_sp),
foreign key (id_dh) references dat_hang(id_dh),
foreign key (id_sp) references san_pham(id_sp)
);
INSERT INTO khach_hang (id_kh, name_kh, tuoi_kh) VALUES
(1, 'Minh Quan', 10),
(2, 'Ngoc Oanh', 20),
(3, 'Hong Ha', 50);
INSERT INTO dat_hang (id_dh, id_kh, ngay_dat_hang, gia_tien) VALUES
(1, 1, '2006-03-21', NULL),
(2, 2, '2006-03-23', NULL),
(3, 1, '2006-03-16', NULL);
INSERT INTO san_pham (id_sp, name_sp, gia_tien) VALUES
(1, 'May Giat', 3),
(2, 'Tu Lanh', 5),
(3, 'Dieu Hoa', 7),
(4, 'Quat', 1),
(5, 'Bep Dien', 2);
INSERT INTO chi_tiet_don_hang (id_dh, id_sp, so_luong) VALUES
(1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(2, 5, 1),
(3, 3, 3),
(2, 3, 4);
select * from khach_hang;
select * from dat_hang;
select * from san_pham;
select * from chi_tiet_don_hang;
-- hiển thị id đặt hàng, ngày đặt hàng, giá tiền
select id_dh as oID,ngay_dat_hang as oDate,gia_tien as oPrice
from dat_hang;
-- hiển thị danh sách khách hàng đã mua, và danh sách sản phẩm được mua bởi khách hàng
select kh.id_kh,kh.name_kh,group_concat(distinct sp.name_sp order by sp.name_sp) as SanPham
from khach_hang kh
join dat_hang dh on kh.id_kh = dh.id_kh
join chi_tiet_don_hang ctdh on dh.id_dh = ctdh.id_dh
join san_pham sp on ctdh.id_sp = sp.id_sp
group by kh.id_kh, kh.name_kh;

-- hiển thị tên những khách hàng không mua bất kì sản phẩm nào
select kh.name_kh
from khach_hang kh
left join dat_hang dh on kh.id_kh = dh.id_kh
where dh.id_kh is null;
-- hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn
select dh.id_dh as oID,dh.ngay_dat_hang as oDate,sum(ctdh.so_luong * sp.gia_tien) as oPrice
from dat_hang dh
join chi_tiet_don_hang ctdh on dh.id_dh = ctdh.id_dh
join san_pham sp on ctdh.id_sp = sp.id_sp
group by dh.id_dh, dh.ngay_dat_hang;
