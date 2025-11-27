
create table Departments(
DepID varchar(10),
DepName nvarchar(50),
DepDescription nvarchar(200),

primary key(DepID)
)

create table Lecturers(
LecID varchar(10),
FirstName nvarchar(30),
LastName nvarchar(30),
LecDate date,
DepID varchar(10),

primary key(LecID),
foreign key(DepID) references Departments(DepID)
)

create table Subjects(
SubID varchar(10),
SubName nvarchar(30),
NumberOfPersons int,
SubDepcription nvarchar(200),

primary key(SubID)
)

create table Lecture(
LecID varchar(10),
SubID varchar(10),
s1 nvarchar(30),
s2 nvarchar(30),
primary key(LecID, SubID),
foreign key(LecID) references Lecturers(LecID),
foreign key(SubID) references Subjects(SubID)
)

