CREATE DATABASE GESTION_HOSPITALARIA;
USE GESTION_HOSPITALARIA;

CREATE TABLE obrasocial(
id_obrasocial int primary key not null,
nombre varchar(20) not null,
apellido varchar(20) not null,
edad int not null,
n_afiliado int not null,
nombre_obrasocial varchar(20) not null
);

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

CREATE TABLE medico(
id_medico int primary key not null auto_increment,
nombre varchar(20) not null,
apellido varchar(20) not null,
especialidad varchar(20) not null,
matricula int not null,
sector varchar(20)
);

CREATE TABLE historia_clinica(
id_historia_clinica int primary key not null auto_increment,
nombre varchar(20) not null,
apellido varchar(20) not null,
edad int not null,
fecha_de_nacimiento date not null,
historia_clinica varchar(250),
estudios_pendientes varchar(100),
estudios_hechos varchar(100)
);

CREATE TABLE diagnostico(
id_diagnostico int primary key not null,
causa varchar(100) not null,
resultado varchar(100) not null,
id_medico int not null,
id_paciente int not null,
foreign key (id_medico) references medico(id),
foreign key (id_paciente) references paciente(id)
);

ALTER TABLE medico
ADD COLUMN sector varchar(20);










