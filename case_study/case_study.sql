CREATE DATABASE quan_ly_furama;
USE quan_ly_furama;

-- 1. Bảng vị trí
CREATE TABLE vi_tri (
    ma_vi_tri INT PRIMARY KEY AUTO_INCREMENT,
    ten_vi_tri VARCHAR(45)
);

-- 2. Bảng trình độ
CREATE TABLE trinh_do (
    ma_trinh_do INT PRIMARY KEY AUTO_INCREMENT,
    ten_trinh_do VARCHAR(45)
);

-- 3. Bảng bộ phận
CREATE TABLE bo_phan (
    ma_bo_phan INT PRIMARY KEY AUTO_INCREMENT,
    ten_bo_phan VARCHAR(45)
);

-- 4. Bảng nhân viên
CREATE TABLE nhan_vien (
    ma_nhan_vien INT PRIMARY KEY AUTO_INCREMENT,
    ho_ten VARCHAR(45),
    ngay_sinh DATE,
    so_cmnd VARCHAR(45),
    luong DOUBLE,
    so_dien_thoai VARCHAR(45),
    email VARCHAR(45),
    dia_chi VARCHAR(45),
    ma_vi_tri INT,
    ma_trinh_do INT,
    ma_bo_phan INT,
    FOREIGN KEY (ma_vi_tri) REFERENCES vi_tri(ma_vi_tri),
    FOREIGN KEY (ma_trinh_do) REFERENCES trinh_do(ma_trinh_do),
    FOREIGN KEY (ma_bo_phan) REFERENCES bo_phan(ma_bo_phan)
);

-- 5. Bảng loại khách
CREATE TABLE loai_khach (
    ma_loai_khach INT PRIMARY KEY AUTO_INCREMENT,
    ten_loai_khach VARCHAR(45)
);

-- 6. Bảng khách hàng
CREATE TABLE khach_hang (
    ma_khach_hang INT PRIMARY KEY AUTO_INCREMENT,
    ma_loai_khach INT,
    ho_ten VARCHAR(45),
    ngay_sinh DATE,
    gioi_tinh BIT(1),
    so_cmnd VARCHAR(45),
    so_dien_thoai VARCHAR(45),
    email VARCHAR(45),
    dia_chi VARCHAR(45),
    FOREIGN KEY (ma_loai_khach) REFERENCES loai_khach(ma_loai_khach)
);

-- 7. Bảng kiểu thuê
CREATE TABLE kieu_thue (
    ma_kieu_thue INT PRIMARY KEY AUTO_INCREMENT,
    ten_kieu_thue VARCHAR(45)
);

-- 8. Bảng loại dịch vụ
CREATE TABLE loai_dich_vu (
    ma_loai_dich_vu INT PRIMARY KEY AUTO_INCREMENT,
    ten_loai_dich_vu VARCHAR(45)
);

-- 9. Bảng dịch vụ
CREATE TABLE dich_vu (
    ma_dich_vu INT PRIMARY KEY AUTO_INCREMENT,
    ten_dich_vu VARCHAR(45),
    dien_tich INT,
    chi_phi_thue DOUBLE,
    so_nguoi_toi_da INT,
    ma_kieu_thue INT,
    ma_loai_dich_vu INT,
    tieu_chuan_phong VARCHAR(45),
    mo_ta_tien_nghi_khac VARCHAR(45),
    dien_tich_ho_boi DOUBLE,
    so_tang INT,
    FOREIGN KEY (ma_kieu_thue) REFERENCES kieu_thue(ma_kieu_thue),
    FOREIGN KEY (ma_loai_dich_vu) REFERENCES loai_dich_vu(ma_loai_dich_vu)
);

-- 10. Bảng hợp đồng
CREATE TABLE hop_dong (
    ma_hop_dong INT PRIMARY KEY AUTO_INCREMENT,
    ngay_lam_hop_dong DATETIME,
    ngay_ket_thuc DATETIME,
    tien_dat_coc DOUBLE,
    ma_nhan_vien INT,
    ma_khach_hang INT,
    ma_dich_vu INT,
    FOREIGN KEY (ma_nhan_vien) REFERENCES nhan_vien(ma_nhan_vien),
    FOREIGN KEY (ma_khach_hang) REFERENCES khach_hang(ma_khach_hang),
    FOREIGN KEY (ma_dich_vu) REFERENCES dich_vu(ma_dich_vu)
);

