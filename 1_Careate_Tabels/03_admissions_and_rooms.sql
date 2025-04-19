USE HospitalDB;
GO

-- جدول الغرف
CREATE TABLE Rooms (
    room_id INT IDENTITY(1,1) PRIMARY KEY,
    room_number NVARCHAR(10),
    room_type NVARCHAR(50), -- مثل: ICU, General, Private
    availability BIT -- 1 = متاحة، 0 = غير متاحة
);

-- جدول التنويم
CREATE TABLE Admissions (
    admission_id INT IDENTITY(1,1) PRIMARY KEY,
    patient_id INT,
    room_id INT,
    admission_date DATE DEFAULT GETDATE(),
    discharge_date DATE,
    diagnosis NVARCHAR(MAX),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);
