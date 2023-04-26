  /*Debe crear un procedimiento que se le pasen dos números por entrada e indique cual es mayor*/

DELIMITER |
CREATE PROCEDURE comparacion_numeros(IN num1 INT, IN num2 INT)
BEGIN
  IF num1 > num2 THEN
    SELECT CONCAT(num1, ' es mayor que ', num2) AS 'Resultado';
  ELSEIF num2 > num1 THEN
    SELECT CONCAT(num2, ' es mayor que ', num1) AS 'Resultado';
  ELSE
    SELECT CONCAT(num1, ' y ', num2, ' son iguales') AS 'Resultado';
  END IF;
END|
DELIMITER ;

/*Debe crear un procedimiento que lea dos salarios de la tabla emp, compararlos y mostrar por pantalla el salario mayor*/

DELIMITER |
CREATE PROCEDURE comparacion_salario (IN salario1 INT, IN salario2 INT)
BEGIN
    IF salario1 > salario2 THEN
        SELECT salario1 AS 'Salario mayor';
    ELSE
        SELECT salario2 AS 'Salario mayor';
    END IF;
END |
DELIMITER ;

