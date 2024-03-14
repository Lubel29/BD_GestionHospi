use gestion_hospitalaria;

create table pacientes_2025(
id_paciente int primary key auto_increment,
nombre varchar(20) not null,
apellido varchar(20) not null,
ingreso datetime not null);


insert into paciente(id_paciente,nombre,edad,apellido,sexo,dni,id_obrasocial)
values (8,'Justina',8,'Granados','F',69645715,2);
insert into paciente(id_paciente,nombre,edad,apellido,sexo,dni,id_obrasocial)
values (7,'Felipe',11,'Granados','M',64567954,2);

DELIMITER //
CREATE TRIGGER pacientes_nuevoAño
AFTER INSERT ON paciente
FOR EACH ROW
BEGIN
INSERT INTO pacientes_2025(id_paciente,nombre,apellido,ingreso) values(new.id_paciente, new.nombre, new.apellido, now());
END
//
DELIMITER ;

select *from paciente;

select *from pacientes_2025;

-- drop table pacientes_2025;
-- drop trigger pacientes_nuevoAño;



---------------------------------------------------------

DELIMITER $$
CREATE TRIGGER eliminar_habitacion
BEFORE DELETE ON internacion
FOR EACH ROW
BEGIN
    IF OLD.numero_habitacion IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se permite eliminar habitación';
    END IF;
END $$
$$
DELIMITER ;


DELETE FROM admision WHERE id_internacion IN (SELECT id_internacion FROM internacion WHERE numero_habitacion = 7);

DELETE FROM internacion WHERE numero_habitacion = 7;

-- SET SQL_SAFE_UPDATES = 0;
-- SET SQL_SAFE_UPDATES = 1;

select *from internacion;

select *from admision;


