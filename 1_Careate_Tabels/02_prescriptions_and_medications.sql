USE HospitalDB;
GO

-- جدول الأدوية
CREATE TABLE Medications (
    medication_id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100),
    description NVARCHAR(255),
    dosage NVARCHAR(50)
);

-- جدول الوصفات الطبية
CREATE TABLE Prescriptions (
    prescription_id INT IDENTITY(1,1) PRIMARY KEY,
    appointment_id INT,
    date_issued DATE DEFAULT GETDATE(),
    notes NVARCHAR(MAX),
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);

-- جدول تفاصيل الأدوية في كل وصفة (علاقة M:N)
CREATE TABLE PrescriptionDetails (
    prescription_id INT,
    medication_id INT,
    quantity INT,
    PRIMARY KEY (prescription_id, medication_id),
    FOREIGN KEY (prescription_id) REFERENCES Prescriptions(prescription_id),
    FOREIGN KEY (medication_id) REFERENCES Medications(medication_id)
);
