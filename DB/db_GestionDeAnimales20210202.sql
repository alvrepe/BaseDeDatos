CREATE DATABASE if not exists gestiondeanimales;

USE gestiondeanimales;

SHOW DATABASES;

SHOW TABLES;

/*
	Creación de la tabla de mascotas
*/

CREATE TABLE IF NOT EXISTS pets (
	name_ varchar(20),
    owner_ VARCHAR(20),
    species VARCHAR(20),
    sex CHAR(1),
    birth DATE,
    death DATE
);

DESCRIBE pets;
/*
	Creación de la tabla de empleados
*/
CREATE TABLE IF NOT EXISTS empleados ( 
	id INT, 
    nombre VARCHAR(30), 
    edad int
);

SHOW tables;

DESCRIBE empleados;

/* 
	IMPORTANTE: REALIZAR COPIAS DE SEGURIDAD 
	DE LA BASE DE DATOS
*/

/* Cuidado con esta instrucción
Comentamos para que no se elimine la tabla */

/*DROP TABLE empleados;*/

ALTER TABLE nombre_tabla RENAME TO nuevo_nombre_tabla;                      

ALTER TABLE empleados RENAME TO employees;             		

/*
	Cuidado con esta instrucción
    porque elimina los datos de una tabla
*/
/*TRUNCATE TABLE employees;*/

ALTER TABLE employees ADD (
	oficina int
);

DESCRIBE employees;

ALTER TABLE employees ADD (
	jefe VARCHAR(20),
    departamento BIT
);

/*
	Cuidado al eliminar un campo, porque eliminas 
	los datos del mismo
*/

ALTER TABLE nombre_tabla 
	DROP nombre_columna, 
	DROP nombre_columna;

ALTER TABLE employees					
DROP jefe,
DROP departamento;

DESCRIBE employees;

ALTER TABLE employees ADD (
	boss VARCHAR(2),
    departamento BIT
);

/*
DEFINICIÓN
ALTER TABLE nombre_tabla 
MODIFY columna1 tipo_dato [ restricciones de columna1], 
MODIFY columna2 tipo_dato [ restricciones de columna2],
...;*/ 

ALTER TABLE employees 
MODIFY boss VARCHAR(20);

DROP TABLE tasks;

CREATE TABLE tasks (
	id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    start_date DATE,
    end_date DATE,
    price INT CHECK (price > 0)
    /*lo de arriba es lo mismo a CONSTRAINT tasks_price_chk CHECK (price > 0)*/
);

ALTER TABLE tasks
DROP CHECK tasks_chk_1;

ALTER TABLE tasks
ADD CONSTRAINT tas_tit_uk
UNIQUE (title);

SHOW INDEXES FROM employees;

DESCRIBE tasks;

SHOW CREATE TABLE employees;

SHOW TABLES;

/* INDEX */

DROP TABLE IF EXISTS employees;

CREATE TABLE IF NOT EXISTS employees (
	id INT,
    name_employee VARCHAR(30),
    age INT,
    INDEX (id)
);

DROP INDEX id ON employees;

CREATE INDEX IDX_id ON employees (id);

/* AUTO INCREMENT Y PRIMARY KEY*/

DROP TABLE IF EXISTS employees;

CREATE TABLE IF NOT EXISTS employees (
	id INT AUTO_INCREMENT,
    name_employee VARCHAR(30),
    age INT,
    PRIMARY KEY (id)
);

SHOW CREATE TABLE employees;

ALTER TABLE employees
MODIFY id INT;

ALTER TABLE employees
MODIFY id INT AUTO_INCREMENT;

ALTER TABLE employees
ADD CONSTRAINT PK_employee PRIMARY KEY (id);

/* DEFAULT */

DROP TABLE IF EXISTS employees;

CREATE TABLE IF NOT EXISTS employees (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name_employee VARCHAR(30),
    age INT
);

ALTER TABLE employees
ALTER age SET DEFAULT 0;

ALTER TABLE employees
ALTER name_employee SET DEFAULT "NOMBRE";

ALTER TABLE employees
ALTER age DROP DEFAULT;















