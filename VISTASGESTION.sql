USE gestion_hospitalaria;

-- Descripcion de la vista: Creacion vista de pacientes(nombre,apellido y n°afiliado) que sean mayor o igual de 30 años
-- Objetivos: Mostrar los pacientes que son mayores o = a 30 años detallando nombre,apellido y n°afiliado 
-- Tablas: obrasocial / paciente 

CREATE VIEW mayores_30 AS
SELECT nombre,apellido,n_afiliado
FROM obrasocial
WHERE edad >= 30
ORDER BY nombre;

SELECT *FROM mayores_30;

-- Descripcion de la vista: Creacion vista para contar cuantos médicos son del sector "Guardia".
-- Objetivos: Saber cuantos médicos tiene la institucion destinados al sector "Guardia".
-- Tablas: Médico

CREATE VIEW c_guardia_med AS
SELECT COUNT(sector) AS total_medico_guardia
FROM medico
WHERE sector = 'guardia';

SELECT *FROM c_guardia_med;

-- Descripcion de la vista: Creación de una vista para mostrar NOMBRE,APELLIDO Y OBRA SOCIAL del paciente y el Médico que lo atendió detallando Nombre y apellido del mismo.
-- Objetivos: Conocer el médico que atendió a cada paciente.
-- Tablas: paciente / obrasocial / medico 

CREATE VIEW consulta_1 AS
SELECT p.nombre AS Nombre_Paciente, p.apellido AS Apellido_Paciente, o.nombre_obrasocial AS Obra_Social, m.nombre AS Nombre_Medico, m.apellido AS Apellido_Medico
FROM admision a
INNER JOIN paciente p ON a.id_paciente = p.id_paciente
INNER JOIN obrasocial o ON a.id_obra_social = o.id_obrasocial
INNER JOIN medico m ON a.id_medico = m.id_medico;

SELECT *FROM consulta_1;


-- Descripcion de la vista: Creacion vista para ver el DNI correspondiente a cada obrasocial.
-- Objetivos: Mostrar el DNI que le corresponder a cada obrasocial. Se podría utilizar para completar datos o verificarlos.
-- Tablas: paciente / obrasocial


CREATE VIEW dni_obrasocial AS
SELECT dni, nombre_obrasocial from paciente
JOIN obrasocial
ON paciente.id_obrasocial = obrasocial.id_obrasocial
ORDER BY nombre_obrasocial ASC;

SELECT *FROM dni_obrasocial;

-- Descripcion de la vista: Creacion vista para calcular el promedio(redondeado) de pacientes que atendió el DR "Sebastian Herrera".
-- Objetivos: Mostrar el promedio que atendió el DR "Sebastian Herrera" para tener un calculo aproximado de los pacientes que estuvieron bajo su cargo.
-- Tablas: admision/ medico

CREATE VIEW atencion_Herrera AS
SELECT FLOOR (AVG(cantidad_pacientes)) AS promedio_pacientes
FROM (SELECT COUNT(*) AS cantidad_pacientes
    FROM admision a
    INNER JOIN medico m ON a.id_medico = m.id_medico
    WHERE m.nombre = 'Sebastián' AND m.apellido = 'Herrera')as consulta;
    
SELECT *FROM atencion_Herrera;

-- Mostrar pacientes con o sin numero de habitacion y la fecha de ingreso--
-- Descripcion de la vista: Creacion de una vista para visualizar los pacientes que tengan asignada una habitacion o NO la tengan asignada y la fecha de ingreso.
-- Objetivos: Saber que pacientes(con nombre y apellido) se encuentran ocupando una habitacion, cuales no tienen habitacion asignada(null) y la fecha de ingreso de los mismos.
-- Tablas: paciente / internacion

CREATE VIEW vista_pacientes_habitaciones AS
SELECT i.numero_habitacion, i.fecha_ingreso, p.nombre, p.apellido
FROM paciente p
RIGHT JOIN internacion i ON p.id_paciente = i.id_paciente;

SELECT *FROM vista_pacientes_habitaciones;

SELECT *FROM internacion;

SELECT *from paciente;

-- Descripcion de la vista: Creacion vista de pacientes(por numero de ID) a las que en el ALTA se le indicó "Paracetamol".
-- Objetivos: Mostrar a los pacientes que en el ALTA se le indicó "Paracetamol" para llevar una estadistica de a que pacientes se le indicó esta droga.
-- Tablas: alta/paciente 

CREATE VIEW paciente_paracetamol AS
SELECT A.id_paciente, A.indicaciones
FROM alta A
WHERE indicaciones like upper('%paracetamol%');

SELECT *FROM paciente_paracetamol;

SELECT *FROM alta;







