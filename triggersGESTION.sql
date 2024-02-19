-- Descripcion : Creacion de Trigger AFTER INSERT donde creo una tabla para el ingreso SOLO de los pacientes del nuevo año 2025, donde le indico que ejecute una accion posterior al alta de un nuevo paciente en la tabla homónima que sería "Paciente". La nueva tabla me indicará el id del paciente nuevo, nombre, apellido e incluso la fecha y hora en la que se ingresó la paciente.
-- Objetivo: Con el objetivo de saber los nuevos pacientes que ingresaron en el nuevo año, con su id, nombre, apellido, dia y hora en el que se ingresó la paciente.
-- Tablas: paciente

create table pacientes_2025(
id_paciente int primary key auto_increment,
nombre varchar(20) not null,
apellido varchar(20) not null,
ingreso datetime not null);


DELIMITER //
CREATE TRIGGER pacientes_nuevoAño
AFTER INSERT ON paciente
FOR EACH ROW
begin
INSERT INTO pacientes_2025(id_paciente,nombre,apellido,ingreso) values(new.id_paciente, new.nombre, new.apellido, now());
END
//
DELIMITER ;


insert into paciente(id_paciente,nombre,edad,apellido,sexo,dni,id_obrasocial)
values (8,'Justina',8,'Granados','F',69645715,2);
insert into paciente(id_paciente,nombre,edad,apellido,sexo,dni,id_obrasocial)
values (7,'Felipe',11,'Granados','M',64567954,2);

select *from paciente;

select *from pacientes_2025;

drop table pacientes_2025;
drop trigger pacientes_nuevoAño;



-- Descripcion : Creacion de Trigger BEFORE DELETE en la tabla internacion, con intervencion del numero_habitacion donde el disparador no permita eliminar la habitacion que esté ocupada por un numero. Coloco como condicion si el numero de habitacion de la tabla anterior NO es null entonces se reciba un mensaje de "No se permite eliminar habitacion".
-- Objetivo: Evitar eliminar una habitacion ocupada de la tabla internacion.
-- Tablas: internacion

DELIMITER $$
CREATE TRIGGER eliminar_habitacion
BEFORE DELETE ON internacion
FOR EACH ROW
BEGIN
    IF OLD.numero_habitacion IS NOT NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se permite eliminar habitación';
    END IF;
END $$
$$
DELIMITER ;

DELETE FROM internacion WHERE numero_habitacion = 7;

SET SQL_SAFE_UPDATES = 0;
SET SQL_SAFE_UPDATES = 1;

select *from internacion;


