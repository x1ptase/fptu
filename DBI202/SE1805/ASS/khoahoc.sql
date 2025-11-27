
CREATE DATABASE KHOAHOC
/* ============ GLOBAL SETTINGS ============ */
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
GO

/* ============ ROLES & PERMISSIONS ============ */
CREATE TABLE Roles (
    RoleID          INT             IDENTITY(1,1) PRIMARY KEY,
    RoleName        NVARCHAR(50)    NOT NULL UNIQUE,
    Description     NVARCHAR(255)
);
GO

CREATE TABLE Permissions (
    PermissionID    INT             IDENTITY(1,1) PRIMARY KEY,
    PermissionKey   NVARCHAR(100)   NOT NULL UNIQUE,
    Description     NVARCHAR(255)
);
GO

CREATE TABLE RolePermissions (
    RoleID          INT             NOT NULL FOREIGN KEY REFERENCES Roles(RoleID) ON DELETE CASCADE,
    PermissionID    INT             NOT NULL FOREIGN KEY REFERENCES Permissions(PermissionID) ON DELETE CASCADE,
    PRIMARY KEY (RoleID, PermissionID)
);
GO

/* ============ USERS & PROFILES ============ */
CREATE TABLE Users (
    UserID          INT             IDENTITY(1,1) PRIMARY KEY,
    Email           NVARCHAR(100)   NOT NULL UNIQUE,
    PasswordHash    NVARCHAR(256)   NOT NULL,
    FirstName       NVARCHAR(50)    NOT NULL,
    LastName        NVARCHAR(50)    NOT NULL,
    Phone           NVARCHAR(20),
    BirthDate       DATE            NULL,
    Gender          CHAR(1)         CHECK (Gender IN ('M','F','O')),
    RoleID          INT             NOT NULL FOREIGN KEY REFERENCES Roles(RoleID),
    CreatedAt       DATETIME2       DEFAULT SYSDATETIME(),
    IsActive        BIT             DEFAULT 1
);
GO

/* ============ CENTERS / LOCATIONS ============ */
CREATE TABLE Centers (
    CenterID    INT             IDENTITY(1,1) PRIMARY KEY,
    Name        NVARCHAR(100)   NOT NULL,
    Address     NVARCHAR(255),
    City        NVARCHAR(100),
    Phone       NVARCHAR(20),
    Latitude    DECIMAL(9,6)    NULL,
    Longitude   DECIMAL(9,6)    NULL,
    IsActive    BIT             DEFAULT 1
);
GO

/* ============ COURSE TAXONOMY ============ */
CREATE TABLE Categories (
    CategoryID  INT             IDENTITY(1,1) PRIMARY KEY,
    Name        NVARCHAR(100)   NOT NULL UNIQUE,
    Description NVARCHAR(255)
);
GO

CREATE TABLE Courses (
    CourseID        INT             IDENTITY(1,1) PRIMARY KEY,
    Title           NVARCHAR(200)   NOT NULL,
    Slug            NVARCHAR(200)   NOT NULL UNIQUE,
    Description     NVARCHAR(MAX),
    Level           NVARCHAR(20)    CHECK (Level IN ('Beginner','Intermediate','Advanced')),
    Language        NVARCHAR(50)    DEFAULT 'Vietnamese',
    DurationHours   INT,
    Price           DECIMAL(12,2)   DEFAULT 0,
    StartDate       DATE            NULL,
    EndDate         DATE            NULL,
    CenterID        INT             NULL FOREIGN KEY REFERENCES Centers(CenterID),
    InstructorID    INT             NOT NULL FOREIGN KEY REFERENCES Users(UserID),
    ThumbnailURL    NVARCHAR(500),
    IsActive        BIT             DEFAULT 1
);
GO

CREATE TABLE CourseCategories (
    CourseID    INT NOT NULL FOREIGN KEY REFERENCES Courses(CourseID) ON DELETE CASCADE,
    CategoryID  INT NOT NULL FOREIGN KEY REFERENCES Categories(CategoryID) ON DELETE CASCADE,
    PRIMARY KEY (CourseID, CategoryID)
);
GO

