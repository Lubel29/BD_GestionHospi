CREATE USER "prueba"@"localhost" identified by "123456";

GRANT SELECT on datos_paciente to "prueba"@"localhost";
GRANT UPDATE,INSERT ON gestion_hospitalaria.consulta TO 'prueba'@'localhost';

SHOW GRANTS FOR "prueba"@"localhost";