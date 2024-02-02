USE gestion_hospitalaria;

-- Insertar datos en la tabla 
-- Creacion datos admision --
SELECT *from admision;

INSERT INTO admision (id_paciente, id_medico, id_obra_social, id_alta, id_internacion, id_empleado_adm) 
VALUES 
  (1, 2, 3, 4, 5, 6, 7),
  (1, 2, 3, 4, 5, 6, 7),
  (1, 2, 3, 4, 5, 6, 7),
  (1, 2, 3, 4, 5, 6, 7),
  (1, 2, 3, 4, 5, 6, 7),
  (1, 2, 3, 4, 5, 6, 7);

delete from admision
where id_admision = 0;

-- Creacion datos empleado_adm--

ALTER TABLE empleado_administrativo MODIFY COLUMN id_empleado_adm INT AUTO_INCREMENT;


INSERT INTO empleado_administrativo (apellido, nombre, legajo) VALUES 
('Moreno', 'Debora', 1665),
('Belmonte', 'Lucia', 1663),
('Gonzales', 'Mateo', 1667),
('Torrico', 'Amadeo', 1669),
('Hernandez', 'Josefina', 1365),
('Fernandez', 'Florencia', 1368);

select *from empleado_administrativo;

-- Creacion datos paciente--

INSERT INTO paciente (id_obrasocial,nombre,apellido,edad,sexo,DNI)
VALUES
(1,'Ana','Garcia',30, 'F', 54897658),
(2,'Juan','Martinez',25,'M',17654321),
(3,'Laura','Perez',35,'M',35985647),
(4,'Carlos','Sanchez',28,'M',34568794),
(5,'Maria','Rodriguez',22,'F',45901963);

select *from paciente;

-- creacion datos id_obrasocial--

INSERT INTO obrasocial (id_obrasocial,nombre,apellido,edad,n_afiliado,nombre_obrasocial)
VALUES
(1,'Ana','Garcia',30,5236,'Osmecon'),
(2,'Juan','Martinez',25,6897,'Galeno'),
(3,'Laura','Perez',35,7845,'Swiss'),
(4,'Carlos','Sanchez',28,2535,'Sancor'),
(5,'Maria','Rodriguez',22,4122,'Osde');

Select *from obrasocial;

UPDATE obrasocial SET nombre_obrasocial = 'Osde' WHERE id_obrasocial=4;

-- Creacion datos medico--

INSERT INTO medico (nombre,apellido,especialidad,matricula,sector)
VALUES
('Martín','García','Cardiología',12345,'internados'),
('Valentina','López','pediatría',67890,'guardia'),
('Alejandro','Ramírez','Dermatología',54321,'ambulatorios'),
('Camila','Fernández','Traumatología',98765,'guardia'),
('Sebastián','Herrera','oftalmología',34567,'ambulatorios');

Select *from medico;

UPDATE medico SET especialidad = 'Neurologa' where id_medico =2;
UPDATE medico SET especialidad ='clinico' where id_medico=5;

-- Creacion datos internacion--

INSERT INTO internacion (id_internacion,id_paciente,numero_habitacion,id_diagnostico,fecha_ingreso)
VALUES
(1,1,15,1,'2020-03-01'),
(2,2,5,2,'2021-04-21'),
(3,3,11,3,'2020-05-05'),
(4,4,7,4,'2019-02-08'),
(5,5,18,5,'2023-08-17');

select *from internacion;

-- Creacion datos historia_clinica--

INSERT INTO historia_clinica(nombre,apellido,edad,fecha_de_nacimiento,sintomas,estudios_pendientes,estudios_hechos)
VALUES
('Ana','Garcia',30,'1994-02-02','cefalea y fotofobia','tomografia','analisis de sangre'),
('Juan','Martinez',25,'1999-10-01','fiebre y fatiga generalizada','hisopado covid, analisis de sangre',''),
('Laura','Perez',35,'1989-12-11','tos persistente,congestion nasal y perdida del olfato','hisopado faringeo, analisis de sangre','radiografia pecho'),
('Carlos','Sanchez',28,'1996-08-05','mareos,nauseas,dolor de pecho','analisis de sangre','electrocardiograma'),
('Maria','Rodriguez',22,'2002-12-15','dolor de garganta,fatiga,perdida de apetito','hisopado covid,analisis de sangre','');

