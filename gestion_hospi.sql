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
id_obrasocial varchar(30) not null,
 FOREIGN KEY (id_obrasocial) REFERENCES obrasocial(id_obrasocial)
);

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
foreign key (id_medico) references medico(id),
foreign key (id_paciente) references paciente(id)
);

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
foreign key(id_paciente) references paciente(id),
foreign key(id_medico) references medico(id),
foreign key(id_diagnostico) references diagnostico(id)
);

-- Creacion tabla internacion

CREATE TABLE internacion(
id_internacion int primary key not null,
id_paciente int not null,
numero_habitacion int not null,
id_diagnostico int not null,
fecha_ingreso date not null,
foreign key(id_paciente) references paciente(id),
foreign key(id_diagnostico) references diagnostico(id)
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
foreign key(id_paciente) references paciente(id),
foreign key(id_medico) references medico(id),
foreign key(id_obra_social) references obrasocial(id),
foreign key(id_alta) references alta(id),
foreign key(id_internacion) references internacion(id),
foreign key(id_empleado_adm) references empleado_administrativo
);


ALTER TABLE medico
ADD COLUMN sector varchar(20);

ALTER TABLE admision
ADD column id_empleado_adm int not null;