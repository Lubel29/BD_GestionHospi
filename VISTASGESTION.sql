USE gestion_hospitalaria;

--------------------------------------------

CREATE VIEW mayores_30 AS
SELECT nombre,apellido,n_afiliado
FROM obrasocial
WHERE edad >= 30
ORDER BY nombre;

SELECT *FROM mayores_30;

--------------------------------------------

CREATE VIEW c_guardia_med AS
SELECT COUNT(sector) AS total_medico_guardia
FROM medico
WHERE sector = 'guardia';

SELECT *FROM c_guardia_med;

--------------------------------------------

CREATE VIEW consulta_1 AS
SELECT p.nombre AS Nombre_Paciente, p.apellido AS Apellido_Paciente, o.nombre_obrasocial AS Obra_Social, m.nombre AS Nombre_Medico, m.apellido AS Apellido_Medico
FROM admision a
INNER JOIN paciente p ON a.id_paciente = p.id_paciente
INNER JOIN obrasocial o ON a.id_obra_social = o.id_obrasocial
INNER JOIN medico m ON a.id_medico = m.id_medico;

SELECT *FROM consulta_1;


--------------------------------------------


CREATE VIEW dni_obrasocial AS
SELECT dni, nombre_obrasocial from paciente
JOIN obrasocial
ON paciente.id_obrasocial = obrasocial.id_obrasocial
ORDER BY nombre_obrasocial ASC;

SELECT *FROM dni_obrasocial;

--------------------------------------------

CREATE VIEW atencion_Herrera AS
SELECT FLOOR (AVG(cantidad_pacientes)) AS promedio_pacientes
FROM (SELECT COUNT(*) AS cantidad_pacientes
    FROM admision a
    INNER JOIN medico m ON a.id_medico = m.id_medico
    WHERE m.nombre = 'Sebastián' AND m.apellido = 'Herrera')as consulta;
    
SELECT *FROM atencion_Herrera;

--------------------------------------------

CREATE VIEW vista_pacientes_habitaciones AS
SELECT i.numero_habitacion, i.fecha_ingreso, p.nombre, p.apellido
FROM paciente p
RIGHT JOIN internacion i ON p.id_paciente = i.id_paciente;

SELECT *FROM vista_pacientes_habitaciones;

SELECT *FROM internacion;

SELECT *from paciente;

--------------------------------------------

CREATE VIEW paciente_paracetamol AS
SELECT A.id_paciente, A.indicaciones
FROM alta A
WHERE indicaciones like upper('%paracetamol%');

SELECT *FROM paciente_paracetamol;

SELECT *FROM alta;