select *from historia_clinica;

-- Creacion datos diagnostico--

INSERT INTO diagnostico(id_diagnostico,causa,epicrisis,id_medico,id_paciente)
VALUES
(1,'Migraña','El paciente fue evaluado y diagnosticado con cefalea y fotofobia, los cuales son consistentes con un patrón migranoso. Se recomienda un enfoque terapéutico que incluya medidas para gestionar el dolor agudo, así como estrategias preventivas para reducir la frecuencia y la intensidad de los episodios de migraña.Se sugiere internacion.',2,1),
(2,'Infeccion viral','Se han realizado pruebas iniciales para investigar la posible causa, y se sospecha de una infección sistémica. Se ha iniciado tratamiento empírico para abordar los síntomas y se realizarán más estudios para identificar el agente infeccioso específico. Se aconseja al paciente descanso adecuado, hidratación y seguir el régimen de medicamentos según lo recetado. Se programó un seguimiento para evaluar la respuesta al tratamiento y realizar ajustes según sea necesario.Reposo en domicilio 48hs',5,2),
(3,'Infeccion respiratoria(gripe)','El paciente fue evaluado debido a una tos persistente, congestión nasal y pérdida del olfato. Estos síntomas sugieren una infección respiratoria viral, posiblemente el virus del resfriado común, la influenza o, en casos más específicos, el virus SARS-CoV-2. Se han iniciado medidas de apoyo, incluyendo hidratación adecuada, descanso y medicamentos sintomáticos.Se aconseja el aislamiento para prevenir la propagación en su domicilio',5,3),
(4,'Angina de pecho','Dada la naturaleza de los síntomas y la preocupación por posibles problemas cardíacos, se han realizado pruebas cardíacas y estudios adicionales. Se ha iniciado un plan de tratamiento que puede incluir medicamentos para el control del dolor y medidas específicas para abordar la condición subyacente. Se requiere internacion.',1,4),
(5,'Faringitis','Se han iniciado medidas de apoyo, incluyendo hidratación adecuada, descanso y medicamentos sintomáticos. Dado el dolor de garganta, se realizó una prueba para estreptococos, el cual dió positivo. Se programó un seguimiento para evaluar la evolución y ajustar el tratamiento según sea necesario. Se aconseja al paciente buscar atención médica si los síntomas persisten o empeoran, o si surgen nuevos síntomas preocupantes.Reposo en domicilio 72hs',5,5);


select *from diagnostico;
delete from diagnostico where epicrisis;

INSERT INTO alta(id_alta, medicacion, indicaciones, periodo_internacion, estudios_pendientes, fecha_alta, id_paciente, id_medico, id_diagnostico)
VALUES 
(1, 'Migral', 'Se sugiere migral cada 24hs en caso de mucho dolor y estar atento a otros síntomas', '5 días', 'tomografía', '2020-03-06', 1, 2, 1),
(2, 'Amoxiclavulánico, Paracetamol', 'Se le receta amoxiclavulánico 1gr cada 12hs + paracetamol cada 8hs, hidratación y reposo 48hs', '', '', '2021-04-21', 2, 5, 2),
(3, 'Flonase(Corticoides nasal),Nebulizaciones sc fisio', 'Se sugiere utilizar corticoides nasales y nebulizaciones por 7 días, reposo 48hs','','', '2020-05-05', 3, 5, 3),
(4, 'Nitroglicerina sublingual o en spray', 'Se receta vasodilatador para prevenir futuros episodios y estar atento a nuevos síntomas', '10 días', 'electrocardiograma, análisis de sangre', '2019-02-18', 4, 1, 4),
(5, 'Penicilina 1.000.000 U.I.', 'Se receta penicilina oral cada 24hs por placas y reposo 72hs en domicilio', '', '', '2023-08-17', 5, 5, 5);

SELECT *from alta;

UPDATE alta SET medicacion = 'Flonase(Corticoides nasal),Nebulizaciones sc fisio' where id_alta=3;



