USE master;
GO

USE PropertyManagementDB;
GO



CREATE FUNCTION udfAverageCompletionTime (@tech_id INT)
RETURNS FLOAT
AS
BEGIN
    DECLARE @average FLOAT
    SELECT @average = AVG(DATEDIFF(day, r.RequestDate, j.CompletionDate))
    FROM MaintenanceRequests r
    INNER JOIN Jobs j
    ON r.RequestID = j.RequestID
    WHERE j.TechnicianID = @tech_id

    RETURN @average
END
GO




CREATE PROCEDURE uspAverageTime
AS
BEGIN
    SELECT FirstName + ' ' + LastName as Techninician, dbo.udfAverageCompletionTime(TechnicianID) AS averageCompletionTime
    FROM MaintenanceTechnicians t
	INNER JOIN Users u ON u.UserID = t.UserID
END
GO


EXEC uspAverageTime;




