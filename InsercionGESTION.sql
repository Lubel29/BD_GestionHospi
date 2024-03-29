USE gestion_hospitalaria;

-- Insertar datos en la tabla

-- Inserción de datos obrasocial

INSERT INTO obrasocial (id_obrasocial,nombre,apellido,edad,n_afiliado,nombre_obrasocial)
VALUES
(1,'Ana','Garcia',30,5236,'Osmecon'),
(2,'Juan','Martinez',25,6897,'Galeno'),
(3,'Laura','Perez',35,7845,'Swiss'),
(4,'Carlos','Sanchez',28,2535,'Sancor'),
(5,'Maria','Rodriguez',22,4122,'Osde'),
(6,'Pedro', 'Lombardo', '10', '8752', 'Swiss');

Select *from obrasocial;

UPDATE obrasocial SET nombre_obrasocial = 'Osde' WHERE id_obrasocial=4;



-- Inserción de datos paciente

INSERT INTO paciente (nombre,apellido,edad,sexo,DNI,id_obrasocial)
VALUES
('Ana','Garcia',30, 'F', 54897658,1),
('Juan','Martinez',25,'M',17654321,2),
('Laura','Perez',35,'M',35985647,3),
('Carlos','Sanchez',28,'M',34568794,4),
('Maria','Rodriguez',22,'F',45901963,5),
('Pedro','Lombardo', 10,'M',50635478,6);

select *from paciente;

DELETE FROM paciente where id_paciente=7;


-- Inserción de datos medico

INSERT INTO medico (nombre,apellido,especialidad,matricula,sector)
VALUES
('Martín','García','Cardiología',12345,'internados'),
('Valentina','López','pediatría',67890,'guardia'),
('Alejandro','Ramírez','Dermatología',54321,'ambulatorios'),
('Camila','Fernández','Traumatología',98765,'guardia'),
('Sebastián','Herrera','oftalmología',34567,'ambulatorios'),
('Florencia', 'Mor', 'Pediatria', '78421', 'guardia');


Select *from medico;

UPDATE medico SET especialidad = 'Neurologa' where id_medico =2;
UPDATE medico SET especialidad ='clinico' where id_medico=5;



-- Inserción de datos historia_clinica

INSERT INTO historia_clinica(nombre,apellido,edad,fecha_de_nacimiento,sintomas,estudios_pendientes,estudios_hechos)
VALUES
('Ana','Garcia',30,'1994-02-02','cefalea y fotofobia','tomografia','analisis de sangre'),
('Juan','Martinez',25,'1999-10-01','fiebre y fatiga generalizada','hisopado covid, analisis de sangre',''),
('Laura','Perez',35,'1989-12-11','tos persistente,congestion nasal y perdida del olfato','hisopado faringeo, analisis de sangre','radiografia pecho'),
('Carlos','Sanchez',28,'1996-08-05','mareos,nauseas,dolor de pecho','analisis de sangre','electrocardiograma'),
('Maria','Rodriguez',22,'2002-12-15','dolor de garganta,fatiga,perdida de apetito','hisopado covid,analisis de sangre',''),
('Pedro', 'Lombardo', '10', '2014-01-03', 'Dolor estomacal, vomitos, histeria', 'analisis de sangre', 'ecografia');


select *from historia_clinica;



-- Inserción de datos diagnostico

