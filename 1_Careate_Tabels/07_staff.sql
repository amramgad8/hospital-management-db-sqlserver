USE HospitalDB;
GO

CREATE TABLE Staff (
    staff_id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100),
    role NVARCHAR(50), -- مثل: Nurse, Admin, Technician
    phone NVARCHAR(20),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);
