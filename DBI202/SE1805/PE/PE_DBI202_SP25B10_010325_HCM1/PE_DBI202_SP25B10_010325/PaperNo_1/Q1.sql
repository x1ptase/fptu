CREATE TABLE tblAirport(
	Airportcode NCHAR(10),
	Name NVARCHAR(20),
	City NVARCHAR(50),
	State NVARCHAR(50),

	PRIMARY KEY(Airportcode)
)

CREATE TABLE tblAirPlane(
	AirplaneID NCHAR(10),
	AriplaneName NVARCHAR(20),
	TotalSeat INT,
	Company NVARCHAR(50),

	PRIMARY KEY(AirplaneID)
)

CREATE TABLE CanLand(
	TimeLand DATETIME,
	Airportcode NCHAR(10),
	AirplaneID NCHAR(10),

	PRIMARY KEY(Airportcode, AirplaneID),
	FOREIGN KEY(Airportcode) REFERENCES tblAirport(Airportcode),
	FOREIGN KEY(AirplaneID) REFERENCES tblAirplane(AirplaneID)
)