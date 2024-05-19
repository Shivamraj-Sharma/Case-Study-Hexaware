-- Seed data for Victims Table
INSERT INTO Victims (VictimID, FirstName, LastName, DateOfBirth, Gender, ContactInformation)
VALUES
(1, 'John', 'Doe', '1990-01-01', 'Male', 'john.doe@example.com'),
(2, 'Jane', 'Smith', '1985-02-02', 'Female', 'jane.smith@example.com'),
(3, 'Michael', 'Johnson', '1975-03-03', 'Male', 'michael.johnson@example.com'),
(4, 'Emily', 'Davis', '1980-04-04', 'Female', 'emily.davis@example.com'),
(5, 'Chris', 'Brown', '1995-05-05', 'Male', 'chris.brown@example.com'),
(6, 'Anna', 'Taylor', '1987-06-06', 'Female', 'anna.taylor@example.com'),
(7, 'David', 'Martinez', '1992-07-07', 'Male', 'david.martinez@example.com'),
(8, 'Laura', 'Wilson', '1988-08-08', 'Female', 'laura.wilson@example.com');

-- Seed data for Suspects Table
INSERT INTO Suspects (SuspectID, FirstName, LastName, DateOfBirth, Gender, ContactInformation)
VALUES
(1, 'Tom', 'Miller', '1980-01-01', 'Male', 'tom.miller@example.com'),
(2, 'Sara', 'Anderson', '1985-02-02', 'Female', 'sara.anderson@example.com'),
(3, 'James', 'Thomas', '1975-03-03', 'Male', 'james.thomas@example.com'),
(4, 'Lisa', 'Jackson', '1980-04-04', 'Female', 'lisa.jackson@example.com'),
(5, 'Robert', 'White', '1995-05-05', 'Male', 'robert.white@example.com'),
(6, 'Karen', 'Harris', '1987-06-06', 'Female', 'karen.harris@example.com'),
(7, 'Daniel', 'Clark', '1992-07-07', 'Male', 'daniel.clark@example.com'),
(8, 'Nancy', 'Lewis', '1988-08-08', 'Female', 'nancy.lewis@example.com');

-- Seed data for Incidents Table
INSERT INTO Incidents (IncidentID, IncidentType, IncidentDate, Location_Longitude, Location_Latitude, Description, Status, VictimID, SuspectID)
VALUES
(1, 'Theft', '2024-03-11', -73.935242, 40.730610, 'Stolen bicycle', 'Open', 1, 1),
(2, 'Assault', '2024-03-02', -73.985428, 40.748817, 'Physical altercation', 'Closed', 2, 2),
(3, 'Burglary', '2024-02-23', -74.006015, 40.712776, 'Break-in reported', 'Under Investigation', 3, 3),
(4, 'Vandalism', '2024-02-14', -73.977482, 40.752726, 'Graffiti on public property', 'Open', 4, 4),
(5, 'Fraud', '2024-01-25', -73.971321, 40.783060, 'Credit card fraud', 'Under Investigation', 5, 5),
(6, 'Robbery', '2024-01-16', -73.959244, 40.761432, 'Mugging', 'Open', 6, 6),
(7, 'Cybercrime', '2024-01-07', -74.013442, 40.710973, 'Phishing attack', 'Under Investigation', 7, 7),
(8, 'Kidnapping', '2024-01-04', -73.998165, 40.712878, 'Person missing', 'Closed', 8, 8);

-- Seed data for Cases Table
INSERT INTO Cases (CaseID, IncidentID, Details)
VALUES
(1, 1, 'Case involves theft of a bicycle from a public park.'),
(2, 2, 'Assault case involving a physical altercation between two individuals.'),
(3, 3, 'Investigation of a reported burglary at a residential property.'),
(4, 4, 'Case regarding vandalism in a public area, involving graffiti.'),
(5, 5, 'Investigation of credit card fraud, possibly involving identity theft.'),
(6, 6, 'Case involving a mugging incident in an alleyway, and the suspect fled.'),
(7, 7, 'Cybercrime case involving a phishing attack.'),
(8, 8, 'Kidnapping case investigation, where a child was reported missing.');

