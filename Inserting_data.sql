USE master;
GO

USE PropertyManagementDB;
GO


INSERT INTO Buildings 
		([BuildingName], [Address])
VALUES	('Sunny Place', '123 Main St, Cape Town'), 
		('Happy House', '456 Park Ave, Durban'), 
		('Rainbow Lodge', '789 Ocean Blvd, Port Elizabeth');
GO



INSERT INTO Units 
		([BuildingID], [UnitNumber], [UnitType]) 
VALUES  (1, 101, '1 Bedroom'), 
		(1, 102, '2 Bedroom'), 
		(2, 201, 'Studio'), 
		(3, 301, '3 Bedroom');
GO


INSERT INTO Roles 
		([RoleName]) 
VALUES	('Building Manager'),
		('Tenant'), 
		('Maintenance Technician');
GO



INSERT INTO Users 
		([FirstName], 
		[LastName], 
		[BirthDate],
		[RoleID])
VALUES  ('Jim', 'Halpert', '1980-10-01', 2), 
		('Pam', 'Beesly', '1981-03-24', 2), 
		('Dwight', 'Schrute', '1977-01-20', 3),
		('Michael', 'Scott', '1965-03-15', 1), 
		('Ryan', 'Howard', '1980-05-11', 2),
		('Stanley', 'Hudson', '1950-03-04', 3),
		('Jan', 'Levinson', '1969-03-15', 1), 
		('Angela', 'Martin', '1971-01-01', 1);
GO

INSERT INTO Contacts 
		([Email], 
		[CellNumber],
		[AlternativeNumber]) 
VALUES	('jim@dundermifflin.com', '0811234567', '0214567890'), 
		('pam@dundermifflin.com', '0811234567', '0214567890'),
		('dwight@dundermifflin.com', '0811234567', '0214567890'),
		('michael@dundermifflin.com', '0811234567', '0214567890'), 
		('ryan@dundermifflin.com', '0811234567', '0214567890'), 
		('stanley@dundermifflin.com', '0811234567', '0214567890'), 
		('jan@dundermifflin.com', '0811234567', '0214567890'),
		('angela@dundermifflin.com', '0811234567', '0214567890');
GO

INSERT INTO Tenants 
		([UserID], 
		[UnitID], 
		[ContactID])
VALUES	(1, 1, 1),
		(2, 2, 2), 
		(3, 3, 3), 
		(4, 1, 4), 
		(5, 2, 5), 
		(6, 3, 6), 
		(7, 1, 7), 
		(8, 2, 8);
GO



INSERT INTO MaintenanceRequests 
		(TenantID, 
		Description,
		RequestDate)
VALUES 
	(1, 'Leaking faucet in bathroom', '2023-01-01'),
	(2, 'Broken stove', '2022-12-05'),
	(3, 'Clogged toilet', '2022-11-20'),
	(4, 'Damaged front door', '2022-10-15'),
	(5, 'Broken window in living room', '2022-09-30'),
	(6, 'Cracked tile in kitchen', '2022-08-25'),
	(7, 'Malfunctioning air conditioner', '2022-07-20'),
	(8, 'Loose banister on staircase', '2022-06-15');
GO



INSERT INTO MaintenanceTechnicians 
		(UserID, Speciality, ContactID)
VALUES
		(1, 'Plumbing', 1),
		(2, 'Electrical', 2),
		(3, 'Carpentry', 3),
		(4, 'Painting', 4),
		(5, 'HVAC', 5),
		(6, 'Landscaping', 6),
		(7, 'Roofing', 7),
		(8, 'Masonry', 8);
GO



INSERT INTO Jobs (Status, TechnicianID, RequestID, CompletionDate)
VALUES
('Completed', 1, 1, '2022-12-01'),
('In Progress', 2, 2, '2023-01-15'),
('Pending', 3, 3, '2022-12-25'),
('Cancelled', 4, 4, null),
('Completed', 5, 5, '2022-12-02'),
('In Progress', 6, 6, '2022-12-20'),
('Pending', 7, 7, '2022-12-01'),
('Completed', 8, 8, '2022-12-01');



SELECT * FROM Buildings;


SELECT * FROM Units;


SELECT * FROM Roles;


SELECT * FROM Users;


SELECT * FROM Contacts;


SELECT * FROM Tenants;


SELECT * FROM MaintenanceRequests;


SELECT * FROM MaintenanceTechnicians;


SELECT * FROM Jobs;