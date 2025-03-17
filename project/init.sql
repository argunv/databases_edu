CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE patients (
    patient_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender SMALLINT NOT NULL CHECK (gender IN (0, 1, 2)),
    phone VARCHAR(20),
    address VARCHAR(255)
);

CREATE TABLE doctors (
    doctor_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(100),
    hire_date DATE
);

CREATE TABLE appointments (
    appointment_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    patient_id UUID NOT NULL,
    doctor_id UUID NOT NULL,
    appointment_datetime TIMESTAMP NOT NULL,
    status SMALLINT NOT NULL CHECK (status IN (0, 1, 2, 3))
);

CREATE TABLE doctor_specialties (
    doctor_specialty_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    doctor_id UUID NOT NULL,
    specialty VARCHAR(100) NOT NULL
);

CREATE TABLE diagnoses (
    diagnosis_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    appointment_id UUID NOT NULL,
    diagnosis_code VARCHAR(20) NOT NULL,
    description TEXT
);

INSERT INTO patients (patient_id, first_name, last_name, date_of_birth, gender, phone, address)
VALUES 
('11111111-1111-1111-1111-111111111111', 'Sergey', 'Sidorov', '1980-05-15', 1, '+7 123 456-78-90', 'ул. Ленина, 10'),
('22222222-2222-2222-2222-222222222222', 'Elena', 'Kuznetsova', '1990-08-22', 2, '+7 987 654-32-10', 'ул. Пушкина, 5');

INSERT INTO doctors (doctor_id, first_name, last_name, phone, email, hire_date)
VALUES
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'Ivan', 'Petrov', '+7 111 222-33-44', 'ivan.petrov@example.com', '2010-01-15'),
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'Anna', 'Smirnova', '+7 222 333-44-55', 'anna.smirnova@example.com', '2012-06-20');

INSERT INTO appointments (appointment_id, patient_id, doctor_id, appointment_datetime, status)
VALUES
('77777777-7777-7777-7777-777777777777', '11111111-1111-1111-1111-111111111111', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '2025-03-20 09:00:00', 0),
('88888888-8888-8888-8888-888888888888', '22222222-2222-2222-2222-222222222222', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '2025-03-21 10:30:00', 1);

INSERT INTO doctor_specialties (doctor_specialty_id, doctor_id, specialty)
VALUES
('44444444-4444-4444-4444-444444444444', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'Cardiology'),
('55555555-5555-5555-5555-555555555555', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'Neurology');

INSERT INTO diagnoses (diagnosis_id, appointment_id, diagnosis_code, description)
VALUES
('77777777-7777-7777-7777-777777777779', '77777777-7777-7777-7777-777777777777', 'I20', 'Angina pectoris'),
('88888888-8888-8888-8888-888888888889', '88888888-8888-8888-8888-888888888888', 'G44', 'Migraine');

SELECT * FROM patients;
SELECT * FROM doctors;
SELECT * FROM appointments;
SELECT * FROM doctor_specialties;
SELECT * FROM diagnoses;
