USE HospitalDB;
GO

CREATE TRIGGER trg_FreeRoomOnDischarge
ON Admissions
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- نتاكد ان discharge_date اتحدثت و مبقاش NULL
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN deleted d ON i.admission_id = d.admission_id
        WHERE i.discharge_date IS NOT NULL AND d.discharge_date IS NULL
    )
    BEGIN
        UPDATE Rooms
        SET availability = 1
        WHERE room_id IN (
            SELECT i.room_id
            FROM inserted i
            JOIN deleted d ON i.admission_id = d.admission_id
            WHERE i.discharge_date IS NOT NULL AND d.discharge_date IS NULL
        );

        PRINT '✅ Room marked as available automatically.';
    END
END;