CREATE TABLE CoursePrerequisites (
    CourseID        INT NOT NULL,
    PrereqCourseID  INT NOT NULL,
    PRIMARY KEY (CourseID, PrereqCourseID),
    CHECK (CourseID <> PrereqCourseID),
    -- Nếu xóa khóa học chính => xóa quan hệ
    FOREIGN KEY (CourseID)      REFERENCES Courses(CourseID) ON DELETE CASCADE,
    -- Nếu xóa khóa học tiền-quyết => chặn, yêu cầu xử lý tay
    FOREIGN KEY (PrereqCourseID) REFERENCES Courses(CourseID) ON DELETE NO ACTION
);

GO

/* ============ ENROLLMENTS & PROGRESS ============ */
CREATE TABLE Enrollments (
    EnrollmentID    INT IDENTITY(1,1) PRIMARY KEY,
    CourseID        INT NOT NULL FOREIGN KEY REFERENCES Courses(CourseID),
    StudentID       INT NOT NULL FOREIGN KEY REFERENCES Users(UserID),
    EnrollDate      DATETIME2   DEFAULT SYSDATETIME(),
    ProgressPercent DECIMAL(5,2) DEFAULT 0,
    CompletedAt     DATETIME2   NULL,
    CONSTRAINT UQ_Enroll UNIQUE (CourseID, StudentID)
);
GO

/* ============ LESSONS & CONTENT ============ */
CREATE TABLE Lessons (
    LessonID    INT IDENTITY(1,1) PRIMARY KEY,
    CourseID    INT NOT NULL FOREIGN KEY REFERENCES Courses(CourseID) ON DELETE CASCADE,
    Title       NVARCHAR(200) NOT NULL,
    Content     NVARCHAR(MAX) NULL,
    VideoURL    NVARCHAR(500) NULL,
    DurationMin INT,
    OrderIndex  INT NOT NULL
);
GO

CREATE INDEX IX_Lesson_Order ON Lessons (CourseID, OrderIndex);
GO

/* Attachments to lessons */
CREATE TABLE LessonAttachments (
    AttachmentID    INT IDENTITY(1,1) PRIMARY KEY,
    LessonID        INT NOT NULL FOREIGN KEY REFERENCES Lessons(LessonID) ON DELETE CASCADE,
    FileURL         NVARCHAR(500) NOT NULL,
    FileType        NVARCHAR(50),
    UploadedAt      DATETIME2 DEFAULT SYSDATETIME()
);
GO

/* ============ ASSESSMENTS ============ */
CREATE TABLE Assignments (
    AssignmentID    INT IDENTITY(1,1) PRIMARY KEY,
    LessonID        INT NOT NULL FOREIGN KEY REFERENCES Lessons(LessonID) ON DELETE CASCADE,
    Title           NVARCHAR(200) NOT NULL,
    Description     NVARCHAR(MAX),
    MaxScore        FLOAT         DEFAULT 100,
    DueDate         DATETIME2
);
GO

CREATE TABLE Submissions (
    SubmissionID    INT IDENTITY(1,1) PRIMARY KEY,
    AssignmentID    INT NOT NULL FOREIGN KEY REFERENCES Assignments(AssignmentID) ON DELETE CASCADE,
    StudentID       INT NOT NULL FOREIGN KEY REFERENCES Users(UserID),
    SubmitDate      DATETIME2 DEFAULT SYSDATETIME(),
    FileURL         NVARCHAR(500),
    Score           FLOAT,
    Feedback        NVARCHAR(MAX)
);
GO

/* ============ QUIZZES ============ */
CREATE TABLE Quizzes (
    QuizID      INT IDENTITY(1,1) PRIMARY KEY,
    LessonID    INT NOT NULL FOREIGN KEY REFERENCES Lessons(LessonID) ON DELETE CASCADE,
    Title       NVARCHAR(200),
    TimeLimitSec INT
);
GO

CREATE TABLE QuizQuestions (
    QuestionID  INT IDENTITY(1,1) PRIMARY KEY,
    QuizID      INT NOT NULL FOREIGN KEY REFERENCES Quizzes(QuizID) ON DELETE CASCADE,
    QuestionTxt NVARCHAR(MAX) NOT NULL,
    QuestionType NVARCHAR(20) CHECK (QuestionType IN ('single','multiple','text')),
    OrderIndex  INT NOT NULL
);
GO

