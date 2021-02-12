/* 1 CREA LAS SIGUIENTES TABLAS */

CREATE DATABASE IF NOT EXISTS gestion_pub;

USE gestion_pub;

CREATE TABLE IF NOT EXISTS pubs (
	cod_pub INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(40) NOT NULL,
    licencia_fiscal VARCHAR(40) NOT NULL,
    domicilio VARCHAR(40),
    cod_localidad INT NOT NULL
);

CREATE TABLE IF NOT EXISTS titulares (
	dni_titular VARCHAR(9) PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL,
    domicilio VARCHAR(40),
	cod_pub INT NOT NULL
);

CREATE TABLE IF NOT EXISTS empleados (
	dni_empleado VARCHAR(9) PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL,
    domicilio VARCHAR(40)
);

CREATE TABLE IF NOT EXISTS existencias (
	cod_articulo INT NOT NULL,
	nombre VARCHAR(40) NOT NULL,
    cantidad INT NOT NULL,
    cod_pub INT NOT NULL
);

CREATE TABLE IF NOT EXISTS localidades (
	cod_localidad INT NOT NULL,
    nombre VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS pub_empleados (
	cod_pub INT NOT NULL,
    dni_empleado VARCHAR(9) NOT NULL,
    funcion VARCHAR(40) NOT NULL
);

/* 2 cambia nombres de las tablas por los siguientes */

ALTER TABLE pubs RENAME TO pubs;
ALTER TABLE empleados RENAME TO employees;
ALTER TABLE existencias RENAME TO stocks;
ALTER TABLE localidades RENAME TO cities;
ALTER TABLE titulares RENAME TO owners;
ALTER TABLE pub_empleados RENAME TO pub_employees;

/* 3 añade los siguientes campos */

ALTER TABLE pubs ADD (
	fecha_apertura DATE,
    horario DATE
);

ALTER TABLE stocks ADD (
	precio INT
);

ALTER TABLE cities ADD (
	provincia VARCHAR(40)
);

ALTER TABLE employees ADD (
	edad INT
);

/* 4 añade las claves primarias de las tablas existencias, localidad y pub_empleado */

ALTER TABLE stocks
ADD CONSTRAINT pk_stocks PRIMARY KEY (cod_articulo);

ALTER TABLE cities
ADD CONSTRAINT pk_cities PRIMARY KEY (cod_localidad);


ALTER TABLE pub_employees
ADD CONSTRAINT pk_employees PRIMARY KEY (
	cod_pub,
    dni_empleado,
    funcion
);

/*5 AÑADE LAS SIGUIENTES RESTRICCIONES*/

ALTER TABLE pubs 
MODIFY fecha_apertura DATE NOT NULL,
MODIFY horario DATE NOT NULL;

ALTER TABLE cities
MODIFY provincia VARCHAR(40) NOT NULL;

ALTER TABLE stocks
ADD CONSTRAINT CHK_precio CHECK (precio > 0);

ALTER TABLE stocks
ALTER precio SET DEFAULT 1;

CREATE INDEX IDX_titular
ON owners (dni_titular, nombre);

ALTER TABLE stocks
ALTER cantidad SET DEFAULT 1;

CREATE INDEX IDX_localidad
ON cities (cod_localidad, nombre);

/*6 ELIMINA LAS SIGUIENTES RESTRICCIONES*/

ALTER TABLE owners
DROP INDEX IDX_titular;

ALTER TABLE stocks
ALTER cantidad DROP DEFAULT;

ALTER TABLE cities
DROP INDEX IDX_localidad;

ALTER TABLE stocks
DROP CHECK CHK_precio;

ALTER TABLE stocks
ALTER precio DROP DEFAULT;

show create table owners;


# 7 crea las siguientes claves ajenas a las tablas ya existentes

ALTER TABLE owners
ADD CONSTRAINT FK_owners_pubs
FOREIGN KEY (cod_pub)
REFERENCES pubs(cod_pub);

ALTER TABLE pub_employees
ADD CONSTRAINT FK_pub_employees_pubs
FOREIGN KEY (cod_pub)
REFERENCES pubs(cod_pub);

ALTER TABLE pub_employees
ADD CONSTRAINT FK_pub_employees_employees
FOREIGN KEY (dni_empleado)
REFERENCES employees(dni_empleado);

ALTER TABLE stocks
ADD CONSTRAINT FK_stocks_pubs
FOREIGN KEY (cod_pub)
REFERENCES pubs(cod_pub);

ALTER TABLE pubs
ADD CONSTRAINT FK_pubs_cities
FOREIGN KEY (cod_localidad)
REFERENCES cities(cod_localidad);

# 8 elimina las claves ajenas creadas en el ejercicio anterior

ALTER TABLE owners
DROP FOREIGN KEY FK_owners_pubs;

ALTER TABLE pub_employees
DROP FOREIGN KEY FK_pub_employees_pubs;

ALTER TABLE pub_employees
DROP FOREIGN KEY FK_pub_employees_employees;

ALTER TABLE stocks
DROP FOREIGN KEY FK_stocks_pubs;

ALTER TABLE pubs
DROP FOREIGN KEY FK_pubs_cities;

# 9 Elimina y crea de nuevo las tablas TITULAR, PUB y PUB_EMPLEADO, añadiendo las claves primarias y ajenas, en la definición de cada una, mediante el comando CREATE TABLE.

DROP TABLE pubs;
DROP TABLE owners;
DROP TABLE pub_employees;

CREATE TABLE IF NOT EXISTS pubs (
	cod_pub INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(40) NOT NULL,
    licencia_fiscal VARCHAR(40) NOT NULL,
    domicilio VARCHAR(40),
    cod_localidad INT NOT NULL,
    CONSTRAINT fk_pubs
    FOREIGN KEY (cod_localidad)
    REFERENCES cities(cod_localidad)
);

CREATE TABLE IF NOT EXISTS owners (
	dni_titular VARCHAR(9) PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL,
    domicilio VARCHAR(40),
	cod_pub INT NOT NULL,
    CONSTRAINT fk_owners
    FOREIGN KEY (cod_pub)
    REFERENCES pubs(cod_pub)
);

CREATE TABLE IF NOT EXISTS pub_employees (
	cod_pub INT NOT NULL,
    dni_empleado VARCHAR(9) NOT NULL,
    funcion VARCHAR(40) NOT NULL,
    PRIMARY KEY (cod_pub, dni_empleado, funcion),
    CONSTRAINT fk_pub_employees_pubs
    FOREIGN KEY (cod_pub) 
    REFERENCES pubs(cod_pub)
);