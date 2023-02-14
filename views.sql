USE master;
GO

USE PropertyManagementDB;
GO


-- View to display all requests
CREATE VIEW vwMaintenanceRequests 
AS
SELECT r.RequestID, t.TenantID, u.FirstName + ' ' + u.LastName AS Tenant, 
       r.Description, r.RequestDate, r.Image, c.CellNumber
FROM MaintenanceRequests r
INNER JOIN Tenants t ON r.TenantID = t.TenantID
INNER JOIN Users u ON t.UserID = u.UserID
INNER JOIN Contacts c ON c.ContactID = t.ContactID;

GO





-- View to display all jobs with technician and maintenance request information
CREATE VIEW vwJobs
AS
SELECT j.JobID, j.Status, u.FirstName + ' ' + u.LastName AS Technician,	
	r.RoleName,t.Speciality, mr.Description, j.CompletionDate
FROM Jobs j
INNER JOIN MaintenanceTechnicians t ON j.TechnicianID = t.TechnicianID
INNER JOIN Users u ON t.UserID = u.UserID
INNER JOIN MaintenanceRequests mr ON j.RequestID = mr.RequestID
INNER JOIN Roles r ON r.RoleID = u.RoleID
where RoleName <> 'Tenant';
GO



-- View to display all tenants with unit information
CREATE VIEW vwTenants 
AS
SELECT u.FirstName + ' ' + u.LastName AS Tenant,
       u.BirthDate,  un.UnitNumber, un.UnitType, b.BuildingName
FROM Tenants t
INNER JOIN Users u ON t.UserID = u.UserID
INNER JOIN Units un ON t.UnitID = un.UnitID
INNER JOIN Buildings b ON un.BuildingID = b.BuildingID
INNER JOIN Roles rl on rl.RoleID = u.RoleID
WHERE RoleName = 'Tenant';
GO