-- 11. Bảng dịch vụ đi kèm
CREATE TABLE dich_vu_di_kem (
    ma_dich_vu_di_kem INT PRIMARY KEY AUTO_INCREMENT,
    ten_dich_vu_di_kem VARCHAR(45),
    gia DOUBLE,
    don_vi VARCHAR(10),
    trang_thai VARCHAR(45)
);

-- 12. Bảng hợp đồng chi tiết
CREATE TABLE hop_dong_chi_tiet (
    ma_hop_dong_chi_tiet INT PRIMARY KEY AUTO_INCREMENT,
    ma_hop_dong INT,
    ma_dich_vu_di_kem INT,
    so_luong INT,
    FOREIGN KEY (ma_hop_dong) REFERENCES hop_dong(ma_hop_dong),
    FOREIGN KEY (ma_dich_vu_di_kem) REFERENCES dich_vu_di_kem(ma_dich_vu_di_kem)
);
INSERT INTO vi_tri (ten_vi_tri) VALUES
('Manager'), ('Reception'), ('Cleaner');

-- trinh_do
INSERT INTO trinh_do (ten_trinh_do) VALUES
('College'), ('Bachelor');

-- bo_phan
INSERT INTO bo_phan (ten_bo_phan) VALUES
('Sales'), ('Operations');

-- nhan_vien
INSERT INTO nhan_vien (ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_phan)
VALUES
('Duong Quoc Huy', '1990-05-10', '123456789', 1200, '0901111000', 'huy@example.com', 'Huế', 1, 2, 1),
('Nguyen Nhat Thanh', '1985-02-20', '223456789', 1500, '0902222000', 'thanh@example.com', 'Quảng Trị', 1, 1, 2),
('Nguyen Ngoc Thoi', '1992-11-03', '323456789', 900, '0903333000', 'khanh@example.com', 'Đà Nẵng', 2, 2, 2),
('Nguyen Dang Thien An', '1980-01-01', '423456789', 800, '0904444000', 'a@example.com', 'Hà Nội', 3, 1, 1),
('Le Gia Khiem', '1980-01-01', '423456789', 800, '0904444000', 'a@example.com', 'Quảng Nam', 3, 1, 1);

-- loai_khach
INSERT INTO loai_khach (ten_loai_khach) VALUES
('Diamond'), ('Gold'), ('Silver');

INSERT INTO khach_hang (ma_loai_khach, ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi)
VALUES
(1, 'Duong Quoc Huy', '1995-06-15', 1, '900111222', '0910000001', 'dk1@example.com', 'Vinh'),   
(1, 'Nguyen Van B', '1988-04-01', 0, '900111223', '0910000002', 'dk2@example.com', 'Quảng Trị'), -- Diamond, age ~37
(1, 'Tran Van B', '1970-07-07', 1, '900111224', '0910000003', 'b@example.com', 'Vinh'), -- age >50
(2, 'Pham Thi C', '2004-09-09', 0, '900111225', '0910000004', 'c@example.com', 'Đà Nẵng'), -- age ~20
(3, 'Pham Thi D', '2004-09-09', 0, '900111225', '0910000004', 'c@example.com', 'Đà Nẵng'); -- age ~20
INSERT INTO kieu_thue (ten_kieu_thue) VALUES
('Hourly'), ('Daily'), ('Monthly');

-- loai_dich_vu
INSERT INTO loai_dich_vu (ten_loai_dich_vu) VALUES
('Villa'), ('House'), ('Room');

