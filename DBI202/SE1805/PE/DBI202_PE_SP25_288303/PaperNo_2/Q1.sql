CREATE TABLE Customers(
	custID INT,
	FullName NVARCHAR(60),
	FirstName NVARCHAR(30),
	LastName NVARCHAR(30),
	phone NVARCHAR(100),


	PRIMARY KEY(custID)
)


CREATE TABLE Accounts(
	accNo VARCHAR(25),
	openTime DATETIME,
	balance MONEY,
	custID INT,

	PRIMARY KEY(accNo),
	FOREIGN KEY(custID) REFERENCES Customers(custID)

)

CREATE TABLE Cards(
	CardNo VARCHAR(20),
	expiryDate DATE,
	creditLimit MONEY,
	cardType VARCHAR(30),
	accNo VARCHAR(25),

	PRIMARY KEY(CardNo),
	FOREIGN KEY(accNo) REFERENCES Accounts(accNo)
)