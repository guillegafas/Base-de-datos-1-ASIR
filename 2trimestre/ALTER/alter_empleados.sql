CREATE DATABASE EMPRESAMY2

DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;


USE EMPRESAMY2;
CREATE TABLE DEPART (
 DEPT_NO tinyint PRIMARY KEY,
 DNOMBRE  VARCHAR(14), 
 LOC      VARCHAR(14) )engine=INNODB;
INSERT INTO DEPART VALUES (10,'CONTABILIDAD','SEVILLA');
INSERT INTO DEPART VALUES (20,'INVESTIGACIÓON','MADRID');
INSERT INTO DEPART VALUES (30,'VENTAS','BARCELONA');
INSERT INTO DEPART VALUES (40,'PRODUCCIÓN','BILBAO');
commit;

CREATE TABLE EMPLE (
 EMP_NO      tinyint NOT NULL AUTO_INCREMENT  ,
 APELLIDO  VARCHAR(10)  ,
 OFICIO    VARCHAR(20)  ,
 DIR     tinyint ,
 FECHA_ALT DATE ,
 SALARIO   INT,
 COMISION smallint,
 DEPT_NO   tinyint NOT NULL,
 PRIMARY KEY (EMP_NO) ,
 CONSTRAINT FK_1 FOREIGN KEY (DEPT_NO) REFERENCES 
 DEPART( DEPT_NO),
 CONSTRAINT FK_2 FOREIGN KEY (DIR) REFERENCES 
 EMPLE (EMP_NO  )
 )engine=INNODB;
 
ALTER TABLE EMPLE MODIFY SALARIO FLOAT;
INSERT INTO DEPART VALUES (50, 'I+D+I', 'MÁLAGA');

INSERT INTO `empresamy2`.`EMPLE` (`EMP_NO`, `APELLIDO`, `OFICIO`, `FECHA_ALT`,`SALARIO`, `DEPT_NO`)
VALUES (null, 'GARCÍA', 'DIRECTOR FINANCIERO', '2020-12-12', '20000', '10');
INSERT INTO EMPLE VALUES (NULL,'SÁNCHEZ','EMPLEADO',NULL,'2012-12-17',104000,NULL,20);
INSERT INTO EMPLE VALUES (NULL,'ARROYO','VENDEDOR',1,'1999-02-20',208000,250,30);
INSERT INTO EMPLE VALUES (NULL,'SALA','VENDEDOR',1,'1999-02-22',162500,450,30);
INSERT INTO EMPLE VALUES (NULL,'JIMÉNEZ','DIRECTOR',1,'2003-04-02',386750,NULL,20);
INSERT INTO EMPLE VALUES (NULL,'MARTÍN','VENDEDOR',1,'2009-09-29',162500,700,30);
INSERT INTO EMPLE VALUES (NULL,'NEGRO','DIRECTOR',1,'2006-05-01',370500,NULL,30);
INSERT INTO EMPLE VALUES (NULL,'CEREZO','DIRECTOR',1,'2017-06-09',318500,NULL,10);
INSERT INTO EMPLE VALUES (NULL,'GIL','ANALISTA',1,'2017-11-09',390000,NULL,20);
INSERT INTO EMPLE VALUES (NULL,'REY','PRESIDENTE',1,'2015-11-17',650000,NULL,10);
INSERT INTO EMPLE VALUES (NULL,'TOVAR','VENDEDOR',1,'2001-09-08',195000,0,30);
INSERT INTO EMPLE VALUES (NULL,'ALONSO','EMPLEADO',1,'1981-09-23',143000,NULL,20);
INSERT INTO EMPLE VALUES (NULL,'JIMENO','EMPLEADO',1,'1981-12-03',123500,NULL,30);
INSERT INTO EMPLE VALUES (NULL,'FERNÁNDEZ','ANALISTA',1,'1981-12-03',390000,NULL,20);
INSERT INTO EMPLE VALUES (NULL,'MUÑOZ','EMPLEADO',1,'1982-01-23',169000,NULL,10);
COMMIT;


-- Tablas EMPLE y DEPART
-- Cambiar el tipo de datos a uno float
ALTER TABLE EMPLE MODIFY SALARIO FLOAT;

	-- Insertar en la tabla depart el departamento  30    I+D+I  Malaga
-- Documentación oficial de mysql

INSERT INTO DEPART VALUES (60,'I+D+I','MAALAGA');

-- Insertar dos empleados por departamento ( fijese bien y modifique lo que crea necesario)
INSERT INTO EMPLE VALUES (NULL,'SÁNCHEZ','EMPLEADO',NULL,'2012-12-17',104000,NULL,20);
INSERT INTO EMPLE VALUES (NULL,'ARROYO1','VENDEDOR',1,'1999-02-20',208000,NULL,20);

INSERT INTO EMPLE VALUES (NULL,'PERRO','EMPLEADO',NULL,'2012-12-17',104000,NULL,30);
INSERT INTO EMPLE VALUES (NULL,'ARROYADOR','VENDEDOR',1,'1999-02-20',208000,NULL,30);

INSERT INTO EMPLE VALUES (NULL,'GUILLE','EMPLEADO',19,'2012-12-17',104000,NULL,40);
INSERT INTO EMPLE VALUES (NULL,'FRANCISCO','VENDEDOR',1,'1999-02-20',208000,NULL,40);

