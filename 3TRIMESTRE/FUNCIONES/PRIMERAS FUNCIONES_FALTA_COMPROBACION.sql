
/*nos damos permisos*/

set global log_bin_trust_function_creators = 1;

/*Escribe una función que recibe una cadena de caracteres y devuelve un mensaje de saludo*/
DELIMITER ||
CREATE DEFINER=`root`@`localhost` FUNCTION `saludar`(nombre VARCHAR(15)) RETURNS varchar(25) CHARSET utf8mb3
BEGIN
	DECLARE saludo VARCHAR(25) DEFAULT ' ';
	SET saludo = CONCAT('¡Hola ', nombre);
	RETURN saludo;
RETURN 1;
END ||


/*Escribir una función que devuelva el coste medio de los pacientes ingresado en un año, que se pasa como parámetro*/
DELIMITER ||
CREATE DEFINER=`root`@`localhost` FUNCTION `COSTEMEDIO`(FECHA_INGRESO_CLIENTE YEAR) RETURNS float
BEGIN
	DECLARE COSTE_MEDIO FLOAT DEFAULT 0;
	SELECT AVG(COSTE) INTO COSTE_MEDIO FROM INGRESOS WHERE year(FECHA_INGRESO) = (FECHA_INGRESO_CLIENTE);
RETURN COSTE_MEDIO;
END ||

/* Diseñar una función que calcule los días que pasa un paciente en el hospital*/

CREATE DEFINER=`root`@`localhost` FUNCTION `DÍAS_HOSPITALIZADO`(COD_INGRESO INT) RETURNS int
BEGIN
	DECLARE N_INGRESO INT DEFAULT 0;
	DECLARE N_DIAS FLOAT DEFAULT 0;
	DECLARE INGRESO DATE;
	DECLARE ALTA DATE; 
	SELECT FECHA_INGRESO, FECHA_ALTA INTO INGRESO, ALTA FROM INGRESOS WHERE COD_INGRESO = N_INGRESO;
	SET N_DIAS = datediff(INGRESO, ALTA);
RETURN N_DIAS;
END