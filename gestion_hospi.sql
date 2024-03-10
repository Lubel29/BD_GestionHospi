CREATE DATABASE GESTION_HOSPITALARIA;
USE GESTION_HOSPITALARIA;

-- Creacion tabla obra social

CREATE TABLE obrasocial(
id_obrasocial int primary key not null,
nombre varchar(20) not null,
apellido varchar(20) not null,
edad int not null,
n_afiliado int not null,
nombre_obrasocial varchar(20) not null
);


-- Creacion tabla paciente

CREATE TABLE Paciente(
id_paciente int primary key not null auto_increment,
nombre varchar(20) not null,
edad int not null,
apellido varchar(20) not null,
sexo varchar(2) not null,
dni int not null,
id_obrasocial int not null,
foreign key (id_obrasocial) references obrasocial(id_obrasocial)
);

ALTER TABLE paciente modify id_obrasocial INT null;

-- Creacion tabla médico

CREATE TABLE medico(
id_medico int primary key not null auto_increment,
nombre varchar(20) not null,
apellido varchar(20) not null,
especialidad varchar(20) not null,
matricula int not null,
sector varchar(20)
);

-- Creacion tabla historia clinica

CREATE TABLE historia_clinica(
id_historia_clinica int primary key not null auto_increment,
nombre varchar(20) not null,
apellido varchar(20) not null,
edad int not null,
fecha_de_nacimiento date not null,
sintomas varchar(250),
estudios_pendientes varchar(150),
estudios_hechos varchar(150)
);

-- Creacion tabla diagnostico

CREATE TABLE diagnostico(
id_diagnostico int primary key not null,
causa varchar(100) not null,
epicrisis varchar(200) not null,
id_medico int not null,
id_paciente int not null,
foreign key (id_medico) references medico(id_medico),
foreign key (id_paciente) references paciente(id_paciente)
);

alter table diagnostico
  modify epicrisis varchar(500) not null;

-- Creacion tabla alta

CREATE TABLE alta(
id_alta int primary key not null,
medicacion varchar(50) not null,
indicaciones varchar(200) not null,
periodo_internacion varchar(50) not null,
estudios_pendientes varchar(100),
fecha_alta date not null,
id_paciente int not null,
id_medico int not null,
id_diagnostico int not null,
foreign key(id_paciente) references paciente(id_paciente),
foreign key(id_medico) references medico(id_medico),
foreign key(id_diagnostico) references diagnostico(id_diagnostico)
);

-- Creacion tabla internacion

CREATE TABLE internacion(
id_internacion int primary key unique,
id_paciente int null,
numero_habitacion int null,
id_diagnostico int null,
fecha_ingreso date null,
foreign key(id_paciente) references paciente(id_paciente),
foreign key(id_diagnostico) references diagnostico(id_diagnostico)
);

-- Creacion tabla empleado_adm

CREATE TABLE empleado_administrativo(
id_empleado_adm int primary key not null,
apellido varchar(20) not null,
nombre varchar(20) not null,
legajo int not null
 );


-- Creacion tabla admision

CREATE TABLE admision(
id_admision int primary key not null,
id_paciente int not null,
id_medico int not null,
id_obra_social int not null,
id_alta int not null,
id_internacion int not null,
id_empleado_adm int not null,
foreign key(id_paciente) references paciente(id_paciente),
foreign key(id_medico) references medico(id_medico),
foreign key(id_obra_social) references obrasocial(id_obrasocial),
foreign key(id_alta) references alta(id_alta),
foreign key(id_internacion) references internacion(id_internacion));

alter table admision
add column id_diagnostico int not null;

alter table admision
add column id_historia_clinica int not null;

ALTER TABLE admision
ADD FOREIGN KEY (id_historia_clinica) references historia_clinica(id_historia_clinica);

ALTER TABLE admision
ADD FOREIGN KEY (id_empleado_adm) references empleado_administrativo(id_empleado_adm);

ALTER TABLE admision
ADD FOREIGN KEY (id_diagnostico) references diagnostico(id_diagnostico);

alter table admision
add column id_consulta int not null;

ALTER TABLE admision
ADD FOREIGN KEY (id_consulta) references consulta(id_consulta);

alter table admision
add column id_resultado_lab int not null;

ALTER TABLE admision
ADD FOREIGN KEY (id_resultado_lab) references resultado_laboratorio(id_resultado_lab);

alter table admision
add column id_datos_paciente int not null;

ALTER TABLE admision
ADD FOREIGN KEY (id_datos_paciente) references datos_paciente(id_datos_paciente);

alter table admision
add column id_resultado int not null;

ALTER TABLE admision
ADD FOREIGN KEY (id_resultado) references resultados_estudios(id_resultado);

alter table admision
add column id_nota int not null;

ALTER TABLE admision
ADD FOREIGN KEY (id_nota) references notas_administrativos_pacientes (id_nota);


ALTER TABLE admision MODIFY COLUMN id_admision int not null auto_increment;

select *from admision;

-- Creación de la tabla de consultas

CREATE TABLE consulta (
    id_consulta INT PRIMARY KEY AUTO_INCREMENT,
    fecha_consulta DATE NOT NULL,
    hora_consulta TIME NOT NULL,
    id_medico INT NOT NULL,
    id_paciente INT NOT NULL,
    id_diagnostico INT,
    FOREIGN KEY (id_medico) REFERENCES medico(id_medico),
    FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente),
    FOREIGN KEY (id_diagnostico) REFERENCES diagnostico(id_diagnostico)
);

-- Creación de la tabla resultado_laboratorio

CREATE TABLE resultado_laboratorio (
    id_resultado_lab INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATE NOT NULL,
    id_paciente INT NOT NULL,
    tipo_analisis VARCHAR(100) NOT NULL,
    resultado VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente)
);

-- Creacion de la tabla datos_paciente

CREATE TABLE datos_paciente (
    id_datos_paciente INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT,
    antecedentes_medicos varchar(250),
    alergias varchar(100),
    medicamentos varchar(250),
    cirugias_previas varchar(500),
    FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente)
);

-- Creacion de la tabla resultados_imag_elec

CREATE TABLE resultados_estudios (
    id_resultado INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT,
    tipo_estudio VARCHAR(100),
    resultado varchar(250),
    fecha_realizacion DATE,
    FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente)
);


-- Creación de la tabla de notas de administrativos sobre pacientes
CREATE TABLE notas_administrativos_pacientes (
    id_nota INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT,
    id_empleado_adm INT,
    fecha DATE,
    nota TEXT,
    FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente),
    FOREIGN KEY (id_empleado_adm) REFERENCES empleado_administrativo(id_empleado_adm)
);