-- Seed data for LawEnforcementAgency Table
INSERT INTO LawEnforcementAgency (AgencyID, AgencyName, Jurisdiction, ContactInformation, IncidentID)
VALUES
(1, 'NYPD', 'New York', 'nypd@example.com', 1),
(2, 'LAPD', 'Los Angeles', 'lapd@example.com', 2),
(3, 'Chicago PD', 'Chicago', 'chicago_pd@example.com', 3),
(4, 'Houston PD', 'Houston', 'houston_pd@example.com', 4),
(5, 'Phoenix PD', 'Phoenix', 'phoenix_pd@example.com', 5),
(6, 'Philadelphia PD', 'Philadelphia', 'philly_pd@example.com', 6),
(7, 'San Antonio PD', 'San Antonio', 'san_antonio_pd@example.com', 7),
(8, 'San Diego PD', 'San Diego', 'sandiego_pd@example.com', 8);

-- Seed data for Officers Table
INSERT INTO Officers (OfficerID, FirstName, LastName, BadgeNumber, Rank, ContactInformation, AgencyID)
VALUES
(1, 'Officer', 'Wells', 12345, 'Sergeant', 'wells@nypd.com', 1),
(2, 'Officer', 'Gibson', 54321, 'Lieutenant', 'gibson@lapd.com', 2),
(3, 'Officer', 'Andrews', 67890, 'Captain', 'andrews@chicagopd.com', 3),
(4, 'Officer', 'Mitchell', 98765, 'Detective', 'mitchell@houstonpd.com', 4),
(5, 'Officer', 'Moore', 11111, 'Officer', 'moore@phoenixpd.com', 5),
(6, 'Officer', 'Taylor', 22222, 'Officer', 'taylor@phillypd.com', 6),
(7, 'Officer', 'Jordan', 33333, 'Officer', 'jordan@sanantoniopd.com', 7),
(8, 'Officer', 'Lee', 44444, 'Officer', 'lee@sandiegopd.com', 8);

-- Seed data for Evidence Table
INSERT INTO Evidence (EvidenceID, Description, LocationFound, IncidentID)
VALUES
(1, 'CCTV Footage', 'Public Park', 1),
(2, 'CCTV Footage', 'Street', 2),
(3, 'Broken Window', 'House', 3),
(4, 'Spray Paint Can', 'Wall', 4),
(5, 'Credit Card', 'ATM', 5),
(6, 'Wallet', 'Street', 6),
(7, 'Email', 'Computer', 7),
(8, 'Fingerprint', 'Room', 8),
(9, 'Rope', 'Room', 8);

-- Seed data for Reports Table
INSERT INTO Reports (ReportID, IncidentID, ReportingOfficerID, ReportDate, ReportDetails, Status)
VALUES
(1, 1, 1, '2024-03-13', 'Officer Wells filed the initial report detailing the theft of a bicycle from a park, including CCTV evidence of the suspect.', 'Draft'),
(2, 2, 2, '2024-03-10', 'Officer Gibson finalized the report on the physical altercation in the downtown bar, documenting witness statements and medical reports of minor injuries.', 'Finalized'),
(3, 3, 3, '2024-02-28', 'Officer Andrews submitted a report on the burglary investigation, noting stolen items, signs of forced entry, and potential suspects.', 'Draft'),
(4, 4, 4, '2024-02-16', 'Officer Mitchell drafted a report on the vandalism case involving graffiti in a public area, suspected to be related to gang activity.', 'Draft'),
(5, 5, 5, '2024-01-13', 'Officer Moore is investigating a credit card fraud case with numerous unauthorized transactions linked to possible identity theft.', 'Pending'),
(6, 6, 6, '2024-01-14', 'Officer Taylor drafted a report on a mugging incident in an alleyway, where the victim was robbed at knifepoint, and the suspect escaped.', 'Draft'),
(7, 7, 7, '2024-01-15', 'Officer Jordan is handling a cybercrime case involving a phishing attack, with multiple victims receiving fraudulent emails requesting sensitive information.', 'Pending'),
(8, 8, 8, '2024-01-16', 'Officer Lee finalized the report on the kidnapping case, detailing the child’s last known whereabouts and witness testimonies.', 'Finalized');



-- SELECT * FROM Incidents;
-- SELECT * FROM Cases;
-- SELECT * FROM Victims;
-- SELECT * FROM Suspects;
-- SELECT * FROM LawEnforcementAgency;
-- SELECT * FROM Officers;
-- SELECT * FROM Evidence;
-- SELECT * FROM Reports;