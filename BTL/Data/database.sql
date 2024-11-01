CREATE DATABASE LMS

CREATE TABLE tblUser (
    PK_iID INT IDENTITY(1,1) PRIMARY KEY,
    sUsername NVARCHAR(50) NOT NULL,
    sPassword NVARCHAR(50) NOT NULL,
    iRole INT NOT NULL,
    sEmail VARCHAR(100),
    CONSTRAINT chk_iRole CHECK (iRole BETWEEN 0 AND 2)) -- 0: Student, 1: Instructor, 2: Administrator

CREATE TABLE tblCourse (
    PK_iID INT IDENTITY(1,1) PRIMARY KEY,
    sName NVARCHAR(100),
    sDescription NVARCHAR(255),
    sImage VARCHAR(100),
    FP_iIDCreate INT,
    FOREIGN KEY (FP_iIDCreate) REFERENCES tblUser(PK_iID))

CREATE TABLE tblClassroom (
    iID INT IDENTITY(1,1) PRIMARY KEY,
    sName NVARCHAR(100),
    FK_iIDCourse INT,
    FK_iIDInstructor INT,
    dStart DATETIME,
    dEnd DATETIME,
    FOREIGN KEY (FK_iIDCourse) REFERENCES tblCourse(PK_iID),
    FOREIGN KEY (FK_iIDInstructor) REFERENCES tblUser(PK_iID))

CREATE TABLE tblClassSession (
    iID INT IDENTITY(1,1) PRIMARY KEY,
    sName NVARCHAR(100),
    FK_iIDClassroom INT,
    dStart DATETIME,
    dEnd DATETIME,
    iStatus INT,
    sUrl VARCHAR(255),
    FOREIGN KEY (FK_iIDClassroom) REFERENCES tblClassroom(PK_iID),
    CONSTRAINT chk_iStatus CHECK (iStatus BETWEEN 0 AND 2)) -- 0: Scheduled, 1: Completed, 2: Canceled


CREATE TABLE tblAssignments (
    PK_iID INT IDENTITY(1,1) PRIMARY KEY,
    sName NVARCHAR(100),
    sDescrition NVARCHAR(255),
    FK_iIDCourse INT,
    dDueDate DATETIME,
    sUrl VARCHAR(255),
    FOREIGN KEY (FK_iIDCourse) REFERENCES tblCourse(PK_iID))

CREATE TABLE tblMaterials (
    PK_iID INT IDENTITY(1,1) PRIMARY KEY,
    FK_iIDClassroom INT,
    sName NVARCHAR(100),
    sURl VARCHAR(255),
    FOREIGN KEY (FK_iIDClassroom) REFERENCES tblClassroom(PK_iID))


    