CREATE TABLE QuizOptions (
    OptionID    INT IDENTITY(1,1) PRIMARY KEY,
    QuestionID  INT NOT NULL FOREIGN KEY REFERENCES QuizQuestions(QuestionID) ON DELETE CASCADE,
    OptionText  NVARCHAR(MAX) NOT NULL,
    IsCorrect   BIT DEFAULT 0
);
GO

CREATE TABLE QuizAttempts (
    AttemptID   INT IDENTITY(1,1) PRIMARY KEY,
    QuizID      INT NOT NULL FOREIGN KEY REFERENCES Quizzes(QuizID) ON DELETE CASCADE,
    StudentID   INT NOT NULL FOREIGN KEY REFERENCES Users(UserID),
    StartedAt   DATETIME2 DEFAULT SYSDATETIME(),
    FinishedAt  DATETIME2 NULL,
    Score       FLOAT      NULL
);
GO

/* ============ LIVE SESSIONS & ATTENDANCE ============ */
CREATE TABLE LiveSessions (
    SessionID       INT IDENTITY(1,1) PRIMARY KEY,
    CourseID        INT NOT NULL FOREIGN KEY REFERENCES Courses(CourseID) ON DELETE CASCADE,
    Title           NVARCHAR(200),
    StartTime       DATETIME2 NOT NULL,
    EndTime         DATETIME2 NOT NULL,
    MeetingURL      NVARCHAR(500),
    CenterID        INT NULL FOREIGN KEY REFERENCES Centers(CenterID)
);
GO

CREATE TABLE Attendance (
    AttendanceID    INT IDENTITY(1,1) PRIMARY KEY,
    SessionID       INT NOT NULL FOREIGN KEY REFERENCES LiveSessions(SessionID) ON DELETE CASCADE,
    StudentID       INT NOT NULL FOREIGN KEY REFERENCES Users(UserID),
    Status          NVARCHAR(20) CHECK (Status IN ('present','absent','late')),
    RecordedAt      DATETIME2 DEFAULT SYSDATETIME()
);
GO

/* ============ PAYMENTS & BILLING ============ */
CREATE TABLE Invoices (
    InvoiceID       INT IDENTITY(1,1) PRIMARY KEY,
    StudentID       INT NOT NULL FOREIGN KEY REFERENCES Users(UserID),
    InvoiceDate     DATETIME2 DEFAULT SYSDATETIME(),
    TotalAmount     DECIMAL(12,2) NOT NULL,
    Status          NVARCHAR(20) CHECK (Status IN ('unpaid','paid','cancelled')) DEFAULT 'unpaid'
);
GO

CREATE TABLE InvoiceItems (
    InvoiceItemID   INT IDENTITY(1,1) PRIMARY KEY,
    InvoiceID       INT NOT NULL FOREIGN KEY REFERENCES Invoices(InvoiceID) ON DELETE CASCADE,
    CourseID        INT NULL FOREIGN KEY REFERENCES Courses(CourseID),
    Description     NVARCHAR(255),
    Amount          DECIMAL(12,2) NOT NULL
);
GO

CREATE TABLE Payments (
    PaymentID       INT IDENTITY(1,1) PRIMARY KEY,
    InvoiceID       INT NOT NULL FOREIGN KEY REFERENCES Invoices(InvoiceID) ON DELETE CASCADE,
    PaidAmount      DECIMAL(12,2) NOT NULL,
    PaymentDate     DATETIME2 DEFAULT SYSDATETIME(),
    PaymentMethod   NVARCHAR(50),
    TransactionRef  NVARCHAR(100)
);
GO

/* ============ DISCOUNTS ============ */
CREATE TABLE DiscountCodes (
    DiscountCode    NVARCHAR(50) PRIMARY KEY,
    Description     NVARCHAR(255),
    DiscountPercent DECIMAL(5,2),
    MaxUsage        INT,
    ExpireAt        DATETIME2
);
GO

CREATE TABLE InvoiceDiscounts (
    InvoiceID       INT NOT NULL FOREIGN KEY REFERENCES Invoices(InvoiceID) ON DELETE CASCADE,
    DiscountCode    NVARCHAR(50) NOT NULL FOREIGN KEY REFERENCES DiscountCodes(DiscountCode),
    PRIMARY KEY (InvoiceID, DiscountCode)
);
GO

