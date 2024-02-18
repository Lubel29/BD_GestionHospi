
-- Descripcion : Declaro la variable para la edad del paciente(la cual ya tengo en la tabla creada) y luego por medio de condiciones puedo saber si el paciente es 'Pediatrico' o 'Adulto'. Por ultimo, llamo la categoria con los valores ingresados.
-- Objetivo: Conocer segun nombre y apellido del paciente si entra en categoría "Pediatrico" o "Adulto" para saber a que sector derivarlo.
-- Tablas: paciente.

DELIMITER $$
CREATE PROCEDURE determinar_categoria (IN nombre_paciente VARCHAR(50), IN apellido_paciente VARCHAR(50), OUT categoria VARCHAR(50))
BEGIN
    DECLARE edad_paciente INT;
    SELECT edad INTO edad_paciente 
    FROM paciente 
    WHERE nombre = nombre_paciente AND apellido = apellido_paciente;
    
    IF edad_paciente < 18 THEN
        SET categoria = 'Pediatrico';
    ELSE
        SET categoria = 'Adulto';
    END IF;
END$$
DELIMITER ;


CALL determinar_categoria('Ana', 'garcia', @categoria);
SELECT @categoria as categoria_paciente;

SELECT *FROM paciente;




-- Descripcion : Declaro una varable de estudios_pendientes y luego me mostrará desde una con condicion si hay un estudio pendiente y sino mostrará un mensaje que dirá "No hay ningun estudio pendiente". Lo solicito mediante el numero de ID del paciente.
-- Objetivo: Con este procedimiento almacenado puedo conocer si el paciente tiene o no, estudios pendientes luego del ALTA.
-- Tablas: Alta.

DELIMITER //
CREATE PROCEDURE Estudio_pendiente_id(IN paciente_id INT)
BEGIN
    DECLARE estudio_pendiente VARCHAR(250);

    SELECT alta.estudios_pendientes INTO estudio_pendiente
    FROM alta
    WHERE alta.id_paciente = paciente_id;
    SELECT estudio_pendiente as Estudios_pendientes;

IF estudio_pendiente IS NULL THEN
        SELECT 'No hay ningún estudio pendiente' AS EstudioPendiente;
    ELSE
        SELECT estudio_pendiente as Estudios_pendientes;
    END IF;
END //
DELIMITER ;

call Estudio_pendiente_id(3);