INSERT INTO diagnostico(id_diagnostico,causa,epicrisis,id_medico,id_paciente)
VALUES
(1,'Migraña','El paciente fue evaluado y diagnosticado con cefalea y fotofobia, los cuales son consistentes con un patrón migranoso. Se recomienda un enfoque terapéutico que incluya medidas para gestionar el dolor agudo, así como estrategias preventivas para reducir la frecuencia y la intensidad de los episodios de migraña.Se sugiere internacion.',2,1),
(2,'Infeccion viral','Se han realizado pruebas iniciales para investigar la posible causa, y se sospecha de una infección sistémica. Se ha iniciado tratamiento empírico para abordar los síntomas y se realizarán más estudios para identificar el agente infeccioso específico. Se aconseja al paciente descanso adecuado, hidratación y seguir el régimen de medicamentos según lo recetado. Se programó un seguimiento para evaluar la respuesta al tratamiento y realizar ajustes según sea necesario.Reposo en domicilio 48hs',5,2),
(3,'Infeccion respiratoria(gripe)','El paciente fue evaluado debido a una tos persistente, congestión nasal y pérdida del olfato. Estos síntomas sugieren una infección respiratoria viral, posiblemente el virus del resfriado común, la influenza o, en casos más específicos, el virus SARS-CoV-2. Se han iniciado medidas de apoyo, incluyendo hidratación adecuada, descanso y medicamentos sintomáticos.Se aconseja el aislamiento para prevenir la propagación en su domicilio',5,3),
(4,'Angina de pecho','Dada la naturaleza de los síntomas y la preocupación por posibles problemas cardíacos, se han realizado pruebas cardíacas y estudios adicionales. Se ha iniciado un plan de tratamiento que puede incluir medicamentos para el control del dolor y medidas específicas para abordar la condición subyacente. Se requiere internacion.',1,4),
(5,'Faringitis','Se han iniciado medidas de apoyo, incluyendo hidratación adecuada, descanso y medicamentos sintomáticos. Dado el dolor de garganta, se realizó una prueba para estreptococos, el cual dió positivo. Se programó un seguimiento para evaluar la evolución y ajustar el tratamiento según sea necesario. Se aconseja al paciente buscar atención médica si los síntomas persisten o empeoran, o si surgen nuevos síntomas preocupantes.Reposo en domicilio 72hs',5,5),
(6,'Gastroenteritis aguda', 'fue admitido/a al servicio de urgencias con quejas de dolor abdominal agudo, vómitos y histeria. Se realizaron evaluaciones físicas, análisis de laboratorio y, si es necesario, estudios radiológicos para determinar la causa subyacente de los síntomas.',6,6);


select *from diagnostico;
delete from diagnostico where epicrisis;




-- Inserción de datos Alta

INSERT INTO alta(id_alta, medicacion, indicaciones, periodo_internacion, estudios_pendientes, fecha_alta, id_paciente, id_medico, id_diagnostico) 
VALUES  
(1, 'Migral', 'Se sugiere migral cada 24hs en caso de mucho dolor y estar atento a otros síntomas', '5 días', 'tomografía', '2020-03-06', 1, 2, 1), 
(2, 'Amoxiclavulánico, Paracetamol', 'Se le receta amoxiclavulánico 1gr cada 12hs + paracetamol cada 8hs, hidratación y reposo 48hs', '', '', '2021-04-21', 2, 5, 2), 
(3, 'Flonase(Corticoides nasal),Nebulizaciones sc fisio', 'Se sugiere utilizar corticoides nasales y nebulizaciones por 7 días, reposo 48hs','','', '2020-05-05', 3, 5, 3), 
(4, 'Nitroglicerina sublingual o en spray', 'Se receta vasodilatador para prevenir futuros episodios y estar atento a nuevos síntomas', '10 días', 'electrocardiograma, análisis de sangre', '2019-02-18', 4, 1, 4), 
(5, 'Penicilina 1.000.000 U.I.', 'Se receta penicilina oral cada 24hs por placas y reposo 72hs en domicilio', '', '', '2023-08-17', 5, 5, 5), 
(6, 'Enterogermina Plus', 'Se da de alta, se recomienda hidratacion frecuente, y toma de 1 ampolla de enterogermina plus x 5 dias.', '', '', '2024-02-15', 6, 6, 6);

SELECT *from alta;

UPDATE alta SET medicacion = 'Flonase(Corticoides nasal),Nebulizaciones sc fisio' where id_alta=3;
UPDATE alta SET estudios_pendientes = null where id_alta=2;
UPDATE alta SET estudios_pendientes = null where id_alta=3;
UPDATE alta SET estudios_pendientes = null where id_alta=5;



-- Inserción de datos internacion

INSERT INTO internacion (id_internacion,id_paciente,numero_habitacion,id_diagnostico,fecha_ingreso)
VALUES
(1,1,15,1,'2020-03-01'),
(2,2,null,2,'2021-04-21'),
(3,3,null,3,'2020-05-05'),
(4,4,7,4,'2019-02-08'),
(5,5,null,5,'2023-08-17'),
(6,6,null,6,'2024-02-15');


select *from internacion;



-- Inserción de datos empleado_adm

ALTER TABLE empleado_administrativo MODIFY COLUMN id_empleado_adm INT AUTO_INCREMENT;


INSERT INTO empleado_administrativo (apellido, nombre, legajo) VALUES 
('Moreno', 'Debora', 1665),
('Belmonte', 'Lucia', 1663),
('Gonzales', 'Mateo', 1667),
('Torrico', 'Amadeo', 1669),
('Hernandez', 'Josefina', 1365),
('Fernandez', 'Florencia', 1368);

