SELECT * FROM colegio.alumno;

-- Indicar los datos alumno/s que poseen la labor extra de “Delegado de clase”
SELECT A.NOMBRE, L.NOMBRE FROM ALUMNO A, LABOR_EXTRA L
WHERE A.ID = L.ALUMNO_ID AND L.NOMBRE = 'Delegado de clase';
-- ¿Cuántos alumnos hay de cada asignatura?
SELECT count(*) AS NUMERO_ALUMNOS, A.NOMBRE FROM ASIGNATURA A, NOTA N 
WHERE A.ID = N.ASIGNATURA_ID GROUP BY A.NOMBRE;

SELECT count(*) AS NUMERO_ALUMNOS, A.NOMBRE, ASIGNATURA_ID FROM ASIGNATURA A, NOTA N 
WHERE A.ID = N.ASIGNATURA_ID GROUP BY ASIGNATURA_ID;


-- Saca la nota mínima obtenida de cada asignatura
SELECT min(CALIFICACION), A.NOMBRE FROM ASIGNATURA A, NOTA N
WHERE A.ID = N.ASIGNATURA_ID GROUP BY A.NOMBRE;

-- Buscar nombre y apellidos de los alumnos que han suspendido alguna vez, es decir, 
-- nombre y apellidos del alumno, asignatura, nota y la convocatoria.

SELECT A.NOMBRE, A.APELLIDO, RA.NOMBRE, CALIFICACION, CONVOCATORIA 
FROM ALUMNO A, ASIGNATURA RA, NOTA N 
WHERE (RA.ID = N.ASIGNATURA_ID AND A.ID = N.ALUMNO_ID) AND CALIFICACION < 5;

INSERT INTO LABOR_EXTRA (ID, NOMBRE, ALUMNO_ID) VALUES ("3", "ENCARGADO", "4");

-- Contabilizar número de notas
SELECT count(*) AS NUMERO_NOTAS FROM NOTA;
-- Nota media de cada alumno, sin distinción de la asignatura que sea. Mostrar nombre,
-- apellidos y nota mediaÇ
SELECT avg(CALIFICACION), A.NOMBRE FROM ALUMNO A, NOTA N
WHERE A.ID = N.ALUMNO_ID GROUP BY NOMBRE;
/*AQUI SI CUENTA POR ASIGNATURA*/
SELECT avg(CALIFICACION), A.NOMBRE, RA.NOMBRE FROM ALUMNO A, NOTA N, ASIGNATURA RA
WHERE A.ID = N.ALUMNO_ID  AND RA.ID = N.ASIGNATURA_ID GROUP BY A.NOMBRE, RA.NOMBRE;

-- Notas del mes de noviembre de 2018.
SELECT CALIFICACION FROM NOTA WHERE FECHA_EXAMEN between '2018-11-1'AND '2018-11-30';