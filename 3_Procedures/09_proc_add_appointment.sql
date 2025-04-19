USE HospitalDB;
GO

CREATE PROCEDURE AddAppointment
    @patient_id INT,
    @doctor_id INT,
    @appointment_date DATETIME,
    @reason NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;

    -- التحقق من وجود المريض والطبيب
    IF NOT EXISTS (SELECT 1 FROM Patients WHERE patient_id = @patient_id)
    BEGIN
        PRINT '❌ Patient not found.';
        RETURN;
    END

    IF NOT EXISTS (SELECT 1 FROM Doctors WHERE doctor_id = @doctor_id)
    BEGIN
        PRINT '❌ Doctor not found.';
        RETURN;
    END

    -- إدخال الموعد
    INSERT INTO Appointments (patient_id, doctor_id, appointment_date, reason)
    VALUES (@patient_id, @doctor_id, @appointment_date, @reason);

    PRINT '✅ Appointment added successfully.';
END;
