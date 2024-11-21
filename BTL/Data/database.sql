CREATE DATABASE LMS

CREATE TABLE tblUser (
    PK_iID INT IDENTITY(1,1) PRIMARY KEY,
    sUsername NVARCHAR(50) NOT NULL,
    sPassword NVARCHAR(50) NOT NULL,
    iRole INT NOT NULL,
    sEmail VARCHAR(100),
    CONSTRAINT chk_iRole CHECK (iRole BETWEEN 0 AND 2)) -- 0: Student, 1: Instructor, 2: Administrator

CREATE TABLE tblCategory (
    PK_iID INT IDENTITY(1,1) PRIMARY KEY,
    sName NVARCHAR(100))

CREATE TABLE tblCourse (
    PK_iID INT IDENTITY(1,1) PRIMARY KEY,
    sName NVARCHAR(100),
    sDescription NVARCHAR(255),
    sImage VARCHAR(100),
    FK_iIDInstructor INT,
    FK_iIDCategory INT,
    FOREIGN KEY (FK_iIDInstructor) REFERENCES tblUser(PK_iID),
    FOREIGN KEY (FK_iIDCategory) REFERENCES tblCategory(PK_iID))

CREATE TABLE tblStudentCourse (
    PK_iID INT IDENTITY(1,1) PRIMARY KEY,
    FK_iIDUser INT,
    FK_iIDCourse INT,
    FOREIGN KEY (FK_iIDUser) REFERENCES tblUser(PK_iID),
    FOREIGN KEY (FK_iIDCourse) REFERENCES tblCourse(PK_iID))

CREATE TABLE tblLecture (
    PK_iID INT IDENTITY(1,1) PRIMARY KEY,
    FK_iIDCourse INT,
    sName NVARCHAR(100),
    dStart DATETIME,
    dEnd DATETIME,
    iStatus INT,
    sUrl VARCHAR(255),
    FOREIGN KEY (FK_iIDCourse) REFERENCES tblCourse(PK_iID),
    CONSTRAINT chk_iStatus CHECK (iStatus BETWEEN 0 AND 2)) -- 0: Scheduled, 1: Completed, 2: Canceled

CREATE TABLE tblAssignment (
    PK_iID INT IDENTITY(1,1) PRIMARY KEY,
    sName NVARCHAR(100),
    sDescrition NVARCHAR(255),
    FK_iIDLecture INT,
    dDueDate DATETIME,
    sUrl VARCHAR(255),
    FOREIGN KEY (FK_iIDLecture) REFERENCES tblLecture(PK_iID))

INSERT INTO tblUser (sUsername, sPassword, iRole, sEmail)
VALUES 
(N'Nguyễn Văn A', '1', 0, 'test1@gmail.com'), -- Student
(N'Nguyễn Văn B', '1', 1, 'test2@gmail.com'), -- Instructor
(N'Nguyễn Văn C', '1', 2, 'admin@gmail.com'); -- Administrator

INSERT INTO tblCategory (sName)
VALUES 
(N'Phát triển Web'),
(N'Khoa học Dữ liệu'),
(N'An ninh Mạng'),
(N'Điện toán Đám mây'),
(N'Trí tuệ Nhân tạo');

INSERT INTO tblCourse (sName, sDescription, sImage, FK_iIDInstructor, FK_iIDCategory)
VALUES 
(N'HTML & CSS Cơ bản', N'Học cách xây dựng trang web cơ bản với HTML và CSS.', 'html_css.jpg', 2, 1),
(N'Python cho Khoa học Dữ liệu', N'Hướng dẫn đầy đủ về Python cho phân tích dữ liệu và học máy.', 'python_ds.jpg', 2, 2),
(N'Nhập môn An ninh Mạng', N'Tìm hiểu cách bảo mật hệ thống và bảo vệ dữ liệu.', 'cybersecurity.jpg', 2, 3),
(N'AWS Cơ bản', N'Hiểu các khái niệm cơ bản về điện toán đám mây với AWS.', 'aws_cloud.jpg', 2, 4),
(N'Học Máy Cơ bản', N'Khám phá thế giới học máy và trí tuệ nhân tạo.', 'ml_basics.jpg', 2, 5);

INSERT INTO tblStudentCourse (FK_iIDUser, FK_iIDCourse)
VALUES 
(1, 1), -- Sinh viên 1 tham gia khóa học HTML & CSS Cơ bản
(1, 2), -- Sinh viên 1 tham gia khóa học Python cho Khoa học Dữ liệu
(1, 5); -- Sinh viên 1 tham gia khóa học Học Máy Cơ bản

INSERT INTO tblLecture (FK_iIDCourse, sName, dStart, dEnd, iStatus, sUrl)
VALUES 
(1, N'Giới thiệu về HTML', '2024-11-25 10:00:00', '2024-11-25 12:00:00', 0, 'http://lms.com/baihoc/html_gioithieu'),
(2, N'Python Cơ bản', '2024-11-26 14:00:00', '2024-11-26 16:00:00', 0, 'http://lms.com/baihoc/python_coban'),
(5, N'Nhập môn Học Máy', '2024-11-27 10:00:00', '2024-11-27 12:00:00', 0, 'http://lms.com/baihoc/ml_nhapmon');

INSERT INTO tblAssignment (sName, sDescrition, FK_iIDLecture, dDueDate, sUrl)
VALUES 
(N'Thực hành HTML', N'Xây dựng một trang HTML đơn giản.', 1, '2024-12-01 23:59:59', 'http://lms.com/baitap/html_thuchanh'),
(N'Bài tập Python', N'Hoàn thành các bài tập lập trình Python.', 2, '2024-12-02 23:59:59', 'http://lms.com/baitap/python_baitap'),
(N'Đề xuất Dự án Học Máy', N'Nộp đề xuất cho dự án học máy của bạn.', 3, '2024-12-03 23:59:59', 'http://lms.com/baitap/ml_dexuat');

GO
CREATE OR ALTER VIEW vCourse AS
SELECT tblCourse.PK_iID AS 'iIDCourse', tblCategory.PK_iID AS 'iIDCategory', tblCategory.sName AS 'sNameCategory', tblCourse.sName AS 'sNameCourse', tblUser.sUsername AS 'sNameInstructor', tblCourse.sDescription, tblCourse.sImage
FROM tblCourse INNER JOIN tblCategory ON tblCourse.FK_iIDCategory = tblCategory.PK_iID INNER JOIN tblUser ON tblUser.PK_iID = tblCourse.FK_iIDInstructor

GO
CREATE OR ALTER VIEW vLecture AS
SELECT iIDCourse, sNameCourse, sNameInstructor, sName AS 'sNameLecture', dStart, dEnd, iStatus
FROM tblLecture INNER JOIN vCourse ON tblLecture.FK_iIDCourse = vCourse.iIDCourse
