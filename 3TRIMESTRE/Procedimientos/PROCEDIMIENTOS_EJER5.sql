
/*https://dev.mysql.com/doc/refman/8.0/en/flow-control-statements.html

5.1 de tres pacientes calcular su gasto y comprobar cual es el apaciente de los tres con gasto mas alto , insertando sus datos nombre y apellido en una tabla previamente creada ( observe los tipos de datos para ponerlos igual cod- paciente(pk) nombre apellido)

 5.- 2Codificar un procedimiento que permita borrar Un paciente ) cuyo número se pasará en la llamada. (SOLO SE PODRA SI SE HAN OTORGADO LOS PRIVILEGIOS DE BORRARO);

5. 3 Codificar un procedimiento que permita subir el gasto de sus ingresos  5% a Un paciente  cuyo número se pasará en la llamada.*/


/*5.- 2Codificar un procedimiento que permita borrar Un paciente ) cuyo número se pasará en la llamada. (SOLO SE PODRA SI SE HAN OTORGADO LOS PRIVILEGIOS DE BORRARO)*/
DELIMITER |
CREATE PROCEDURE BORRADO (IN PACIENTE VARCHAR (2))
BEGIN

DELETE FROM PACIENTES WHERE PACIENTE = COD_PACIENTE;

END |
DELIMITER ;



CREATE TABLE GASTO_TOTAL ;

/*5.1 de tres pacientes calcular su gasto y comprobar cual es el apaciente de los tres con gasto mas alto , 
insertando sus datos nombre y apellido en una tabla previamente creada 
( observe los tipos de datos para ponerlos igual cod- paciente(pk) nombre apellido)*/

USE clinica2021;

CREATE TABLE MAX_GASTO (
NOMBRE VARCHAR (20),
COSTE_MAXIMO FLOAT);

DELIMITER |
CREATE PROCEDURE tres_pacientes_gasto (IN PACIENTE1 VARCHAR (2), IN PACIENTE2 VARCHAR (2), IN PACIENTE3 VARCHAR (2) )
BEGIN
DECLARE COSTE_TOTAL1 fLOAT;  
DECLARE COSTE_TOTAL2 fLOAT;
DECLARE COSTE_TOTAL3 fLOAT;
DECLARE NOMBRE_PACIENTE VARCHAR(20) DEFAULT " "; 

        Set COSTE_TOTAL1 = 0;
		SELECT SUM(COSTE) INTO COSTE_TOTAL1 FROM INGRESOS I, PACIENTES P 
		WHERE I.COD_PACIENTE = P.COD_PACIENTE AND PACIENTE1 = P.COD_PACIENTE;
        
  
        Set COSTE_TOTAL2 = 0;
		SELECT SUM(COSTE) INTO COSTE_TOTAL2 FROM INGRESOS I, PACIENTES P 
		WHERE I.COD_PACIENTE = P.COD_PACIENTE AND PACIENTE2 = P.COD_PACIENTE;
          
        Set COSTE_TOTAL3 = 0;
		SELECT SUM(COSTE) INTO COSTE_TOTAL3 FROM INGRESOS I, PACIENTES P 
		WHERE I.COD_PACIENTE = P.COD_PACIENTE AND PACIENTE3 = P.COD_PACIENTE;   
        
    
		IF COSTE_TOTAL1 > COSTE_TOTAL2 AND COSTE_TOTAL1 > COSTE_TOTAL3 THEN 
			SELECT NOMBRE INTO NOMBRE_PACIENTE FROM PACIENTES
			WHERE PACIENTE1 = COD_PACIENTE ;
			INSERT INTO MAX_GASTO (NOMBRE, COSTE_MAXIMO) VALUES (NOMBRE_PACIENTE, COSTE_TOTAL1);
		END IF;
	
		IF COSTE_TOTAL2 > COSTE_TOTAL3 AND COSTE_TOTAL2 > COSTE_TOTAL1 THEN 
			SELECT NOMBRE INTO NOMBRE_PACIENTE FROM PACIENTES
			WHERE PACIENTE2 = COD_PACIENTE ;
			INSERT INTO MAX_GASTO (NOMBRE, COSTE_MAXIMO) VALUES (NOMBRE_PACIENTE, COSTE_TOTAL2);
		END IF;
		
		IF COSTE_TOTAL3 > COSTE_TOTAL1 AND COSTE_TOTAL3 > COSTE_TOTAL2 THEN 
			SELECT NOMBRE INTO NOMBRE_PACIENTE FROM PACIENTES
			WHERE PACIENTE3 = COD_PACIENTE ;
			INSERT INTO MAX_GASTO (NOMBRE, COSTE_MAXIMO) VALUES (NOMBRE_PACIENTE, COSTE_TOTAL3);
		END IF;
		
END |
DELIMITER ;


/*5. 3 Codificar un procedimiento que permita subir el gasto de sus ingresos  5% a Un paciente  cuyo número se pasará en la llamada.*/


DELIMITER |
CREATE PROCEDURE AUMENTO_GASTO (IN NUMERO VARCHAR(2))
BEGIN
	UPDATE INGRESOS SET COSTE = COSTE * 1.05 WHERE COD_PACIENTE = NUMERO;
END |

DELIMITER ;



/*5.1 de tres pacientes calcular su gasto y comprobar cual es el apaciente de los tres con gasto mas alto , insertando sus datos nombre y 
apellido en una tabla previamente creada - observe los tipos de datos para ponerlos igual cod- paciente(pk) nombre apellido


 5.- 2Codificar un procedimiento que permita borrar Un paciente ) cuyo número se pasará en la llamada. (SOLO SE PODRA SI SE HAN OTORGADO LOS PRIVILEGIOS DE BORRARO);

5. 3 Codificar un procedimiento que permita subir el gasto de sus ingresos  5% a Un paciente  cuyo número se pasará en la llamada.*/




