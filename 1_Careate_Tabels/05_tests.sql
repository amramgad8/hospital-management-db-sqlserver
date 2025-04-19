USE HospitalDB;
GO

CREATE TABLE Tests (
    test_id INT IDENTITY(1,1) PRIMARY KEY,
    appointment_id INT,
    test_name NVARCHAR(100),
    result NVARCHAR(MAX),
    test_date DATE DEFAULT GETDATE(),
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);
