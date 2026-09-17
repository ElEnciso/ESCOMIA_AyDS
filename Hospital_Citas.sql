create database hospital_citas;
use hospital_citas;

-- 1. TABLAS PADRE

-- Tabla hospital
create table Hospital(
    idHospital int not null primary key auto_increment,
    NombreHos varchar(50) not null,
    DireccionHos varchar(50) not null,
    TelefonoHos varchar(20) not null,
    MunicipioDelegacion varchar(50) not null
);

-- Tabla especialidad
create table Especialidad(
    idEspecialidad int not null primary key auto_increment,
    NombreEspecialidad varchar(50) not null
);

-- Tabla paciente
create table Paciente(
    idPaciente int not null primary key auto_increment,
    CURP char(18) not null,
    NombrePac varchar(50) not null,
    ApellidoPac varchar(50) not null,
    TelefonoPac varchar(20) not null,
    Correo varchar(100) unique not null
);

-- 2. TABLAS HIJAS

-- Tabla médico
create table Medico(
    idMedico int not null primary key auto_increment,
    idEspecialidad int not null,
    NombreMed varchar(50) not null,
    ApellidoMed varchar(50) not null,
    Cedula int not null, 
    foreign key (idEspecialidad) references Especialidad(idEspecialidad)
);

-- Tabla disponibilidad 
create table Disponibilidad(
    idDisponibilidad int not null primary key auto_increment,
    idHospital int not null,
    idMedico int not null,
    Fecha date not null,
    Hora time not null,
    foreign key (idHospital) references Hospital(idHospital),
    foreign key (idMedico) references Medico(idMedico)
);

-- Tabla cita 
create table Cita(
    idCita int not null primary key auto_increment,
    Folio varchar(10) not null,
    idDisponibilidad int not null,
    idPaciente int not null,
    foreign key (idDisponibilidad) references Disponibilidad(idDisponibilidad),
    foreign key (idPaciente) references Paciente(idPaciente)
);

-- Inserts para Hospital
INSERT INTO Hospital (NombreHos, DireccionHos, TelefonoHos, MunicipioDelegacion) VALUES 
('Hospital General', 'Av. Reforma 100', '5551234567', 'Cuauhtémoc'),
('Clínica del Sol', 'Calle Juárez 200', '5559876543', 'Benito Juárez'),
('Centro Médico ABC', 'Av. Observatorio 300', '5554567890', 'Miguel Hidalgo');

-- Inserts para Especialidad
INSERT INTO Especialidad (NombreEspecialidad) VALUES 
('Cardiología'),
('Pediatría'),
('Dermatología');

-- Inserts para Paciente
INSERT INTO Paciente (CURP, NombrePac, ApellidoPac, TelefonoPac, Correo) VALUES 
('ROPA901209HDFRRN01', 'Arturo', 'Romero', '5511223344', 'arturo@email.com'),
('LOPE850314MDFLXS02', 'María', 'López', '5522334455', 'maria@email.com'),
('GARC990722HDFGRR03', 'Carlos', 'García', '5533445566', 'carlos@email.com');

-- Inserts para Medico
INSERT INTO Medico (idEspecialidad, NombreMed, ApellidoMed, Cedula) VALUES 
(1, 'Roberto', 'Sánchez', 1234567),
(2, 'Laura', 'Gómez', 7654321),
(3, 'Elena', 'Torres', 9876543);

-- Inserts para Disponibilidad
INSERT INTO Disponibilidad (idHospital, idMedico, Fecha, Hora) VALUES 
(1, 1, '2023-11-01', '09:00:00'),
(2, 2, '2023-11-02', '10:30:00'),
(3, 3, '2023-11-03', '12:00:00');

-- Inserts para Cita
INSERT INTO Cita (Folio, idDisponibilidad, idPaciente) VALUES 
('CITA-001', 1, 1),
('CITA-002', 2, 2),
('CITA-003', 3, 3);

select * from hospital;
select * from cita;
select * from Disponibilidad;
select * from Especialidad;
select * from Medico;
select * from Paciente;

show tables;