delete from empleado_administrativo where id_empleado= 2;

select *from empleado_administrativo;


-- Inserción de datos admision

INSERT INTO admision (id_paciente, id_medico, id_obra_social, id_alta, id_internacion, id_empleado_adm,id_diagnostico,id_historia_clinica)
VALUES 
    (1, 2, 1, 1, 1, 3, 1, 1),
    (2, 5, 2, 2, 2, 5, 2, 2),
    (3, 5, 3, 3, 3, 6, 3, 3),
    (4, 1, 4, 4, 4, 1, 4, 4),
    (5, 5, 4, 4, 5, 4, 5, 5),
    (6, 6, 3, 6, 6, 1, 6, 6);

select *from admision;


UPDATE admision SET id_alta = 5 WHERE id_paciente =5;
UPDATE admision SET id_alta = 4 WHERE id_paciente =4;

-- Inserción de datos en la tabla de consultas

INSERT INTO consulta (fecha_consulta, hora_consulta, id_medico, id_paciente, id_diagnostico) VALUES
('2020-03-01', '10:00:00',2,1,1),
('2021-04-21', '11:30:00',5,2,2),
('2020-05-05', '09:15:00',5,3,3),
('2019-02-08', '14:45:00',1,4,4),
('2023-08-17', '07:08:00',5,5,5),
('2024-02-15', '20:20:00',6,6,6);


select *from consulta;

-- Inserción de datos en la tabla resultado_laboratorio

INSERT INTO resultado_laboratorio (fecha, id_paciente, tipo_analisis, resultado)
VALUES
    ('2020-03-01', 1, 'Análisis clínicos', 'Hematocrito escaso,posible anemia'),
    ('2021-04-21', 2, 'Análisis clínicos', 'Normal'),
    ('2020-05-05', 3, 'Análisis clínicos', 'Pendiente'),
    ('2019-02-08', 4, 'Análisis clínicos', 'pendiente'),
    ('2023-08-17', 5, 'Análisis clínicos', 'Globulos blancos bajos'),
    ('2024-02-15', 6, 'Análisis clínicos', 'pendiente');
    
    select *from resultado_laboratorio;
    
-- Insercion datos en la tabla datos_paciente
    
INSERT INTO datos_paciente (id_paciente, antecedentes_medicos, alergias, medicamentos, cirugias_previas)
VALUES
(1, 'Hipertensión arterial', 'Ninguna', 'Aspirina', 'Apendicectomía'),
(2, 'Ninguno', 'Penicilina', 'Ninguno', 'Ninguna'),
(3, 'Asma', 'Ninguna', 'Inhalador', 'Ninguna'),
(4, 'Ninguno', 'Ninguna', 'Aspirinetas', 'bypass coronario'),
(5, 'Ninguno', 'Ninguna', 'Ninguno', 'Ninguna'),
(6, 'Ninguno', 'Ninguna', 'Ninguno', 'Ninguna');

-- Insercion datos en la tabla resultados_estudios

INSERT INTO resultados_estudios (id_paciente, tipo_estudio, resultado, fecha_realizacion)
VALUES
(1, 'Tomografía', 'Se observa una lesión en el lóbulo frontal izquierdo.', '2020-03-01'),
(2, '', '', '2021-04-21'),
(3, 'Radiografía de pecho', 'No se observan signos de neumonia.', '2020-05-05'),
(4, 'Electrocardiograma', 'Presencia de ritmo cardíaco irregular.', '2019-02-08'),
(5, '', '', '2023-08-17'),
(6, 'Ecografia de abdomen', 'Se observan signos de inflamación en el área abdominal.', '2024-02-15');


-- Inserción de datos de notas de administrativos sobre pacientes
INSERT INTO notas_administrativos_pacientes (id_paciente, id_empleado_adm, fecha, nota)
VALUES
    (1, 1, '2020-03-01', 'Se coordinó la programación de estudios adicionales para el paciente.'),
    (2, 2, '2021-04-21', 'Se realizó la actualización de la información de contacto del paciente.'),
    (3, 3, '2020-05-05', 'Se brindó asistencia al paciente para completar el formulario de consentimiento.'),
    (4, 4, '2019-02-08', 'Se verificó el estado del seguro médico del paciente.'),
    (5, 5, '2023-08-17', 'Se programó una consulta de seguimiento para el paciente.'),
    (6, 6, '2024-02-15', 'Se coordinó el traslado del paciente a otro centro de atención médica.');
    
select *from notas_administrativos_pacientes;





