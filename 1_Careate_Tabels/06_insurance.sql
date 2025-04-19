USE HospitalDB;
GO

CREATE TABLE Insurance (
    insurance_id INT IDENTITY(1,1) PRIMARY KEY,
    patient_id INT,
    provider_name NVARCHAR(100),
    policy_number NVARCHAR(50),
    coverage_percent INT CHECK (coverage_percent BETWEEN 0 AND 100),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);
