USE gestion_hospitalaria;

--------------------------------------------

DELIMITER $$
CREATE FUNCTION numero_hab (id_paciente INT) RETURNS INT DETERMINISTIC
BEGIN 
    DECLARE numero_hab_result INT;
    SET numero_hab_result = NULL;
    SELECT numero_habitacion INTO numero_hab_result FROM internacion WHERE id_paciente = id_internacion LIMIT 1;
    RETURN numero_hab_result;
END $$
DELIMITER ;

select gestion_hospitalaria.numero_hab(1);

select *from internacion;


--------------------------------------------

DELIMITER $$
CREATE FUNCTION medico_por_especialidad(especialidad_medico VARCHAR(50)) RETURNS VARCHAR(50) DETERMINISTIC
BEGIN
    DECLARE nombre_medico VARCHAR(50);
    SELECT CONCAT(nombre, ' ', apellido) into nombre_medico
    FROM medico 
    WHERE especialidad = especialidad_medico
    LIMIT 10;    
    RETURN nombre_medico;
END$$
DELIMITER ;


select gestion_hospitalaria.medico_por_especialidad('TRAUMATOLOGIA') as medico;

select *from medico;

--------------------------------------------

DELIMITER $$
CREATE FUNCTION contarobrasocial(nombre_consulta VARCHAR(50)) RETURNS INT DETERMINISTIC
BEGIN
    DECLARE countObrasocial INT;
    SELECT COUNT(*) INTO countObrasocial FROM obrasocial WHERE nombre_obrasocial = nombre_consulta;    
    RETURN countObrasocial;
END$$
DELIMITER ;


SELECT contarobrasocial('Galeno');

select *from obrasocial;



