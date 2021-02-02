CREATE SCHEMA IF NOT EXISTS GestionDeAnimales;

use GestionDeAnimales;

show databases;

show tables;

create table if not exists pets (
	name varchar(20),
    owner varchar(20),
    species varchar(20),
    sex char(1),
    birth date,
    death date
    );
    
describe pets;


CREATE TABLE IF NOT EXISTS empleados (
	id INT,
    nombre VARCHAR(30),
    edad INT
);

SHOW TABLES;

/* DROP TABLE empleados;*/

DESCRIBE empleados;

ALTER TABLE empleados
RENAME TO employees;

/*TRUNCATE TABLE employees;*/

ALTER TABLE employees ADD (
	oficina int
);

DESCRIBE employees;

ALTER TABLE employees ADD (
	jefe VARCHAR(20),
    departamento BIT
);





    