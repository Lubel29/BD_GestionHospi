use gestion_hospitalaria; 

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

--------------------------------------------------------------

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

call Estudio_pendiente_id(1);