-- dich_vu
-- We'll create services 1..6 for variety
INSERT INTO dich_vu (ten_dich_vu, dien_tich, chi_phi_thue, so_nguoi_toi_da, ma_kieu_thue, ma_loai_dich_vu, tieu_chuan_phong, mo_ta_tien_nghi_khac, dien_tich_ho_boi, so_tang)
VALUES
('Luxury Villa A', 250, 500.00, 10, 2, 1, '5-star', 'jacuzzi', 50.0, 2),   -- id 1
('Family House B', 120, 200.00, 6, 2, 2, '4-star', 'garden', NULL, 1),     -- id 2
('Standard Room C', 30, 50.00, 2, 2, 3, '3-star', 'tv,ac', NULL, 0),      -- id 3
('Small Room D', 20, 30.00, 2, 1, 3, '2-star', 'fan', NULL, 0),           -- id 4
('Luxury Villa E', 300, 700.00, 12, 3, 1, '5-star', 'sauna', 80.0, 3),    -- id 5
('House NotBookedQ1', 150, 180.00, 5, 2, 2, '4-star', 'balcony', NULL, 1);-- id 6

-- dich_vu_di_kem (extra services)
INSERT INTO dich_vu_di_kem (ten_dich_vu_di_kem, gia, don_vi, trang_thai)
VALUES
('Breakfast', 5.00, 'per person', 'active'),   -- id 1
('Airport Pickup', 20.00, 'one-time', 'active'),-- id 2
('Extra Bed', 10.00, 'per night', 'active');   -- id 3

-- hop_dong (contracts)
-- create some contracts in 2020 and 2021, including Q1 2021 (Jan-Mar)
INSERT INTO hop_dong (ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu)
VALUES
('2024-05-05 10:00:00','2024-05-07 10:00:00', 100.00, 1, 1, 1),
('2024-07-10 09:00:00','2024-07-15 12:00:00', 80.00, 2, 1, 2),
('2024-06-15 14:00:00','2024-06-18 14:00:00', 120.00, 3, 2, 3),
('2020-11-20 08:00:00','2020-11-25 08:00:00', 80.00, 3, 3, 5),
('2021-01-20 10:00:00','2021-01-22 10:00:00', 30.00, 3, 4, 4);


-- hop_dong_chi_tiet (contract details linking extra services)
INSERT INTO hop_dong_chi_tiet (ma_hop_dong, ma_dich_vu_di_kem, so_luong)
VALUES
(1, 1, 2),
(2, 2, 1),
(3, 3, 3);

-- Hiển thị thông tin của tất cả nhân viên có tên bắt đầu bằng ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự.
select *
from nhan_vien
where left(ho_ten,1) in ('H','T','K')
and char_length(ho_ten) <= 15;
select *
from nhan_vien
where left(SUBSTRING_INDEX(ho_ten, ' ', -1), 1) in ('H','T','K')
and CHAR_LENGTH(SUBSTRING_INDEX(ho_ten, ' ', -1)) <= 15;
  
select ho_ten,REGEXP_SUBSTR(ho_ten, '[^ ]+$') as ten
from nhan_vien;
-- Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select *
from khach_hang
where TIMESTAMPDIFF(year, ngay_sinh, CURDATE()) between 18 and 50 and dia_chi in ('Đà Nẵng', 'Quảng Trị');

select *
from khach_hang
where year(CURDATE()) - year(ngay_sinh) between 18 and 50 and dia_chi in ('Đà Nẵng', 'Quảng Trị');

-- Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select kh.ma_khach_hang,kh.ho_ten,COUNT(hd.ma_hop_dong) as so_lan_dat
from khach_hang kh
join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
left join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
where lk.ten_loai_khach = 'Diamond'
group by kh.ma_khach_hang, kh.ho_ten
order by so_lan_dat asc;

-- Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
select kh.ma_khach_hang,kh.ho_ten,lk.ten_loai_khach,hd.ma_hop_dong,dv.ten_dich_vu,hd.ngay_lam_hop_dong,hd.ngay_ket_thuc,IFNULL(dv.chi_phi_thue, 0) + IFNULL(SUM(hdct.so_luong * IFNULL(dvdk.gia, 0)), 0) AS tong_tien
from khach_hang kh
left join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach left join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong left join dich_vu_di_kem dvdk  on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong,dv.ten_dich_vu, hd.ngay_lam_hop_dong,hd.ngay_ket_thuc,dv.chi_phi_thue
order by kh.ma_khach_hang, hd.ma_hop_dong;
-- Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
select dv.ma_dich_vu,dv.ten_dich_vu,dv.dien_tich,dv.chi_phi_thue,ldv.ten_loai_dich_vu
from dich_vu dv
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
where dv.ma_dich_vu not in (
    select hd.ma_dich_vu
    from hop_dong hd
    where year(hd.ngay_lam_hop_dong) = 2021
      and month(hd.ngay_lam_hop_dong) between 1 and 3
);
-- Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue,ldv.ten_loai_dich_vu
from dich_vu dv
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
where dv.ma_dich_vu in (
        select hd.ma_dich_vu
        from hop_dong hd
        where year(hd.ngay_lam_hop_dong) = 2020
)
and dv.ma_dich_vu not in (
        select hd.ma_dich_vu
        from hop_dong hd
        where year(hd.ngay_lam_hop_dong) = 2021
);
-- Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
select distinct ho_ten
from khach_hang;

-- Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

select month(hd.ngay_lam_hop_dong) as thang,COUNT(distinct hd.ma_khach_hang) as so_khach_hang
from hop_dong hd
where year(hd.ngay_lam_hop_dong) = 2021
group by month(hd.ngay_lam_hop_dong)
order by thang;

-- Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
select kh.ma_khach_hang,kh.ho_ten as ten_khach_hang,  kh.dia_chi,  lk.ten_loai_khach, hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc,
    IFNULL((
        select SUM(so_luong)
        from hop_dong_chi_tiet hdct
        where hdct.ma_hop_dong = hd.ma_hop_dong
    ), 0) as so_luong_dich_vu_di_kem,dvdk.ma_dich_vu_di_kem,dvdk.ten_dich_vu_di_kem,dvdk.gia,dvdk.don_vi,dvdk.trang_thai
from hop_dong hd
join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
where lk.ten_loai_khach = 'Diamond' and kh.dia_chi in ('Vinh','Quảng Ngãi')
order by kh.ho_ten, hd.ma_hop_dong, dvdk.ten_dich_vu_di_kem;


-- Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
select hd.ma_hop_dong,nv.ho_ten as nhan_vien,kh.ho_ten as khach_hang,kh.so_dien_thoai,dv.ten_dich_vu,IFNULL(SUM(hdct.so_luong),0) as so_luong_dich_vu_di_kem,hd.tien_dat_coc
from hop_dong as hd
join nhan_vien as nv on hd.ma_nhan_vien = nv.ma_nhan_vien
join khach_hang as kh on hd.ma_khach_hang = kh.ma_khach_hang
join dich_vu as dv on hd.ma_dich_vu = dv.ma_dich_vu
left join hop_dong_chi_tiet as hdct on hd.ma_hop_dong = hdct.ma_hop_dong
where hd.ngay_lam_hop_dong between '2020-10-01' and '2020-12-31'
    and dv.ma_dich_vu not in (
        select distinct hd2.ma_dich_vu
        from hop_dong hd2
        where hd2.ngay_lam_hop_dong between '2021-01-01' and '2021-06-30'
    )
group by hd.ma_hop_dong,nv.ho_ten,kh.ho_ten,kh.so_dien_thoai,dv.ten_dich_vu,hd.tien_dat_coc
order by hd.ma_hop_dong;
-- Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
select dvdk.ma_dich_vu_di_kem,dvdk.ten_dich_vu_di_kem,SUM(hdct.so_luong) as tong_so_lan_su_dung
from dich_vu_di_kem as dvdk
join hop_dong_chi_tiet as hdct on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
join hop_dong as hd on hdct.ma_hop_dong = hd.ma_hop_dong
group by dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem
having SUM(hdct.so_luong) = (
    select MAX(tong_su_dung)
    from (
        select SUM(hdct2.so_luong) as tong_su_dung
        from hop_dong_chi_tiet hdct2
        group by hdct2.ma_dich_vu_di_kem
    ) as t
);
-- Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).
select hd.ma_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem, COUNT(hdct.ma_dich_vu_di_kem) AS so_lan_su_dung
from hop_dong_chi_tiet as hdct
join dich_vu_di_kem as dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
join hop_dong as hd on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu as dv on hd.ma_dich_vu = dv.ma_dich_vu
join loai_dich_vu as ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
group by hd.ma_hop_dong,ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem
having COUNT(hdct.ma_dich_vu_di_kem) = 1
order by hd.ma_hop_dong;




-- Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
select nv.ma_nhan_vien,nv.ho_ten,td.ten_trinh_do,bp.ten_bo_phan,nv.so_dien_thoai,nv.dia_chi,COUNT(hd.ma_hop_dong) as so_hop_dong
from nhan_vien as nv
join trinh_do as td on nv.ma_trinh_do = td.ma_trinh_do
join bo_phan as bp on nv.ma_bo_phan = bp.ma_bo_phan
left join hop_dong as hd  on nv.ma_nhan_vien = hd.ma_nhan_vien and hd.ngay_lam_hop_dong between '2020-01-01' and '2021-12-31'
group by nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoai,nv.dia_chi
having COUNT(hd.ma_hop_dong) <= 3
order by nv.ma_nhan_vien;
-- Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
delete from nhan_vien
where ma_nhan_vien not in (
    select distinct ma_nhan_vien
    from hop_dong
    where year(ngay_lam_hop_dong) between 2019 and 2021
);




-- Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
update khach_hang as kh
join (
    SELECT 
        hd.ma_khach_hang,
        SUM(
            dv.chi_phi_thue + IFNULL(hdct.so_luong * dvdk.gia, 0)
        ) AS tong_tien
    FROM hop_dong AS hd
    JOIN dich_vu AS dv
         ON hd.ma_dich_vu = dv.ma_dich_vu
    LEFT JOIN hop_dong_chi_tiet AS hdct
         ON hd.ma_hop_dong = hdct.ma_hop_dong
    LEFT JOIN dich_vu_di_kem AS dvdk
         ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
    WHERE YEAR(hd.ngay_lam_hop_dong) = 2021
    GROUP BY hd.ma_khach_hang
    HAVING tong_tien > 10000000
) AS t
   ON kh.ma_khach_hang = t.ma_khach_hang
JOIN loai_khach AS lk
   ON kh.ma_loai_khach = lk.ma_loai_khach
SET kh.ma_loai_khach = (
      SELECT ma_loai_khach 
      FROM loai_khach 
      WHERE ten_loai_khach = 'Diamond'
)
WHERE lk.ten_loai_khach = 'Platinum';
-- Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
-- Xóa chi tiết hợp đồng của các hợp đồng trước năm 2021
DELETE hdct
FROM hop_dong_chi_tiet AS hdct
JOIN hop_dong AS hd ON hdct.ma_hop_dong = hd.ma_hop_dong
WHERE YEAR(hd.ngay_lam_hop_dong) < 2021;

-- Xóa các hợp đồng trước năm 2021
DELETE hd
FROM hop_dong AS hd
WHERE YEAR(hd.ngay_lam_hop_dong) < 2021;

-- 3️⃣ Xóa các khách hàng chỉ có hợp đồng trước 2021
DELETE kh
FROM khach_hang AS kh
WHERE NOT EXISTS (
    SELECT 1
    FROM hop_dong AS hd
    WHERE hd.ma_khach_hang = kh.ma_khach_hang
);
-- Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
UPDATE dich_vu_di_kem AS dvdk
JOIN (
    SELECT hdct.ma_dich_vu_di_kem
    FROM hop_dong_chi_tiet AS hdct
    JOIN hop_dong AS hd ON hdct.ma_hop_dong = hd.ma_hop_dong
    WHERE YEAR(hd.ngay_lam_hop_dong) = 2020
    GROUP BY hdct.ma_dich_vu_di_kem
    HAVING SUM(hdct.so_luong) > 10
) AS t
ON dvdk.ma_dich_vu_di_kem = t.ma_dich_vu_di_kem
SET dvdk.gia = dvdk.gia * 2;
-- Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
SELECT 
    ma_nhan_vien     AS id,
    ho_ten,
    email,
    so_dien_thoai,
    ngay_sinh,
    dia_chi,
    'NhanVien'       AS loai
FROM nhan_vien

UNION ALL

SELECT 
    ma_khach_hang    AS id,
    ho_ten,
    email,
    so_dien_thoai,
    ngay_sinh,
    dia_chi,
    'KhachHang'      AS loai
