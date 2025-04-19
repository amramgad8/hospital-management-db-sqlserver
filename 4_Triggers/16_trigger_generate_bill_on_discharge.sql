USE HospitalDB;
GO

CREATE TRIGGER trg_GenerateBillOnDischarge
ON Admissions
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @admission_id INT,
            @patient_id INT,
            @admission_date DATE,
            @discharge_date DATE,
            @days_stayed INT,
            @amount DECIMAL(10,2);

    -- فقط لو discharge_date اتحدثت
    SELECT 
        @admission_id = i.admission_id,
        @patient_id = i.patient_id,
        @admission_date = i.admission_date,
        @discharge_date = i.discharge_date
    FROM inserted i
    JOIN deleted d ON i.admission_id = d.admission_id
    WHERE i.discharge_date IS NOT NULL AND d.discharge_date IS NULL;

    IF @discharge_date IS NOT NULL
    BEGIN
        -- احسب مدة البقاء
        SET @days_stayed = DATEDIFF(DAY, @admission_date, @discharge_date);
        IF @days_stayed = 0 SET @days_stayed = 1;

        -- احسب المبلغ (500 جنيه/يوم مثلاً)
        SET @amount = @days_stayed * 500.00;

        -- إدخال الفاتورة
        INSERT INTO Bills (patient_id, admission_id, amount, bill_date, status)
        VALUES (@patient_id, @admission_id, @amount, GETDATE(), 'Pending');

        PRINT '✅ Bill generated automatically after discharge.';
    END
END;
