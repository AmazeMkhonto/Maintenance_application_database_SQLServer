USE master;
GO

USE PropertyManagementDB;
GO


CREATE TABLE Buildings (
   [BuildingID] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
   [BuildingName] VARCHAR(100) ,
   [Address] VARCHAR(120)
);
GO



CREATE TABLE Units(
	[UnitID] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[BuildingID] INT,
	[UnitNumber] INT,
	[UnitType] VARCHAR(50),
	FOREIGN KEY (BuildingID) REFERENCES Buildings(BuildingID)
	);
GO


CREATE TABLE Roles(
	[RoleID] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[RoleName] VARCHAR(50)
	);
GO



CREATE TABLE  Users (
	[UserID] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[FirstName] VARCHAR(55),
	[LastName] VARCHAR(55),
	[BirthDate] DATE,
	[RoleID] INT,
	FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)
	);
GO



CREATE TABLE Contacts (
	[ContactID] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[Email] VARCHAR(120),
	[CellNumber] VARCHAR(20),
	[AlternativeNumber] VARCHAR(20)
	);
	GO
	


CREATE TABLE Tenants(
	[TenantID] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[UserID] INT,
	[UnitID] INT,
	[ContactID] INT,
	FOREIGN KEY (UserID) REFERENCES Users(UserID),
	FOREIGN KEY (UnitID) REFERENCES Units(UnitID),
	FOREIGN KEY (ContactID) REFERENCES Contacts(ContactID)
	);
GO




CREATE TABLE MaintenanceRequests (
	[RequestID] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[TenantID] INT,
	[Description] VARCHAR(150),
	[RequestDate] DATE,
	[Image] VARBINARY,
	FOREIGN KEY (TenantID) REFERENCES Tenants(TenantID)
	);
GO



CREATE TABLE MaintenanceTechnicians(
	[TechnicianID] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[UserID] INT,
	[Speciality] VARCHAR(20),
	[ContactID] INT,
	FOREIGN KEY (UserID) REFERENCES Users(UserID),
	FOREIGN KEY (ContactID) REFERENCES Contacts(ContactID)
	);
GO



CREATE TABLE Jobs (
	[JobID] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[Status] VARCHAR(25),
	[TechnicianID] INT,
	[RequestID] INT,
	[CompletionDate] DATE,
	FOREIGN KEY ([TechnicianID]) REFERENCES MaintenanceTechnicians([TechnicianID]),
	FOREIGN KEY ([RequestID]) REFERENCES MaintenanceRequests([RequestID])
	);
GO






