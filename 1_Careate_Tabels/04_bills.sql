USE HospitalDB;
GO

CREATE TABLE Bills (
    bill_id INT IDENTITY(1,1) PRIMARY KEY,
    patient_id INT,
    admission_id INT NULL, -- في حالة الفاتورة نتيجة لتنويم
    amount DECIMAL(10,2),
    bill_date DATE DEFAULT GETDATE(),
    status NVARCHAR(20) CHECK (status IN ('Paid', 'Unpaid', 'Pending')),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (admission_id) REFERENCES Admissions(admission_id)
);
