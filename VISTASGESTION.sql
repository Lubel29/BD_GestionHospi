USE gestion_hospitalaria;

-- Creacion vista de pacientes(nombre,apellido y n°afiliado) que sean mayor o igual de 30 años. --

CREATE VIEW mayores_30 AS
SELECT nombre,apellido,n_afiliado
FROM obrasocial
WHERE edad >= 30
ORDER BY nombre;

SELECT *FROM mayores_30;

-- Creacion vista, contar cuantos médicos son del sector 'GUARDIA'. --

CREATE VIEW c_guardia_med AS
SELECT COUNT(sector) AS total_medico_guardia
FROM medico
WHERE sector = 'guardia';

SELECT *FROM c_guardia_med;

-- Mostrar nombre,apellido y obras social del paciente y el nombre y apellido del medico que lo atendió --

CREATE VIEW consulta_1 AS
SELECT p.nombre AS Nombre_Paciente, p.apellido AS Apellido_Paciente, o.nombre_obrasocial AS Obra_Social, m.nombre AS Nombre_Medico, m.apellido AS Apellido_Medico
FROM admision a
INNER JOIN paciente p ON a.id_paciente = p.id_paciente
INNER JOIN obrasocial o ON a.id_obra_social = o.id_obrasocial
INNER JOIN medico m ON a.id_medico = m.id_medico;

SELECT *FROM consulta_1;

-- Ver el DNI y el nombre de la obra social de los pacientes y ordenar de forma ascendente el nombre de la obra social --

CREATE VIEW dni_obrasocial AS
SELECT dni, nombre_obrasocial from paciente
JOIN obrasocial
ON paciente.id_obrasocial = obrasocial.id_obrasocial
ORDER BY nombre_obrasocial ASC;

SELECT *FROM dni_obrasocial;

-- Ver promedio de pacientes que atendió el medico "Sebastián Herrera".

CREATE VIEW atencion_Herrera AS
SELECT FLOOR (AVG(cantidad_pacientes)) AS promedio_pacientes
FROM (SELECT COUNT(*) AS cantidad_pacientes
    FROM admision a
    INNER JOIN medico m ON a.id_medico = m.id_medico
    WHERE m.nombre = 'Sebastián' AND m.apellido = 'Herrera')as consulta;
    
SELECT *FROM atencion_Herrera;

-- Mostrar pacientes con o sin numero de habitacion y la fecha de ingreso--

CREATE VIEW vista_pacientes_habitaciones AS
SELECT i.numero_habitacion, i.fecha_ingreso, p.nombre, p.apellido
FROM paciente p
RIGHT JOIN internacion i ON p.id_paciente = i.id_paciente;

SELECT *FROM vista_pacientes_habitaciones;

SELECT *FROM internacion;

SELECT *from paciente;

-- Mostrar a qué paciente se le administró en el ALTA "Paracetamol" --

CREATE VIEW paciente_paracetamol AS
SELECT A.id_paciente, A.indicaciones
FROM alta A
WHERE indicaciones like upper('%paracetamol%');

SELECT *FROM paciente_paracetamol;

SELECT *FROM alta;







