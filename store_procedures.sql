USE master;
GO

USE PropertyManagementDB;
GO





CREATE PROCEDURE spInsertUserAndMaintenanceRequest
(
   @FirstName VARCHAR(55),
   @LastName VARCHAR(55),
   @BirthDate DATE,
   @RoleID INT,
   @Email VARCHAR(120),
   @CellNumber VARCHAR(20),
   @UnitID INT,
   @RequestDescription VARCHAR(150)
)
AS
BEGIN
   DECLARE @UserID INT, @ContactID INT, @TenantID INT, @RequestID INT, @JobID INT

  BEGIN TRANSACTION;
   INSERT INTO Users (FirstName, LastName, BirthDate, RoleID)
   VALUES (@FirstName, @LastName, @BirthDate, @RoleID)
   SET @UserID = SCOPE_IDENTITY()

   
   INSERT INTO Contacts (Email, CellNumber)
   VALUES (@Email, @CellNumber)
   SET @ContactID = SCOPE_IDENTITY()

   
   INSERT INTO Tenants (UserID, UnitID, ContactID)
   VALUES (@UserID, @UnitID, @ContactID)
   SET @TenantID = SCOPE_IDENTITY()

  
   INSERT INTO MaintenanceRequests (TenantID, Description, RequestDate)
   VALUES (@TenantID, @RequestDescription, GETDATE())
   SET @RequestID = SCOPE_IDENTITY()

  
   INSERT INTO Jobs (Status, RequestID)
   VALUES ('Open', @RequestID)
   SET @JobID = SCOPE_IDENTITY()
COMMIT TRANSACTION;
END;
GO







CREATE PROCEDURE InsertBuilding (@BuildingName VARCHAR(100), @Address VARCHAR(120))
AS
BEGIN
    BEGIN TRANSACTION;
        INSERT INTO Buildings (BuildingName, Address)
        VALUES (@BuildingName, @Address);

    COMMIT TRANSACTION;
END;
GO




