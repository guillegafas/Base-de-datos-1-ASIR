 /*Ejercicio 2 .1En la base de datos CLINICA creamos un procedimiento que obtenga un 
 listado con todas Los ingresos realizadas en un determinado año. Además, debe dejar en un parámetro de salida el total de ingresos realizadas en ese año.
*/
USE CLINICA2021;
DELIMITER ||
CREATE PROCEDURE INGRESOS_ANIO_PACIENTE (IN PACIENTE VARCHAR(2), IN ANIO YEAR)
BEGIN
DECLARE DONE INT DEFAULT FALSE;
DECLARE INGRESO INT DEFAULT 0;
DECLARE FECHA_I DATE;
DECLARE FECHA_A DATE;
DECLARE PRECIO FLOAT DEFAULT 0;
DECLARE DOLENCIA VARCHAR (25);
DECLARE MEDICO VARCHAR (4);
DECLARE CUENTA FLOAT DEFAULT 0;
DECLARE CUR1 CURSOR FOR SELECT COD_INGRESO, FECHA_INGRESO, FECHA_ALTA, COSTE, DIAGNOSTICO, N_COLEGIADO FROM INGRESOS WHERE COD_PACIENTE = PACIENTE;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET DONE = TRUE;
	OPEN CUR1;
		BUCLE:LOOP
			FETCH CUR1 INTO INGRESO, FECHA_I, FECHA_A, PRECIO, DOLENCIA, MEDICO;
				IF DONE THEN LEAVE BUCLE;
                ELSE
					SELECT COUNT(*) INTO CUENTA FROM INGRESOS WHERE YEAR(FECHA_INGRESO) = ANIO;
                    SELECT concat(INGRESO, FECHA_I, FECHA_A, PRECIO, DOLENCIA, 'TOTAL_INGRESO ', CUENTA);
				END IF;
		END LOOP;
CLOSE CUR1;
				
			
END||
DELIMITER ;



/*1-Crear un procedimiento que muestre la tabla de multiplicar de un número que se paso como entrada nota concat*/
DELIMITER ||
CREATE PROCEDURE MULTIPLICAR (IN NUMERO INT)
BEGIN
DECLARE A INT DEFAULT 0;
DECLARE RESULTADO FLOAT DEFAULT 0;
		WHILE A < 11 DO
			SET RESULTADO = NUMERO * A;
            SELECT CONCAT('El numero es :', ' ', NUMERO, ' *', A, ' = ', RESULTADO);
			SET A = A+1;
		END WHILE;
END||
DELIMITER ;


/*2-Crear un procedimiento que inserte en una tabla previamente creada  de multiplicar de un número que se paso como entrada*/


CREATE TABLE TABLA_MULTIPLICAR(
NUMERO INT,
MULTIPLICA INT,
RESULTADO FLOAT
) engine=InnoDB;



DELIMITER |
CREATE PROCEDURE TABLA_MULTIPLICAR_INSERTAR (IN numero INT)
BEGIN
    DECLARE a INT DEFAULT 0;
    DECLARE RESULTADO FLOAT DEFAULT 0;
    WHILE a < 11 DO
        INSERT INTO tabla_multiplicar VALUES (numero, a, RESULTADO);
        SET a = a + 1;
    END WHILE;
END |
DELIMITER ;




/*3-Creamos un procedimiento que recibe un número entero y muestra los números anteriores hasta llegar al uno. (El número debe ser mayor que cero)*/
DELIMITER ||
CREATE PROCEDURE NUMEROS_ANTERIORES (IN NUMERO INT)
BEGIN
	IF NUMERO <= 0 THEN 
    SELECT CONCAT('El numero debe ser mayot a 0');
    ELSE 
		WHILE NUMERO > 0 DO
			SET NUMERO = NUMERO -1;
            SELECT CONCAT('EL numero -1 es', NUMERO);
		END WHILE;
	END IF;
END||
DELIMITER ; 


/*EJERCICIO 3.4 Dado una nota que se recibe como parámetro de entrada Mostrar si esta aprobado, suspenso, notable ....*/
DELIMITER ||
CREATE PROCEDURE NOTAS (IN NOTA FLOAT)
BEGIN
DECLARE ESTADO VARCHAR(15);
	IF NOTA >= 9 THEN SET ESTADO = 'SOBRESALIENTE';
    ELSEIF NOTA >= 7 THEN SET ESTADO = 'NOTABLE';
    ELSEIF NOTA >= 5 THEN SET ESTADO = 'APROBADO';
    ELSEIF NOTA <= 5 THEN SET ESTADO = 'SUSPENSO';
	END IF;
    SELECT ESTADO;
END ||
DELIMITER ;


/* Diseñar una función que calcule los días que pasa un paciente en el hospital*/
DELIMITER ||
CREATE FUNCTION DIAS_HOSPITALIZADO (INGRESO INT) RETURNS FLOAT
BEGIN
DECLARE FECHA1 DATE;
DECLARE FECHA2 DATE;
DECLARE RESULTADO FLOAT;
	SELECT FECHA_INGRESO, FECHA_ALTA INTO FECHA1, FECHA2 FROM INGRESOS WHERE INGRESO = COD_INGRESO;
	SET RESULTADO = DATEDIFF(FECHA2, FECHA1);
    RETURN RESULTADO;
END ||
DELIMITER ;

/*Funcion que le metas un numero y te sume todos los numero de los que esta compuesto*/

DELIMITER |
CREATE FUNCTION SUMA_NUMEROS (NUMERO FLOAT) RETURNS FLOAT
BEGIN 
DECLARE A FLOAT DEFAULT 0;
DECLARE B FLOAT DEFAULT 0;
	WHILE  A < NUMERO DO
		SET B = B + A;
        SET A = A + 1;
	END WHILE;
    RETURN B;