INSERT INTO EMPLE VALUES (NULL,'Gudgf','EMPLEADO',19,'2012-12-17',104000,NULL,50);
INSERT INTO EMPLE VALUES (NULL,'Fghgf','VENDEDOR',1,'1999-02-20',208000,NULL,50);

SELECT * FROM EMPLE;

Alter table emple
DROP CONSTRAINT FK_1,
DROP CONSTRAINT FK_2;

/*2.- Modifica las tablas EMPLE y DEPART para que el borrado sea en cascada.
Borra  los empleados del departamento 30 y el departamento 30 antes y después de modificar la tabla. ¿Que ocurre?
 No olvides dejar todos los empleados y departamentos.*/

ALTER TABLE EMPLE 
ADD Constraint fk_1 foreign key (dir) references emple(emp_no) on delete cascade,
add constraint fk_2 foreign key (dept_no) references depart(dept_no) on delete cascade;

select COLUMN_NAME, CONSTRAINT_NAME, REFERENCED_COLUMN_NAME, REFERENCED_TABLE_NAME
from information_schema.KEY_COLUMN_USAGE
where TABLE_NAME = 'emple';

SELECT * FROM empresamy2.depart;
/*1º Borrar emples del Dept_no 30. (EMPLE)
Borrar Dept_no 30 (DEPART)
¿Que ocurre?*/
/*Lo que ocurre es que borra todos los empleados de ese departamento*/
delete from depart where DEPT_NO = 10;
rollback; /*para desahcer el cambio antes de comitear porque sino la lias*/

/*Insertar a un empleado de apellido ‘SAAVEDRA’ con número 2000. 
La fecha de alta será la actual, el SALARIO será el mismo salario de ‘SALA’ más el 20 por 100 y el resto de datos serán los mismos que los datos de ‘SALA’.*/

/*No me deja meter 2000 porque es un tinyint asique vamos a modificarlo, a parte otra cuestion distinta:
si metemos un numero a mano sin tener en cuenta el auto increment, cuando metamos otro empleado su numero será a partir del ultimo que hemos metido y no seguira con 
la cuenta que llevaba*/

alter table EMPLE MODIFY EMP_NO int Not Null;
alter table EMPLE MODIFY DIR int Not Null;
INSERT INTO EMPLE VALUES (DEPT_NO,'SAAVEDRA','EMPLEADO',NULL, current_date(),104000,NULL,30);

/*Modificar el número de departamento de ‘SAAVEDRA’. El nuevo departamento será el departamento donde hay más empleados cuyo oficio sea ‘EMPLEADO’.*/

UPDATE EMPLE SET DEPT_NO = (
SELECT DNOMBRE, E.DEPT_NO FROM DEPART D, EMPLE E WHERE  D.DEPT_NO = E.DEPT_NO AND OFICIO LIKE 'EMP%' GROUP BY E.DEPT_NO HAVING MAX( (SELECT COUNT(*)  FROM EMPLE))
) WHERE APELLIDO = 'SAAVEDRA';

SELECT DNOMBRE, E.DEPT_NO FROM DEPART D, EMPLE E WHERE  D.DEPT_NO = E.DEPT_NO AND OFICIO LIKE 'EMP%' GROUP BY E.DEPT_NO HAVING MAX( (SELECT COUNT(*)  FROM EMPLE));
SELECT * FROM EMPLE;
SELECT * FROM DEPART;

/*Borrar todos los departamentos de la tabla DEPART para los cuales no existan empleados en EMPLE.*/
DELETE FROM DEPART WHERE DEPT_NO NOT IN (SELECT DEPT_NO FROM EMPLE);

/*Muestre los diferentes oficios*/
SELECT DISTINCT OFICIO FROM EMPLE;

/*Mostrar los datos de los empleados que tiene oficio (analista, vendedor, o director)*/
SELECT * FROM EMPLE WHERE (OFICIO LIKE 'ANAL%' OR OFICIO LIKE 'VEN%') OR OFICIO LIKE 'DIREC%';

/*Mostrar todos los datos de los empleados que no son analistas ni vendedores;*/
SELECT * FROM EMPLE WHERE OFICIO NOT IN (SELECT OFICIO FROM EMPLE WHERE OFICIO LIKE 'ANAL%' OR OFICIO LIKE 'VEN%');

/*Obtener el APELLIDO, SALARIO  Y DEPT_NO  de los empleados  cuyo salario sea mayor de 200 en los departamentos  10 o 20;*/
SELECT APELLIDO, SALARIO, DEPT_NO FROM EMPLE WHERE SALARIO > 200 AND (DEPT_NO = 20 AND DEPT_NO = 10);

/*Seleccionar el apellido el oficio de los empleados  cuyo apellido empiece por A y el oficio contenga una E.*/

/*Mostrar los datos de los empleados que no tienen comisión (si no tenemos comisión seleccionar otro campo)*/

/*Mostrar los datos de los empleados que están trabajando en la localidad de Madrid.*/

/*Obtener todos los campos de la tabla emple*/

/*Obtener todos los campos de la tabla depart*/

/*Mostrar los ANALISTAS, sacando el apellido, el departamento en que trabajan y la localidad del departamento.*/

/*Listar los datos de los empleados que trabajan en Madrid o en Barcelona*/

/*Listar los apellidos, oficio y localidad de los departamentos donde trabajan Analistas.*/
