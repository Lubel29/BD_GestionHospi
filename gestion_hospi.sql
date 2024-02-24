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
drop foreign key id_empleado_adm;

ALTER TABLE admision
ADD FOREIGN KEY (id_empleado_adm) references empleado_administrativo(id_empleado_adm);


ALTER TABLE admision MODIFY COLUMN id_admision int not null auto_increment;


