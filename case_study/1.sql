-- 1. Tạo database
CREATE DATABASE IF NOT EXISTS tiem_cam_do;
USE tiem_cam_do;

-- 2. Bảng KHACH_HANG
CREATE TABLE KHACH_HANG (
  ma_khach_hang INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  ho_ten        VARCHAR(200) NOT NULL,
  so_cmnd       VARCHAR(50) UNIQUE,
  so_dien_thoai VARCHAR(20),
  dia_chi       VARCHAR(300),
  ngay_tao      DATETIME DEFAULT CURRENT_TIMESTAMP,
  trang_thai    TINYINT DEFAULT 1 COMMENT '1=active,0=inactive',
  email         VARCHAR(150)
) ENGINE=InnoDB;

-- 3. Bảng NHAN_VIEN
CREATE TABLE NHAN_VIEN (
  ma_nhan_vien  INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  ho_ten        VARCHAR(200) NOT NULL,
  chuc_vu       VARCHAR(100),
  so_dien_thoai VARCHAR(20),
  email         VARCHAR(150),
  ngay_tao      DATETIME DEFAULT CURRENT_TIMESTAMP,
  trang_thai    TINYINT DEFAULT 1
) ENGINE=InnoDB;

-- 4. Bảng HOP_DONG_CAM_DO
CREATE TABLE HOP_DONG_CAM_DO (
  ma_hop_dong   INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  ma_khach_hang INT UNSIGNED NOT NULL,
  ma_nhan_vien  INT UNSIGNED NOT NULL,
  ngay_cam      DATE NOT NULL,
  ngay_het_han  DATE NOT NULL,
  tong_tien_vay DECIMAL(15,2) NOT NULL,
  lai_suat      DECIMAL(5,2) DEFAULT 0.00,
  trang_thai    ENUM('DANG_CAM','DA_CHUOC','THANH_LY') DEFAULT 'DANG_CAM',
  ghi_chu       TEXT,
  ngay_tao      DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (ma_khach_hang) REFERENCES KHACH_HANG(ma_khach_hang)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  FOREIGN KEY (ma_nhan_vien) REFERENCES NHAN_VIEN(ma_nhan_vien)
    ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

-- 5. Bảng TAI_SAN_CAM
CREATE TABLE TAI_SAN_CAM (
  ma_tai_san       INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  ma_hop_dong      INT UNSIGNED NOT NULL,
  loai_tai_san     VARCHAR(100) NOT NULL,
  mo_ta_chi_tiet   VARCHAR(500),
  gia_tri_dinh_gia DECIMAL(15,2) NOT NULL,
  trang_thai       ENUM('CAM','DA_CHUOC','DA_THANH_LY') DEFAULT 'CAM',
  ngay_nhap        DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (ma_hop_dong) REFERENCES HOP_DONG_CAM_DO(ma_hop_dong)
    ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

-- 6. Bảng THANH_TOAN
CREATE TABLE THANH_TOAN (
  ma_thanh_toan    INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  ma_hop_dong      INT UNSIGNED NOT NULL,
  ngay_thanh_toan  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  so_tien          DECIMAL(15,2) NOT NULL,
  loai_thanh_toan  ENUM('LAI','CHUOC','KHAC') NOT NULL,
  ghi_chu          VARCHAR(500),
  FOREIGN KEY (ma_hop_dong) REFERENCES HOP_DONG_CAM_DO(ma_hop_dong)
    ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

-- 7. Bảng THANH_LY
CREATE TABLE THANH_LY (
  ma_thanh_ly   INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  ma_tai_san    INT UNSIGNED NOT NULL,
  ngay_thanh_ly DATE NOT NULL,
  gia_ban       DECIMAL(15,2) NOT NULL,
  nguoi_mua     VARCHAR(200),
  ghi_chu       TEXT,
  ngay_tao      DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (ma_tai_san) REFERENCES TAI_SAN_CAM(ma_tai_san)
    ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

-- (Tuỳ chọn) Tạo các chỉ mục thường dùng
CREATE INDEX idx_hopdong_trangthai  ON HOP_DONG_CAM_DO(trang_thai);
CREATE INDEX idx_taisan_trangthai   ON TAI_SAN_CAM(trang_thai);
CREATE INDEX idx_thanhtoan_hopdong  ON THANH_TOAN(ma_hop_dong);
CREATE INDEX idx_thanhly_taisan     ON THANH_LY(ma_tai_san);
