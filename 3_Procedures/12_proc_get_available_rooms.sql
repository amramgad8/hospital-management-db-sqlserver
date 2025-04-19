USE HospitalDB;
GO

CREATE PROCEDURE GetAvailableRoomsByType
    @room_type NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        room_id,
        room_number,
        room_type,
        availability
    FROM Rooms
    WHERE 
        room_type = @room_type 
        AND availability = 1;
END;
