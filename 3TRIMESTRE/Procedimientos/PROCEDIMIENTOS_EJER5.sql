
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

CREATE TABLE MAX_GASTO (
NOMBRE VARCHAR (20),
VALOR FLOAT);

DELIMITER |
CREATE PROCEDURE tres_pacientes_gasto (IN PACIENTE1 VARCHAR (2), IN PACIENTE2 VARCHAR (2), IN PACIENTE3 VARCHAR (2) )
BEGIN
DECLARE COSTE_TOTAL1 fLOAT;  
DECLARE COSTE_TOTAL2 fLOAT;
DECLARE COSTE_TOTAL3 fLOAT;
DECLARE APELLIDO1 VARCHAR (10);
        Set COSTE_TOTAL1 = 0;
		SELECT SUM(COSTE) INTO COSTE_TOTAL1 FROM INGRESOS I, PACIENTES P 
		WHERE I.COD_PACIENTE = P.COD_PACIENTE AND PACIENTE1 = NOMBRE;
        
  
        Set COSTE_TOTAL2 = 0;
		SELECT SUM(COSTE) INTO COSTE_TOTAL2 FROM INGRESOS I, PACIENTES P 
		WHERE I.COD_PACIENTE = P.COD_PACIENTE AND PACIENTE2 = NOMBRE;
          
        Set COSTE_TOTAL3 = 0;
		SELECT SUM(COSTE) INTO COSTE_TOTAL3 FROM INGRESOS I, PACIENTES P 
		WHERE I.COD_PACIENTE = P.COD_PACIENTE AND PACIENTE3 = NOMBRE;   
        
        
	IF COSTE_TOTAL1 > COSTE_TOTAL2 AND COSTE_TOTAL1 > COSTE_TOTAL3 THEN SELECT NOMBRE INTO NOMBRE_PACIENTE1 FROM PACIENTES
    WHERE PACIENTE1 = NOMBRE ;
    INSERT INTO MAX_GASTO (NOMBRE, COSTE_MAXIMO) VALUES (NOMBRE_PACIENTE1, COSTE_TOTAL1);
	IF COSTE_TOTAL1 > COSTE_TOTAL2 AND COSTE_TOTAL1 > COSTE_TOTAL3 INSERT INTO MAX_GASTO;
	IF COSTE_TOTAL1 > COSTE_TOTAL2 AND COSTE_TOTAL1 > COSTE_TOTAL3 INSERT INTO MAX_GASTO;

END |
DELIMITER ;


