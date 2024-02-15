-- Segun la edad, mostrar si el paciente es pediatrico o adulto --

DELIMITER //
CREATE PROCEDURE pacientes_pediatricos(in edad int)
BEGIN
	IF edad <= 17 THEN
		SELECT 'pediatrico' as Categoria;
	ELSE
		SELECT 'Adulto' as Categoria;
	END IF;
END //
DELIMITER ;

CALL pacientes_pediatricos(18);


SELECT *FROM paciente;

-- Segun el id del paciente que ingreso, muestra los estudios que tiene pendientes en caso de ser NUll mostrará un msje que dice "No hay ningun estudio pendiente" --

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









