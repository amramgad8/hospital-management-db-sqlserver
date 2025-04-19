USE HospitalDB;
GO

CREATE TRIGGER trg_PreventDeleteDoctorWithAppointments
ON Doctors
INSTEAD OF DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- التحقق من وجود مواعيد مرتبطة
    IF EXISTS (
        SELECT 1
        FROM Appointments a
        JOIN deleted d ON a.doctor_id = d.doctor_id
    )
    BEGIN
        PRINT '❌ Cannot delete doctor: appointments are still linked.';
        RETURN;
    END

    -- لو مفيش مواعيد، احذف الطبيب فعلاً
    DELETE FROM Doctors
    WHERE doctor_id IN (SELECT doctor_id FROM deleted);

    PRINT '✅ Doctor deleted successfully.';
END;