/* ============ CERTIFICATES & REVIEWS ============ */
CREATE TABLE Certificates (
    CertificateID   INT IDENTITY(1,1) PRIMARY KEY,
    StudentID       INT NOT NULL FOREIGN KEY REFERENCES Users(UserID),
    CourseID        INT NOT NULL FOREIGN KEY REFERENCES Courses(CourseID),
    IssueDate       DATE DEFAULT CAST(GETDATE() AS DATE),
    CertificateURL  NVARCHAR(500)
);
GO

CREATE TABLE CourseReviews (
    ReviewID    INT IDENTITY(1,1) PRIMARY KEY,
    CourseID    INT NOT NULL FOREIGN KEY REFERENCES Courses(CourseID),
    StudentID   INT NOT NULL FOREIGN KEY REFERENCES Users(UserID),
    Rating      INT CHECK (Rating BETWEEN 1 AND 5),
    Comment     NVARCHAR(MAX),
    CreatedAt   DATETIME2 DEFAULT SYSDATETIME()
);
GO

/* ============ MESSAGING & NOTIFICATIONS ============ */
CREATE TABLE Messages (
    MessageID   INT IDENTITY(1,1) PRIMARY KEY,
    SenderID    INT NOT NULL FOREIGN KEY REFERENCES Users(UserID),
    ReceiverID  INT NOT NULL FOREIGN KEY REFERENCES Users(UserID),
    Body        NVARCHAR(MAX) NOT NULL,
    SentAt      DATETIME2 DEFAULT SYSDATETIME(),
    IsRead      BIT DEFAULT 0
);
GO

CREATE TABLE Notifications (
    NotificationID  INT IDENTITY(1,1) PRIMARY KEY,
    UserID          INT NOT NULL FOREIGN KEY REFERENCES Users(UserID),
    Title           NVARCHAR(200),
    Message         NVARCHAR(MAX),
    CreatedAt       DATETIME2 DEFAULT SYSDATETIME(),
    IsRead          BIT DEFAULT 0
);
GO

/* ============ AUDIT LOGS ============ */
CREATE TABLE ActivityLogs (
    LogID       INT IDENTITY(1,1) PRIMARY KEY,
    UserID      INT FOREIGN KEY REFERENCES Users(UserID),
    Action      NVARCHAR(100),
    Entity      NVARCHAR(100),
    EntityID    INT,
    Timestamp   DATETIME2 DEFAULT SYSDATETIME(),
    Details     NVARCHAR(MAX)
);
GO

/* ============ VIEWS ============ */
CREATE VIEW vw_ActiveCourses AS
    SELECT c.CourseID, c.Title, c.Price, 
           CONCAT(u.FirstName, ' ', u.LastName) AS Instructor,
           COUNT(e.EnrollmentID) AS TotalStudents
    FROM Courses c
    LEFT JOIN Users u ON u.UserID = c.InstructorID
    LEFT JOIN Enrollments e ON e.CourseID = c.CourseID
    WHERE c.IsActive = 1
    GROUP BY c.CourseID, c.Title, c.Price, u.FirstName, u.LastName;
GO

/* ============ STORED PROCEDURES ============ */
CREATE PROCEDURE sp_GetStudentProgress
    @StudentID INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT c.CourseID, c.Title, e.ProgressPercent, e.CompletedAt
    FROM Enrollments e
    JOIN Courses c ON c.CourseID = e.CourseID
    WHERE e.StudentID = @StudentID;
END
GO

/* ============ INDEXES ============ */
CREATE INDEX IX_Enrollments_Student ON Enrollments (StudentID);
CREATE INDEX IX_Payments_Invoice ON Payments (InvoiceID);
GO


ALTER TABLE Enrollments ADD IsCompleted BIT 
    CONSTRAINT DF_Enroll_IsCompleted DEFAULT 0;

/* End of schema */










/* ============================
   STORED PROCEDURES
============================ */

-- 1. Lấy danh sách học viên đã hoàn thành một khóa học
CREATE PROCEDURE sp_GetCompletedStudentsByCourse
    @CourseID INT
AS
BEGIN
    SELECT u.UserID, u.FirstName, u.LastName, e.CompletedAt
    FROM Enrollments e
    JOIN Users u ON u.UserID = e.StudentID
    WHERE e.CourseID = @CourseID AND e.IsCompleted = 1;