FROM khach_hang;
-- Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.
CREATE VIEW v_nhan_vien AS
SELECT DISTINCT nv.*
FROM nhan_vien AS nv
JOIN hop_dong AS hd
       ON nv.ma_nhan_vien = hd.ma_nhan_vien
WHERE nv.dia_chi = 'Hải Châu'
  AND DATE(hd.ngay_lam_hop_dong) = '2019-12-12';

-- Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.
UPDATE v_nhan_vien
SET dia_chi = 'Liên Chiểu';
-- Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.

DELIMITER $$

CREATE PROCEDURE sp_xoa_khach_hang (
    IN p_ma_khach_hang INT
)
BEGIN
    -- Xóa khách hàng theo mã được truyền vào
    DELETE FROM khach_hang
    WHERE ma_khach_hang = p_ma_khach_hang;
END $$

DELIMITER ;
-- Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.
DELIMITER $$

CREATE PROCEDURE sp_them_moi_hop_dong (
    IN p_ma_hop_dong     INT,
    IN p_ngay_lam_hop_dong DATE,
    IN p_ngay_ket_thuc     DATE,
    IN p_tien_dat_coc      DECIMAL(15,2),
    IN p_ma_nhan_vien      INT,
    IN p_ma_khach_hang     INT,
    IN p_ma_dich_vu        INT
)
BEGIN
    -- 1. Kiểm tra trùng khóa chính
    IF EXISTS (SELECT 1
               FROM hop_dong
               WHERE ma_hop_dong = p_ma_hop_dong) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Mã hợp đồng đã tồn tại.';
    END IF;

    -- 2. Kiểm tra tính toàn vẹn tham chiếu (các mã liên quan phải tồn tại)
    IF NOT EXISTS (SELECT 1 FROM nhan_vien WHERE ma_nhan_vien = p_ma_nhan_vien) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Mã nhân viên không tồn tại.';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM khach_hang WHERE ma_khach_hang = p_ma_khach_hang) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Mã khách hàng không tồn tại.';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM dich_vu WHERE ma_dich_vu = p_ma_dich_vu) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Mã dịch vụ không tồn tại.';
    END IF;

    -- 3. Chèn dữ liệu vào bảng hop_dong
    INSERT INTO hop_dong (
        ma_hop_dong,
        ngay_lam_hop_dong,
        ngay_ket_thuc,
        tien_dat_coc,
        ma_nhan_vien,
        ma_khach_hang,
        ma_dich_vu
    )
    VALUES (
        p_ma_hop_dong,
        p_ngay_lam_hop_dong,
        p_ngay_ket_thuc,
        p_tien_dat_coc,
        p_ma_nhan_vien,
        p_ma_khach_hang,
        p_ma_dich_vu
    );
END $$

DELIMITER ;
-- Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong thì hiển thị tổng số lượng bản ghi còn lại có trong bảng hop_dong ra giao diện console của database.
DELIMITER $$

CREATE TRIGGER tr_xoa_hop_dong
AFTER DELETE ON hop_dong
FOR EACH ROW
BEGIN
    -- Đếm số bản ghi còn lại và hiển thị ra console
    SELECT CONCAT('Tổng số hợp đồng còn lại: ', COUNT(*)) AS thong_bao
    FROM hop_dong;
END$$

DELIMITER ;
-- Tạo Trigger có tên tr_cap_nhat_hop_dong khi cập nhật ngày kết thúc hợp đồng, cần kiểm tra xem thời gian cập nhật có phù hợp hay không, với quy tắc sau: Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày. Nếu dữ liệu hợp lệ thì cho phép cập nhật, nếu dữ liệu không hợp lệ thì in ra thông báo “Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày” trên console của database.
DELIMITER $$

CREATE TRIGGER tr_cap_nhat_hop_dong
BEFORE UPDATE ON hop_dong
FOR EACH ROW
BEGIN
    -- Kiểm tra ngày kết thúc phải lớn hơn ngày làm hợp đồng ít nhất 2 ngày
    IF DATEDIFF(NEW.ngay_ket_thuc, NEW.ngay_lam_hop_dong) < 2 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày';
    END IF;
END$$

