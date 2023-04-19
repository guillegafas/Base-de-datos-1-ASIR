/*EJERCICIO 3.1
Dado un nombre de paciente y su apellido, mostrar por pantalla su gasto y si gasta mas de 5000, mostrar "Ingreso con gasto alto"
Modificar el procedimiento actual para que muestre por pantalla si es menor que 5000 " ingresos gasto bajo"*/

DROP PROCEDURE IF EXISTS INGRESO_GASTO_ALTO;
DELIMITER |
CREATE PROCEDURE INGRESO_GASTO_ALTO(IN NOMB varchar(50), IN APEL VARCHAR(50))
  BEGIN
  
		DECLARE COSTE_TOTAL fLOAT;  
        Set COSTE_TOTAL= 0;
		SELECT SUM(COSTE) INTO COSTE_TOTAL FROM INGRESOS I, PACIENTES P 
		WHERE I.COD_PACIENTE = P.COD_PACIENTE AND (NOMB = P.NOMBRE AND APEL = P.APELLIDO) ;

    IF COSTE_TOTAL > 5000 THEN
		 SELECT  'Ingreso con gasto alto';
    ELSE
        SELECT  'Ingreso con gasto bajo'; 
  END IF;
  END
  |
  DELIMITER ;