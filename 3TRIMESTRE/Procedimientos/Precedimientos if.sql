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
  
  /*Crear un procedimiento que reciba como parámetro de entrada un código de paciente, y si sus ingresos son = a 10, el parámetro 
  de salida es 3% , si es menor de 10 entonces el parámetro de salida es 2%, y en cualquier otro caso 4%*/
  
DELIMITER |
CREATE PROCEDURE PACIENTE_INGRESO (IN COD INT, OUT N_INGRESO INT)
  BEGIN 
		SELECT COUNT (COD_INGRESO) FROM INGRESOS WHERE COD_PACIENTE = 
        
  END|
  DELIMITER ;

  /*Crear un procedimiento que Recibe una cadena ya comprueba si tiene un carácter o no 
  (igual a blanco) mostrado Escribe algo por favor en el caso de estar el parmetro vacio */
  
  
DELIMITER |
CREATE PROCEDURE CADENA (IN CADENA VARCHAR(255))
BEGIN
    DECLARE CADENA INT;
    DECLARE ESPACIO BOOLEAN DEFAULT FALSE;

    SET CADENA = LENGTH(CADENA);

    IF CADENA = 0 THEN
        SELECT 'Escribe algo por favor';
    ELSE
        SET ESPACIO = INSTR(CADENA, ' ') > 0;
        
        IF ESPACIO THEN
            SELECT 'La cadena tiene un carácter en blanco.';
        ELSE
            SELECT 'La cadena no tiene un carácter en blanco.';
        END IF;
    END IF;
END 
|
 DELIMITER ;


/*EJERCICIO 3.4 Dado una nota que se recibe como parámetro de entrada Mostrar si esta aprobado, suspenso, notable ....*/
  
  DELIMITER |
CREATE PROCEDURE MOSTRAR_NOTA (IN NOTA FLOAT)
BEGIN
    DECLARE ESTADO VARCHAR(20);
    IF NOTA >= 5 THEN
        SET ESTADO = 'Aprobado';
    ELSEIF NOTA >= 3 THEN
        SET ESTADO = 'Suspenso';
    ELSE
        SET ESTADO = 'Notable';
    END IF;
    SELECT CONCAT('La nota ', NOTA, ' se encuentra en estado de ', ESTADO, '.') AS MENSAJE;
END|
DELIMITER ;