use clinica2021;

/*1-Crear un procedimiento que muestre la tabla de multiplicar de un número que se paso como entrada nota concat*/

DELIMITER |
CREATE PROCEDURE tabla_multiplicar (IN num INT)
BEGIN
declare a int;
    DECLARE resultado INT ;
    WHILE a <= 10 DO
        SELECT CONCAT(num, ' * ', a, ' = ', numemro * a) AS resultado;
        SET resultado = numero * a;
        SET a=a+1;
    END WHILE;
END |
DELIMITER ;

/*2-Crear un procedimiento que inserte en una tabla previamente creada  de multiplicar de un número que se paso como entrada*/

DELIMITER |
CREATE PROCEDURE insertar_tabla_multiplicar (IN numero INT)
BEGIN
    DECLARE a INT DEFAULT 1;
    WHILE a <= 10 DO
        INSERT INTO tabla_multiplicar (numero, resultado) VALUES (numero, numero * a);
        SET a = a + 1;
    END WHILE;
END |
DELIMITER ;

/*3-Creamos un procedimiento que recibe un número entero y muestra los números anteriores hasta llegar al uno. (El número debe ser mayor que cero)*/

DELIMITER |
CREATE PROCEDURE mostrar_numeros(IN numero INT)
BEGIN
  DECLARE a INT DEFAULT numero;
  WHILE a >= 1 DO
    SELECT a;
    SET a = a - 1;
  END WHILE;
END |
DELIMITER ;

/*Otra manera 3*/

DELIMITER |
CREATE PROCEDURE mostrar_numeros(IN numero INT)
BEGIN
  DECLARE a INT;
  SET a = 1;
  
  WHILE numero > 0 DO 
    SELECT CONCAT (numero,"-",a,numero -a) AS resultado;
    SET numero = numero - a;
  END WHILE;
END |
DELIMITER ;

