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
