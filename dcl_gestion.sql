CREATE USER "prueba"@"localhost" identified by "123456";

-- Permiso de lectura
GRANT SELECT on datos_paciente to "prueba"@"localhost";

-- Permiso de actualizar / insertar
GRANT UPDATE,INSERT ON gestion_hospitalaria.consulta TO 'prueba'@'localhost';


-- Permiso de eliminacion
GRANT DELETE ON *.* TO 'prueba'@'localhost';

SHOW GRANTS FOR "prueba"@"localhost";