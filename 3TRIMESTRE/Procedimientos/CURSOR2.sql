use empresamy2;

CREATE TABLE PRUEBA (
COD INT,
APELLIDO1 VARCHAR (10),
SALARIO_TOTAL FLOAT,
PRIMARY KEY (COD)
) engine=InnoDB;

DELIMITER ||

CREATE PROCEDURE INGRESAR_DATOS()
BEGIN
DECLARE done INT DEFAULT FALSE;
DECLARE SALARIO_PLUS FLOAT DEFAULT 0;
DECLARE CODIGO_EMPLE INT DEFAULT 0;
DECLARE SALARIO_BASE FLOAT DEFAULT 0;
DECLARE NOMBRE VARCHAR (10);
DECLARE SOBRESUELDO FLOAT DEFAULT 0;
DECLARE CUR1 CURSOR FOR SELECT APELLIDO, SALARIO, COMISION FROM EMPLE;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	OPEN CUR1;
		HOLA:LOOP
			FETCH CUR1 INTO NOMBRE, SALARIO_BASE, SOBRESUELDO;
				IF done THEN LEAVE HOLA;
				ELSE 
					IF SOBRESUELDO IS NULL THEN SET SOBRESUELDO = 0;
						SET SALARIO_PLUS = SALARIO_BASE + SOBRESUELDO;
                        SET CODIGO_EMPLE = CODIGO_EMPLE + 1;
                        INSERT INTO PRUEBA (COD, APELLIDO1, SALARIO_TOTAL) VALUES (CODIGO_EMPLE, NOMBRE, SALARIO_PLUS);
                        
                        ELSE 
						SET SALARIO_PLUS = SALARIO_BASE + SOBRESUELDO;
						SET CODIGO_EMPLE = CODIGO_EMPLE + 1;
						INSERT INTO PRUEBA (COD, APELLIDO1, SALARIO_TOTAL) VALUES (CODIGO_EMPLE, NOMBRE, SALARIO_PLUS);
					END IF;
				END IF;
		END LOOP;
	CLOSE CUR1;
END ||

DELIMITER ;



END||

DELIMITER ;


/*Escribir un procedimiento que modifique la localidad de un departamento. El procedimiento recibirá como parámetros el número del departamento y la localidad nueva.*/