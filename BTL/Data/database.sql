CREATE DATABASE LMS

CREATE TABLE tblUser (
    PK_iID INT IDENTITY(1,1) PRIMARY KEY,
    sName NVARCHAR(50) NOT NULL,
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
    FK_iIDCreate INT,
    FK_iIDCategory INT,
    FOREIGN KEY (FK_iIDCreate) REFERENCES tblUser(PK_iID),
    FOREIGN KEY (FK_iIDCategory) REFERENCES tblCategory(PK_iID))
    
CREATE TABLE tblStudentCourse (
    PK_iID INT IDENTITY(1,1) PRIMARY KEY,
    FK_iIDUser INT,
    FK_iIDCourse INT,
    FOREIGN KEY (FK_iIDUser) REFERENCES tblUser(PK_iID),
    FOREIGN KEY (FK_iIDCourse) REFERENCES tblCourse(PK_iID))
    
CREATE TABLE tblInstructorCourse (
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
    


