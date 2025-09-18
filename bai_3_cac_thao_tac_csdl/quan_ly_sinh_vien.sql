CREATE DATABASE QuanLySinhVien;
USE QuanLySinhVien;
CREATE TABLE Class
(
    ClassID   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ClassName VARCHAR(60) NOT NULL,
    StartDate DATETIME    NOT NULL,
    Status    BIT
);
CREATE TABLE Student
(
    StudentId   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    StudentName VARCHAR(30) NOT NULL,
    Address     VARCHAR(50),
    Phone       VARCHAR(20),
    Status      BIT,
    ClassId     INT         NOT NULL,
    FOREIGN KEY (ClassId) REFERENCES Class (ClassID)
);
CREATE TABLE Subject
(
    SubId   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    SubName VARCHAR(30) NOT NULL,
    Credit  TINYINT     NOT NULL DEFAULT 1 CHECK ( Credit >= 1 ),
    Status  BIT                  DEFAULT 1
);

CREATE TABLE Mark
(
    MarkId    INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    SubId     INT NOT NULL,
    StudentId INT NOT NULL,
    Mark      FLOAT   DEFAULT 0 CHECK ( Mark BETWEEN 0 AND 100),
    ExamTimes TINYINT DEFAULT 1,
    UNIQUE (SubId, StudentId),
    FOREIGN KEY (SubId) REFERENCES Subject (SubId),
    FOREIGN KEY (StudentId) REFERENCES Student (StudentId)
);
INSERT INTO Class (ClassName, StartDate, Status)
VALUES
 ('CNTT1', '2025-09-01 08:00:00', 1),
 ('CNTT2', '2025-12-05 08:00:00', 1),
 ('QTKD1', '2025-10-10 08:00:00', 1);
 INSERT INTO Subject (SubName, Credit, Status)
VALUES
 ('Lap Trinh Java', 4, 1),
 ('Co So Du Lieu',  3, 1),
 ('Toan Cao Cap',   5, 1),
 ('Marketing',      2, 1);
 INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES
 ('Nguyen Van Hung',   'Ha Noi',  '0911111111', 1, 1),
 ('Tran Hai Nguyen',   'Da Nang', '0922222222', 1, 1),
 ('Le Hoang Minh',     'Hue',     '0933333333', 1, 2),
 ('Pham Hieu Tran',    'HCM',     '0944444444', 1, 3),
 ('Nguyen Lan Anh',    'Ha Noi',  '0955555555', 1, 2),
 ('Pham Ngoc Bich',    'HCM',     '0966666666', 1, 3);
 INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes)
VALUES
 (1, 1, 88, 1), 
 (2, 1, 92, 1),
 (3, 2, 75, 1),  
 (1, 3, 82, 1),   
 (2, 3, 85, 1),
 (3, 4, 90, 1),  
 (1, 5, 70, 1),  
 (2, 6, 78, 1);
 select * from Student;
 -- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select *
from student
where studentname regexp '(^| ).* h[^ ]*$';
 -- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
 select *
from Class
where month(StartDate) = 12;
 -- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
 select *
 from subject
 where credit between 3 and 5;
 -- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
update student
set classId = 2
where studentName = 'Hung'
limit 1;
 -- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
 select s.studentName, sub.subname, m.mark
from mark m
join student s on m.studentId = s.studentId
join subject sub on m.subId = sub.subId
order by m.mark desc, s.studentname;
 -- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select * 
from subject
order by credit desc
limit 1;
 -- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select s.*, m.mark
from subject s
join mark m on s.subId = m.subId
order by m.Mark desc
limit 1;
 -- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
 select s.studentid,s.studentname,avg(m.mark) as avgmark
 from student s join mark m on s.studentid=m.studentid
 group by s.studentid, s.studentname
 order by avgmark desc;
 