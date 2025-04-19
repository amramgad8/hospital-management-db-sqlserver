USE HospitalDB;
GO

CREATE TRIGGER trg_OccupyRoomOnAdmission
ON Admissions
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- نحدث توافر الغرفة ونجعلها مشغولة (0)
    UPDATE Rooms
    SET availability = 0
    WHERE room_id IN (
        SELECT room_id
        FROM inserted
    );

    PRINT '✅ Room marked as occupied after patient admission.';
END;
