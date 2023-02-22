use clinica2021;
/*Mostrar el coste de tratamiento por grupos de diagnostico */
SELECT sum(COSTE), DIAGNOSTICO FROM INGRESOS GROUP BY DIAGNOSTICO;
/*Mostrar el máximo coste de tratamiento de toda la cínica*/
SELECT max(COSTE), DIAGNOSTICO FROM INGRESOS GROUP BY DIAGNOSTICO;
/*Mostrar el coste de tratamiento por provincia*/
SELECT SUM(COSTE), LOCALIDAD, DIAGNOSTICO FROM INGRESOS I, PACIENTES P WHERE I.COD_PACIENTE = P.COD_PACIENTE  GROUP BY LOCALIDAD, DIAGNOSTICO;
/*Mostrar el nº de ingreso
s totales  por provincia */
SELECT count(*), PROVINCIA FROM INGRESOS I, PACIENTES P WHERE I.COD_PACIENTE = P.COD_PACIENTE GROUP BY PROVINCIA;
/*Mostrar el coste de tratamiento por provincia y por diagnostico*/
SELECT SUM(COSTE), PROVINCIA, DIAGNOSTICO FROM INGRESOS I, PACIENTES P WHERE I.COD_PACIENTE = P.COD_PACIENTE GROUP BY PROVINCIA, DIAGNOSTICO;
/*Mostrar el MÁXIMO COSTE  de tratamiento por DIAGNOSTICO*/
SELECT max(COSTE), DIAGNOSTICO FROM INGRESOS GROUP BY DIAGNOSTICO;
/*Sacar el coste del tratamiento de todos los pacientes que han ingresado con infarto.*/
SELECT SUM(COSTE), LOCALIDAD FROM INGRESOS I, PACIENTES P WHERE 
 DIAGNOSTICO = 'cardiomiopatÃ­a' AND I.COD_PACIENTE = P.COD_PACIENTE;
 SELECT SUM(COSTE), COD_PACIENTE FROM INGRESOS WHERE DIAGNOSTICO = 'cardiomiopatÃ­a';
/*Sacar el mayor coste del tratamiento de cada provincia.*/
SELECT max(COSTE) AS COSTE_MAXIMO, DIAGNOSTICO, PROVINCIA FROM INGRESOS I, PACIENTES P WHERE I.COD_PACIENTE = P.COD_PACIENTE GROUP BY PROVINCIA;
/*Visualizar el total del coste del tratamiento de todos los varones ingresados.*/
SELECT sum(COSTE) FROM INGRESOS I, PACIENTES P WHERE I.COD_PACIENTE = P.COD_PACIENTE AND EDAD > 21;
/*Mostrar los datos de los pacientes cuyo coste de tratamiento este por encima de la media*/
SELECT distinct P.* FROM INGRESOS I, PACIENTES P WHERE I.COD_PACIENTE = P.COD_PACIENTE AND (COSTE > (SELECT avg(COSTE) FROM INGRESOS));
/*Contar los médicos de la clínica */
SELECT count(*) FROM MEDICOS;
/*Contar los médicos que tenemos por especialidad.*/
SELECT count(ESPECIALIDAD), ESPECIALIDAD FROM MEDICOS GROUP BY ESPECIALIDAD;
/*Contar los pacientes de cada médico, mostrando el nombre del médico*/
SELECT COUNT(*), NOMBRE FROM MEDICOS, INGRESOS WHERE MEDICOS.N_COLEGIADO = INGRESOS.N_COLEGIADO GROUP BY MEDICOS.NOMBRE;




