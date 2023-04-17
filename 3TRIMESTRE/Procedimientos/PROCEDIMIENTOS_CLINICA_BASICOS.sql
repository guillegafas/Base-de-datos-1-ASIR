/*Ejercicio 2 .1En la base de datos CLINICA creamos un procedimiento que obtenga un listado con todas Los ingresos realizadas en un determinado año. Además, debe dejar en un parámetro de salida el total de ingresos realizadas en ese año.

*/
DELIMITER &&
CREATE DEFINER=`root`@`localhost` PROCEDURE `COD_PACIENTE`(IN COD INT, OUT N_INGRESO INT)
BEGIN
SELECT *
FROM PACIENTES WHERE COD = COD_PACIENTE;
SELECT COUNT(*) 
INTO N_INGRESO
FROM PACIENTES P, INGRESOS I
WHERE P.COD_PACIENTE=I.COD_PACIENTE AND COD_PACIENTE = COD ;
END&&
DELIMITER ;

set @TOTAL = 0;
call clinica2021.LISTADO_INGRESOS(2021-03-09, @TOTAL);
select @TOTAL;
DELIMITER &&

/*Ejercicio 2.2 En la base de datos clínica crea un procedimiento que reciba como parámetro de entrada el código de un paciente y 
nos muestre los datos personales , y como parámetro de salida el número ingresos que ha tenido .*/
CREATE DEFINER=`root`@`localhost` PROCEDURE `COD_PACIENTE`(IN COD INT, OUT N_INGRESO INT)
BEGIN
SELECT *
FROM PACIENTES WHERE COD = COD_PACIENTE;
SELECT COUNT(*) 
INTO N_INGRESO
FROM PACIENTES P, INGRESOS I
WHERE P.COD_PACIENTE=I.COD_PACIENTE AND COD_PACIENTE = COD ;

END&&
DELIMITER ;