DELIMITER ;
-- Tạo Function thực hiện yêu cầu sau:
-- Tạo Function func_dem_dich_vu: Đếm các dịch vụ đã được sử dụng với tổng tiền là > 2.000.000 VNĐ.
-- Tạo Function func_tinh_thoi_gian_hop_dong: Tính khoảng thời gian dài nhất tính từ lúc bắt đầu làm hợp đồng đến lúc kết thúc hợp đồng mà khách hàng đã thực hiện thuê dịch vụ (lưu ý chỉ xét các khoảng thời gian dựa vào từng lần làm hợp đồng thuê dịch vụ, không xét trên toàn bộ các lần làm hợp đồng). Mã của khách hàng được truyền vào như là 1 tham số của function này.

DELIMITER $$

CREATE FUNCTION func_dem_dich_vu()
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_count INT;

    SELECT COUNT(*) INTO v_count
    FROM hop_dong hd
    JOIN dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
    LEFT JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
    LEFT JOIN dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
    GROUP BY hd.ma_hop_dong
    HAVING (dv.chi_phi_thue + IFNULL(SUM(hdct.so_luong * dvdk.gia),0)) > 2000000;

    -- Đếm số hợp đồng (dịch vụ) thỏa điều kiện
    SELECT COUNT(*) INTO v_count
    FROM (
        SELECT hd.ma_hop_dong
        FROM hop_dong hd
        JOIN dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
        LEFT JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
        LEFT JOIN dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
        GROUP BY hd.ma_hop_dong
        HAVING (dv.chi_phi_thue + IFNULL(SUM(hdct.so_luong * dvdk.gia),0)) > 2000000
    ) AS t;

    RETURN v_count;
END $$

DELIMITER ;

DELIMITER $$

CREATE FUNCTION func_tinh_thoi_gian_hop_dong(p_ma_khach_hang INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_max_days INT;

    SELECT IFNULL(MAX(DATEDIFF(ngay_ket_thuc, ngay_lam_hop_dong)),0)
    INTO v_max_days
    FROM hop_dong
    WHERE ma_khach_hang = p_ma_khach_hang;

    RETURN v_max_days;
END $$

DELIMITER ;
-- Tạo Stored Procedure sp_xoa_dich_vu_va_hd_room để tìm các dịch vụ được thuê bởi khách hàng với loại dịch vụ là “Room” từ đầu năm 2015 đến hết năm 2019 để xóa thông tin của các dịch vụ đó (tức là xóa các bảng ghi trong bảng dich_vu) và xóa những hop_dong sử dụng dịch vụ liên quan (tức là phải xóa những bản gi trong bảng hop_dong) và những bản liên quan khác.
DELIMITER $$

CREATE PROCEDURE sp_xoa_dich_vu_va_hd_room()
BEGIN
    -- B1: Xóa chi tiết hợp đồng trước
    DELETE hdct
    FROM hop_dong_chi_tiet AS hdct
    JOIN hop_dong AS hd ON hdct.ma_hop_dong = hd.ma_hop_dong
    JOIN dich_vu AS dv ON hd.ma_dich_vu = dv.ma_dich_vu
    JOIN loai_dich_vu AS ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
    WHERE ldv.ten_loai_dich_vu = 'Room'
      AND hd.ngay_lam_hop_dong BETWEEN '2015-01-01' AND '2019-12-31';

    -- B2: Xóa các hợp đồng liên quan
    DELETE hd
    FROM hop_dong AS hd
    JOIN dich_vu AS dv ON hd.ma_dich_vu = dv.ma_dich_vu
    JOIN loai_dich_vu AS ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
    WHERE ldv.ten_loai_dich_vu = 'Room'
      AND hd.ngay_lam_hop_dong BETWEEN '2015-01-01' AND '2019-12-31';

    -- B3: Xóa các dịch vụ loại Room đã được thuê trong giai đoạn đó
    DELETE dv
    FROM dich_vu AS dv
    JOIN loai_dich_vu AS ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
    WHERE ldv.ten_loai_dich_vu = 'Room'
      AND dv.ma_dich_vu IN (
          SELECT DISTINCT hd.ma_dich_vu
          FROM hop_dong hd
          WHERE hd.ngay_lam_hop_dong BETWEEN '2015-01-01' AND '2019-12-31'
      );
END$$

DELIMITER ;
