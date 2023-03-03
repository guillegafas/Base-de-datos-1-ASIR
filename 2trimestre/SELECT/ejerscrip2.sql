/*2. Mostrar la descripción de las tabla FAMILIA_PROFESIONAL y ciclos*/
SELECT * FROM ies_elena.ciclosfp;
SELECT * FROM ies_elena.familiaprofesional;


/*3. Mostrar las diferentes familias profesionales*/
SELECT COD_FAMILIA, DESCRIPCION FROM familiaprofesional;

/*4. Mostar los ciclos que pertenecen a la familia de Informática*/

SELECT DENOMINACION FROM CICLOSFP, FAMILIAPROFESIONAL
WHERE ciclosfp.cod_familia = '0001' and
CICLOSFP.COD_FAMILIA = FAMILIAPROFESIONAL.COD_FAMILIA;

/*5. Mostrar los módulos de el ciclo se asir y daw*/

SELECT DESCRIPCION FROM MODULOS M, CICLOSFP C, CICLOSFPMODULOS I
WHERE I.COD_CICLO = C.COD_CICLO
AND M.COD_MODULO = I.COD_MODULO
AND (C.denominacion = 'ASIR' OR C.DENOMINACION = 'DAW');

/*6. Mostrar los ciclos con más de 1000 horas*/
SELECT * FROM CICLOSFP
WHERE DURACION > 1000;


/*7. Mostrar los ciclos con más de 1000 horas pertenecientes a informática*/
SELECT DENOMINACION FROM CICLOSFP C, FAMILIAPROFESIONAL F
WHERE C.DURACION > '1000' AND F.DESCRIPCION = 'informatica'
AND (C.COD_FAMILIA = F.COD_FAMILIA);


/*8. Mostrar los ciclos con más de 1000 horas pertenecientes a informática y sumarles 100 horas más.*/

SELECT DENOMINACION, DURACION +100 FROM CICLOSFP C, FAMILIAPROFESIONAL F
WHERE C.DURACION > '1000' AND F.DESCRIPCION = 'informatica'
AND (C.COD_FAMILIA = F.COD_FAMILIA);

/*9. Mostrar los IES DE ALCORCON*/
SELECT NOMBRE FROM IES I
WHERE I.LOCALIDAD = 'Alcorcón';

/*10. Mostrar los IES de Alcorcón y Móstoles con ciclos de tarde*/
SELECT NOMBRE FROM IES 
WHERE LOCALIDAD = 'Alcorcón' or LOCALIDAD = 'Móstoles';

/*11. Mostrar los IES de Alcorcón y Móstoles con ciclos de tarde CON CICLOS DE ASIR*/
SELECT NOMBRE FROM IES I, CICLOSFPIES C, CICLOSFP F
WHERE(LOCALIDAD = 'Alcorcón' or LOCALIDAD = 'Móstoles')
AND TURNO = 't' AND I.COD_IES = C.COD_IES AND (F.DENOMINACION ='ASIR' AND C.COD_CICLO = F.COD_CICLO);

/*12. Mostrar los ciclos que se han implantado entre los años 2015 y 2017*/
SELECT DISTINCT DENOMINACION, F_IMPLANTACION
FROM CICLOSFP
INNER JOIN CICLOSFPIES
ON CICLOSFP.COD_CICLO = CICLOSFPIES.COD_CICLO
WHERE;

/*13. Mostrar las empresas con sede en Madrid o con un número de trabajadores menor a 50.*/
SELECT NOMBRE FROM EMPRESAFCT
WHERE SEDE = 'Madrid' AND N_TRABAJADOR < 500;
/*
14. Mostrar los datos de las especialidades que no tienen dado de alta ciclos formativos CICLOS*/
SELECT DESCRIPCION FROM FAMILIAPROFESIONAL F, CICLOSFP C
where F.COD_FAMILIA = C.COD_FAMILIA AND 


/*15Insertar una nueva empresa llamad Paradigma con 400 empleados y sede en Madrid, con CIF XXXXXXXXXXXXXX*/
INSERT INTO EMPRESAFCT
VALUES ('XXXXXXXXXX', 'Paradigma', 'Madrid', null, 400, null, null);

/*. Añadir un campo nuevo a la tabla de fctasir CISCO varchar2(2). 19. Actualizar dicho campo a si para todas las empresas de asir 20. Borrar los datos pertenecientes a la familia profesional de informática.*/


SELECT NOMBRE
FROM EMPRESAFCT
INNER JOIN FCTASIR
ON EMPRESAFCT.CIF = FCTASIR.CIF
WHERE TECNOLOGIAS = 'CISCO';