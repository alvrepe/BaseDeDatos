/* 1 CREA LAS SIGUIENTES TABLAS */

CREATE DATABASE gestion_pub;

USE gestion_pub;

CREATE TABLE pubs (
	cod_pub INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(40) NOT NULL,
    licencia_fiscal VARCHAR(40) NOT NULL,
    domicilio VARCHAR(40),
    cod_localidad INT NOT NULL
);

CREATE TABLE titulares (
	dni_titular VARCHAR(9) PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL,
    domicilio VARCHAR(40),
	cod_pub INT NOT NULL
);

CREATE TABLE empleados (
	dni_empleado VARCHAR(9) PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL,
    domicilio VARCHAR(40)
);

CREATE TABLE existencias (
	cod_articulo INT NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(40) NOT NULL,
    cantidad INT NOT NULL,
    cod_pub INT NOT NULL
);

CREATE TABLE localidades (
	cod_localidad INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(40) NOT NULL
);

CREATE TABLE pub_empleados (
	cod_pub INT NOT NULL AUTO_INCREMENT,
    dni_empleado VARCHAR(9) NOT NULL,
    funcion VARCHAR(40) NOT NULL
);