END;
GO

-- 2. Thêm đăng ký học viên mới (nếu chưa tồn tại)
CREATE PROCEDURE sp_EnrollStudent
    @StudentID INT,
    @CourseID INT
AS
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM Enrollments 
        WHERE CourseID = @CourseID AND StudentID = @StudentID
    )
    BEGIN
        INSERT INTO Enrollments (CourseID, StudentID)
        VALUES (@CourseID, @StudentID);
    END
END;
GO

-- 3. Tính số lượng học viên theo từng khóa
CREATE PROCEDURE sp_CountStudentsPerCourse
AS
BEGIN
    SELECT c.CourseID, c.Title, COUNT(e.EnrollmentID) AS TotalStudents
    FROM Courses c
    LEFT JOIN Enrollments e ON e.CourseID = c.CourseID
    GROUP BY c.CourseID, c.Title;
END;
GO

/* ============================
   FUNCTIONS
============================ */

-- 1. Tính tổng thời lượng khóa học (tổng phút từ bài học)
CREATE FUNCTION fn_CourseDuration(@CourseID INT)
RETURNS INT
AS
BEGIN
    DECLARE @TotalMinutes INT;
    SELECT @TotalMinutes = ISNULL(SUM(DurationMin), 0)
    FROM Lessons
    WHERE CourseID = @CourseID;
    RETURN @TotalMinutes;
END;
GO

-- 2. Lấy tên đầy đủ của người dùng
CREATE FUNCTION fn_FullName(@UserID INT)
RETURNS NVARCHAR(200)
AS
BEGIN
    DECLARE @Name NVARCHAR(200);
    SELECT @Name = FirstName + ' ' + LastName
    FROM Users
    WHERE UserID = @UserID;
    RETURN @Name;
END;
GO

-- 3. Tính điểm trung bình bài tập theo học viên
CREATE FUNCTION fn_AvgAssignmentScore(@StudentID INT)
RETURNS FLOAT
AS
BEGIN
    DECLARE @Avg FLOAT;
    SELECT @Avg = AVG(Score * 1.0)
    FROM Submissions
    WHERE StudentID = @StudentID;
    RETURN @Avg;
END;
GO

/* ============================
   TRIGGERS
============================ */

-- 1. Ghi log khi học viên đăng ký khóa học
CREATE TRIGGER trg_LogEnrollment
ON Enrollments
AFTER INSERT
AS
BEGIN
    INSERT INTO ActivityLogs (UserID, Action, Entity, EntityID, Timestamp, Details)
    SELECT i.StudentID, 'Enroll Course', 'Enrollments', i.EnrollmentID, SYSDATETIME(),
           CONCAT('Enrolled in course ID: ', i.CourseID)
    FROM inserted i;
END;
GO

-- 2. Không cho nộp bài trễ hạn
CREATE TRIGGER trg_CheckAssignmentDeadline
ON Submissions
INSTEAD OF INSERT
AS
BEGIN
    INSERT INTO Submissions (AssignmentID, StudentID, SubmitDate, FileURL, Score, Feedback)
    SELECT i.AssignmentID, i.StudentID, i.SubmitDate, i.FileURL, i.Score, i.Feedback
    FROM inserted i
    JOIN Assignments a ON a.AssignmentID = i.AssignmentID
    WHERE i.SubmitDate <= a.DueDate;

    IF EXISTS (
        SELECT 1 FROM inserted i
        JOIN Assignments a ON a.AssignmentID = i.AssignmentID
        WHERE i.SubmitDate > a.DueDate
    )
    BEGIN
        RAISERROR('Không thể nộp bài sau hạn chót!', 16, 1);
    END
END;
GO

-- 3. Cập nhật % tiến độ học khi hoàn thành bài học (giả lập)
-- Giả sử 1 bài học = 10%, khóa học có 10 bài
CREATE TRIGGER trg_UpdateProgressAfterLesson
ON Lessons
AFTER INSERT
AS
BEGIN
    UPDATE e
    SET ProgressPercent = CASE 
                             WHEN ProgressPercent + 10 >= 100 THEN 100
                             ELSE ProgressPercent + 10 
                         END
    FROM Enrollments e
    JOIN inserted l ON l.CourseID = e.CourseID
END;
GO