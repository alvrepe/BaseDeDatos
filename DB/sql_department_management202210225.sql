CREATE SCHEMA department_management;

USE department_management;

#1 Crea las sentencias SQL que nos permiten crear las tablas anteriores y sus restricciones, teniendo en cuenta las siguientes restricciones:

CREATE TABLE departments (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name_ VARCHAR(20) NOT NULL,
    company_code VARCHAR(8) NOT NULL
);

CREATE TABLE languages (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name_ VARCHAR(20) NOT NULL
);

CREATE TABLE employees (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name_ VARCHAR(20) NOT NULL,
    language_id INT NOT NULL,
    CONSTRAINT fk_language
    FOREIGN KEY (language_id)
    REFERENCES languages(id)
		ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE employees_departments (
	id INT NOT NULL,
    employee_id INT NOT NULL,
    department_id INT NOT NULL
);

#2 Crea las claves primarias y ajenas de la tabla "employees_departments"

ALTER TABLE employees_departments 
ADD CONSTRAINT pk_employees_departments PRIMARY KEY(id, employee_id, department_id);

ALTER TABLE employees_departments
ADD CONSTRAINT fk_employees
FOREIGN KEY (employee_id) REFERENCES employees(id);

ALTER TABLE employees_departments
ADD CONSTRAINT fk_departments
FOREIGN KEY (department_id) REFERENCES departments(id);

#3 Crea un indice para cada tabla que incluya sus campos clave y ajenos, en caso de que una tabla no tenga claves ajenas, el indice estará compuesto solo por la clave primaria.

CREATE INDEX idx_departments
ON departments (id);

CREATE INDEX idx_languages
ON languages (id);

CREATE INDEX idx_employees
ON employees (id, language_id);

CREATE INDEX idx_employees_departments
ON employees_departments (id, employee_id, department_id);


#4 Crea las siguientes restricciones
#a)UNIQUE para los campos name

ALTER TABLE departments
ADD CONSTRAINT uc_departments
UNIQUE (name_);

ALTER TABLE employees
ADD CONSTRAINT uc_employees
UNIQUE (name_);

ALTER TABLE languages
ADD CONSTRAINT uc_languages
UNIQUE (name_);

#b) DEFAULT PARA EL CAMPO COMPANY CODE = COD1000

ALTER TABLE departments
ALTER company_code SET DEFAULT 'COD10000';

#5 Elimina las restricciones del ejercicio anterior

DROP INDEX uc_languages ON languages;
DROP INDEX uc_departments ON departments;
DROP INDEX uc_employees ON employees;

ALTER TABLE departments
ALTER company_code DROP DEFAULT;
