USE gestion_hospitalaria;

-- Descripcion de la función : Creacion de la funcion para devolver el numero de habitacion ingresando el ID del paciente en caso de no tener habitacion se mostrará "NULL".
-- Objetivo: Devolver el numero de habitación en la que se encuentra el paciente segun su ID ingresado para poder llevar una organizacion en el manejo de las habitaciones y las internaciones si es que corresponde.
-- Tablas: PACIENTE/INTERNACION

DELIMITER $$
CREATE FUNCTION numero_hab (id_paciente INT) RETURNS INT DETERMINISTIC
BEGIN 
    DECLARE numero_hab_result INT;
    SET numero_hab_result = NULL;
    SELECT numero_habitacion INTO numero_hab_result FROM internacion WHERE id_paciente = id_internacion LIMIT 1;
    RETURN numero_hab_result;
END $$
DELIMITER ;

select gestion_hospitalaria.numero_hab(2);

select *from internacion;


-- Descripcion de la función : Creacion de la funcion para devolver el nombre y apellido(concatenado) del medico segun la especialidad ingresada.
-- Objetivo: Saber el nombre y apellido del medico al ingresar la especialidad que se está buscando.
-- Tablas: Medico.

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


-- Descripcion de la función : Creacion de la funcion para contar cuantas veces aparece la obra social que se coloca en la consulta.
-- Objetivo: Conocer cuantos pacientes utilizan la obra social que se coloca en la consulta; Por ejemplo si coloco 'Swiss' va a contar que 2 veces aparece el nombre de Swiss en la tabla de obrasocial porque 2 pacientes tiene SWISS.
-- Tablas: Obrasocial

DELIMITER $$
CREATE FUNCTION contarobrasocial(nombre_consulta VARCHAR(50)) RETURNS INT DETERMINISTIC
BEGIN
    DECLARE countObrasocial INT;
    SELECT COUNT(*) INTO countObrasocial FROM obrasocial WHERE nombre_obrasocial = nombre_consulta;    
    RETURN countObrasocial;
END$$
DELIMITER ;


SELECT contarobrasocial('Swiss');

select *from obrasocial;



