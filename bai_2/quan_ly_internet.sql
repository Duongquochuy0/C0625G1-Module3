create database quan_ly_internet;
use quan_ly_internet;
create table computer (
ma_may varchar(10) primary key,
hang_sx varchar(50),
vi_tri  varchar(100)
);
create table loai_khach (
id_loai_khach int primary key,
ten_loai varchar(20)
);
create table khach_hang (
id_kh int primary key ,
ten_kh varchar(50),
sdt varchar(15),
email varchar(100),
id_loai_khach int,
foreign key (id_loai_khach) references loai_khach(id_loai_khach)
);
create table dich_vu (
id_dv int primary key,
ten_dv varchar(50),
gia int
);
create table su_dung_may (
id_sd int primary key auto_increment,
ma_may varchar(10),
id_kh int,
thoi_gian_bat_dau datetime,
thoi_gian_ket_thuc datetime,
tong_tien int,
foreign key (ma_may) references computer(ma_may),
foreign key (id_kh) references khach_hang(id_kh)
);
create table su_dung_dich_vu (
id_sd int,
id_dv int,
so_luong int,
primary key (id_sd, id_dv),
foreign key (id_sd) references su_dung_may(id_sd),
foreign key (id_dv) references dich_vu(id_dv)
);