END |

DELIMITER ;


/*Escribir una función que devuelva el coste medio de los pacientes ingresado en un año, que se pasa como parámetro*/

DELIMITER |
CREATE FUNCTION COSTE_MEDIO_ANIO (ANIO YEAR) RETURNS FLOAT
BEGIN
DECLARE COSTE_MEDIO FLOAT DEFAULT 0;
SELECT AVG(COSTE) INTO COSTE_MEDIO FROM INGRESOS WHERE YEAR(FECHA_INGRESO) = ANIO;
RETURN COSTE_MEDIO;

END |

DELIMITER ;


/*CREA UN PROCEDIMIENTO QUE ME META EN UNA NUEVA TABLA DE EMPRESA EL CODIGO NUEVO DE EMPLEADO, QUE SERA EL CODIGO DE EMPLEADO Y EL COD DE DEPARTAMENTO UNIDO. 
TAMBIEN ME METERA EN UNA NUEVA COLUMNA EL SALARIO + COMISION */
CREATE TABLE empleados2 (
  CLAVE_EMPLE tinyint NOT NULL,
  SUMA_SALARIO_COMISION FLOAT,
  PRIMARY KEY (CLAVE_EMPLE)
) ENGINE=INNODB;

ALTER TABLE empleados2 modify CLAVE_EMPLE INT;

/*VAMOS A CREAR UNA FUNCION QUE ME SAQUE LAS CLAVES DE FORMA ADECUADA*/

DELIMITER ||
CREATE DEFINER=`root`@`localhost` FUNCTION `CLAVE_EMP`(COD_EMP INT, COD_DEPT INT) RETURNS int
BEGIN
DECLARE CLAVE INT DEFAULT 0;
	SET CLAVE = concat(COD_EMP, COD_DEPT);

RETURN CLAVE;
END ||
DELIMITER ;
DELIMITER ||
CREATE PROCEDURE TABLA_NUEVA_EMPLEADOS()
BEGIN
DECLARE DONE INT DEFAULT FALSE;
DECLARE SUELDO_TOTAL FLOAT DEFAULT 0;
DECLARE SUELDO FLOAT DEFAULT 0;
DECLARE SOBRESUELDO FLOAT DEFAULT 0;
DECLARE COD_EMP INT DEFAULT 0;
DECLARE COD_DEPT INT DEFAULT 0;
DECLARE COD INT DEFAULT 0;
DECLARE CUR1 CURSOR FOR SELECT EMP_NO, DEPT_NO, SALARIO, COMISION FROM EMPLE;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET DONE = TRUE;
	OPEN CUR1;
    	BUCLE:LOOP
			FETCH CUR1 INTO COD_EMP, COD_DEPT, SUELDO, SOBRESUELDO;
				IF DONE THEN LEAVE BUCLE;
                ELSE
					IF SOBRESUELDO IS NULL THEN
						SET SOBRESUELDO = 0;
						SET SUELDO_TOTAL = SUELDO + SOBRESUELDO;
						SET COD = CLAVE_EMP(COD_DEPT, COD_EMP);
							IF COD IN (SELECT CLAVE_EMPLE FROM EMPLEADOS2) THEN
								UPDATE EMPLEADOS2 SET SUMA_SALARIO_COMISION = SUELDO_TOTAL;
							ELSE 
                            INSERT INTO EMPLEADOS2 VALUES (COD, SUELDO_TOTAL);
                            END IF;
					ELSE
						SET SUELDO_TOTAL = SUELDO + SOBRESUELDO;
                        SET COD = CLAVE_EMP(COD_DEPT, COD_EMP);
								IF COD IN (SELECT CLAVE_EMPLE FROM EMPLEADOS2) THEN
									UPDATE EMPLEADOS2 SET SUMA_SALARIO_COMISION = SUELDO_TOTAL;
								ELSE 
								INSERT INTO EMPLEADOS2 VALUES (COD, SUELDO_TOTAL);
								END IF;
					END IF;
				END IF;
		END LOOP;
	CLOSE CUR1;
END||

DELIMITER ;




 /*Crea el procedimiento que se pase el nombre de un paciente y si existe se introduce en una tabla nueva donde 
 vengan el numero total de ingresos, si no existe saldra por pantalla no existe*/
 
 USE CLINICA2021;

CREATE TABLE N_TOTAL_INGRESOS (
COD INT,
N_TOTAL FLOAT
)

DELIMITER |
CREATE PROCEDURE TOTAL_INGRESO (IN COD_P INT)
BEGIN
DECLARE DONE INT DEFAULT FALSE;
DECLARE CUENTA INT DEFAULT 0;
DECLARE CUR1 CURSOR FOR SELECT COUNT(COD_INGRESO) FROM INGRESOS WHERE COD_PACIENTE = COD_P;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET DONE = TRUE;

IF COD_P NOT IN (SELECT COD_PACIENTE FROM PACIENTES WHERE COD_P = COD_PACIENTE) THEN
	SELECT CONCAT('EL PACIENTE ', COD_P, ' NO EXISTE');

ELSE 
	OPEN CUR1;
			BUCLE:LOOP
				FETCH CUR1 INTO CUENTA;
					IF DONE THEN LEAVE BUCLE;
					ELSE
						IF COD_P IN (SELECT COD FROM N_TOTAL_INGRESOS) THEN
							UPDATE N_TOTAL_INGRESOS SET N_TOTAL = CUENTA WHERE COD = COD_P;
						ELSE 
							INSERT INTO N_TOTAL_INGRESOS VALUES (COD_P, CUENTA);
						END IF;
					END IF;
               END LOOP;
     CLOSE CUR1;          
END IF;

END|

DELIMITER ;