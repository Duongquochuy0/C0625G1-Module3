create database quan_ly_hang_hoa;
use quan_ly_hang_hoa;

create table nha_cung_cap (
id_ncc int primary key,
ten varchar(50),
dia_chi varchar(50)
);

create table vat_tu (
ma_vat_tu int primary key,
name varchar(50)
);

create table phieu_xuat (
so_px varchar(50) primary key,
ngay_xuat date
);

create table phieu_nhap (
so_pn varchar(50) primary key,
ngay_nhap date
);

create table chi_tiet_phieu_xuat (
so_px varchar(50),
ma_vat_tu int,
so_luong_xuat int,
don_gia_xuat int,
primary key (so_px, ma_vat_tu),
foreign key (so_px) references phieu_xuat(so_px),
foreign key (ma_vat_tu) references vat_tu(ma_vat_tu)
);

create table chi_tiet_phieu_nhap (
so_pn varchar(50),
ma_vat_tu int,
so_luong_nhap int,
don_gia_nhap int,
primary key (so_pn, ma_vat_tu),
foreign key (so_pn) references phieu_nhap(so_pn),
foreign key (ma_vat_tu) references vat_tu(ma_vat_tu)
);

create table don_dat_hang (
so_don_hang char(10) primary key,
ngay_dat_hang date,
id_ncc int,
foreign key (id_ncc) references nha_cung_cap(id_ncc)
);

create table chi_tiet_don_dat_hang (
so_don_hang char(10),
ma_vat_tu int,
so_luong int,
primary key (so_don_hang, ma_vat_tu),
foreign key (so_don_hang) references don_dat_hang(so_don_hang),
foreign key (ma_vat_tu) references vat_tu(ma_vat_tu)
);

create table cung_cap (
id_ncc int,
ma_vat_tu int,
primary key (id_ncc, ma_vat_tu),
foreign key (id_ncc) references nha_cung_cap(id_ncc),
foreign key (ma_vat_tu) references vat_tu(ma_vat_tu)
);
create table so_dien_thoai_nha_cung_cap(
id_ncc int,
so_dien_thoai varchar(10),
primary key(id_ncc,so_dien_thoai),
foreign key (id_ncc) references nha_cung_cap(id_ncc)
);
