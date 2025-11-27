
CREATE TABLE Students(
	StudentID INT,
	Email VARCHAR(100),
	Full_Name VARCHAR(100),
	BirthDate DATE,
	Gender VARCHAR(10),

	PRIMARY KEY(StudentID)
)


CREATE TABLE Teachers(
	TeacherID INT,
	Phone VARCHAR(15),
	Email VARCHAR(50),
	Full_Name VARCHAR(100),

	PRIMARY KEY(TeacherID)
)

CREATE TABLE Courses(
	CourseID INT,
	Course_Name VARCHAR(100),
	TeacherID INT,

	PRIMARY KEY(CourseID, TeacherID),
	FOREIGN KEY(TeacherID) REFERENCES Teachers(TeacherID)
)

CREATE TABLE Enrollments(
	Edate DATE,
	Etime TIME,
	StudentID INT,
	CourseID INT,
	TeacherID INT,

	PRIMARY KEY(StudentID, CourseID, TeacherID),
	FOREIGN KEY(StudentID) REFERENCES Students(StudentID),
	FOREIGN KEY(CourseID, TeacherID) REFERENCES Courses(CourseID, TeacherID)
)

