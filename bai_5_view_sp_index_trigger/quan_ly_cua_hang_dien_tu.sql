CREATE DATABASE quan_ly_cua_hang_may_tinh;
USE quan_ly_cua_hang_may_tinh;
CREATE TABLE Products (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    productCode VARCHAR(50) NOT NULL,
    productName VARCHAR(100) NOT NULL,
    productPrice DECIMAL(10,2) NOT NULL,
    productAmount INT NOT NULL,
    productDescription TEXT,
    productStatus TINYINT(1) DEFAULT 1 
);
INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
VALUES
('P001', 'Bàn phím cơ', 850000, 20, 'Bàn phím cơ LED RGB', 1),
('P002', 'Chuột gaming', 450000, 35, 'Chuột không dây DPI cao', 1),
('P003', 'Tai nghe bluetooth', 550000, 15, 'Tai nghe chống ồn', 1),
('P004', 'Màn hình 24 inch', 3200000, 10, 'Màn hình IPS full HD', 1),
('P005', 'Ổ cứng SSD 512GB', 1200000, 25, 'SSD tốc độ cao', 0);
select * 
from products;
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create index i_products on products(productcode);
create unique index i_productCode on products(productcode);

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index i_product_name_price
on products(productName, productprice);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select * from products;

-- So sánh câu truy vấn trước và sau khi tạo index
explain select * from products where productname = 'Chuột gaming' and productprice > 400000;

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view w_product as select productcode, productname, productprice, productstatus
from products;
select * from w_product;

-- Tiến hành sửa đổi view
update w_product set productprice= 500000 
where productcode='P002';

-- Tiến hành xoá view
drop view w_product;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure getallproducts()
begin
select *
from products;
end //
delimiter ;
CALL GetAllProducts();
-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure addproduct(in p_productCode varchar(50),in p_productName varchar(100),in p_productPrice decimal(10,2),in p_productAmount int,in p_productDescription text,in p_productStatus int)
begin
insert into products (productCode, productName, productPrice, productAmount, productDescription, productStatus)
value (p_productCode, p_productName, p_productPrice, p_productAmount, p_productDescription, p_productStatus);
end //
delimiter ;
call addproduct('P006','Loa Bluetooth', 700000, 12, 'Loa mini chống nước', 1);
-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure updateproductbyid(in p_id int,in p_productCode varchar(50),in p_productName varchar(100),in p_productPrice decimal(10,2),in p_productAmount int,in p_productDescription text,in p_productStatus int )
begin 
update products
set productCode = p_productCode,productName = p_productName,productPrice= p_productPrice,productAmount= p_productAmount,productDescription = p_productDescription,productStatus = p_productStatus
where id =p_id
delimiter ;
call updateproductbyid( 2,'P002','Chuột gaming cao cấp',480000,40,'Chuột không dây DPI cao – bản mới',1);
select * 
from products;
-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure deleteproductbyid(in p_id int)
begin
delete from products where id =p_id;
end //
delimiter ;
call deleteproductbyid(6);


