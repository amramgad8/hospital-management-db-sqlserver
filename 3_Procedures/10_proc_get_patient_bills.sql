USE HospitalDB;
GO

CREATE PROCEDURE GetPatientBills
    @patient_id INT
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM Patients WHERE patient_id = @patient_id)
    BEGIN
        PRINT '❌ Patient not found.';
        RETURN;
    END

    SELECT 
        b.bill_id AS [Bill ID],
        b.amount AS [Amount],
        b.status AS [Status],
        b.bill_date AS [Date],
        ISNULL(b.admission_id, 'Outpatient') AS [Admission ID]
    FROM Bills b
    WHERE b.patient_id = @patient_id
    ORDER BY b.bill_date DESC;
END;
