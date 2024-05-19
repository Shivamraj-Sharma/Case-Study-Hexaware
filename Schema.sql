CREATE DATABASE Case_Study;
USE Case_Study;

-- Creating Victims Table
CREATE TABLE Victims(
	VictimID INT,
	FirstName VARCHAR(50),
	LastName VARCHAR(50),
	DateOfBirth DATE,
	Gender VARCHAR(20),
	ContactInformation VARCHAR(200),
	PRIMARY KEY(VictimID),
);

-- Creating Suspects Table
CREATE TABLE Suspects(
	SuspectID INT,
	FirstName VARCHAR(50),
	LastName VARCHAR(50),
	DateOfBirth DATE,
	Gender VARCHAR(20),
	ContactInformation VARCHAR(200),
	PRIMARY KEY(SuspectID),
);

-- Creating Incidents Table
CREATE TABLE Incidents(
	IncidentID INT,
	IncidentType VARCHAR(50),
	IncidentDate DATE,
	Location_Longitude DECIMAL(10, 8),
	Location_Latitude DECIMAL(10, 8),
	Description VARCHAR(200),
	Status VARCHAR(50),
	VictimID INT,
	SuspectID INT,
	PRIMARY KEY (IncidentID),
	FOREIGN KEY (VictimID) References Victims(VictimID),
	FOREIGN KEY (SuspectID) References Suspects(SuspectID)
);

-- Creating Case Table
CREATE TABLE Cases(
	CaseID INT,
	IncidentID INT,
	Details VARCHAR(250),
	PRIMARY KEY(CaseID),
	FOREIGN KEY (IncidentID) REFERENCES Incidents(IncidentID)
);

-- Creating LawEnforcementAgency Table
CREATE TABLE LawEnforcementAgency(
	AgencyID INT,
	AgencyName VARCHAR(50),
	Jurisdiction VARCHAR(50),
	ContactInformation VARCHAR(200),
	IncidentID INT,
	PRIMARY KEY(AgencyID),
	FOREIGN KEY (IncidentID) References Incidents(IncidentID)
);

-- Creating Officers Table
CREATE TABLE Officers(
	OfficerID INT,
	FirstName VARCHAR(50),
	LastName VARCHAR(50),
	BadgeNumber INT,
	Rank VARCHAR(20),
	ContactInformation VARCHAR(200),
	AgencyID INT
	PRIMARY KEY (OfficerID),
	FOREIGN KEY (AgencyID) References LawEnforcementAgency(AgencyID) 
);

-- Creating Evidence Table
CREATE TABLE Evidence(
	EvidenceID INT,
	Description VARCHAR(200),
	LocationFound VARCHAR(50),
	IncidentID INT
	PRIMARY KEY (EvidenceID),
	FOREIGN KEY (IncidentID) References Incidents (IncidentID)
);

-- Creating Reports Table
CREATE TABLE Reports(
	ReportID INT,
	IncidentID INT,
	ReportingOfficerID INT,
	ReportDate DATE,
	ReportDetails VARCHAR(500),
	Status VARCHAR(20),
	PRIMARY KEY (ReportID),
	FOREIGN KEY (IncidentID) References Incidents (IncidentID),
	FOREIGN KEY (ReportingOfficerID) References Officers (OfficerID)
);