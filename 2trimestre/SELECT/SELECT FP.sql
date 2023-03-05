use fp_comunidad_madrid;
-- Describe las tablas familiaprofesional y ciclosfp
SELECT * FROM familiaprofesional;
SELECT * FROM ciclosfp;

-- Mostar los ciclos que pertenecen a la familia de Informática 
SELECT DENOMINACION FROM familiaprofesional f, ciclosfp c where  f.COD_FAMILIA = c.COD_FAMILIA AND DESCRIPCION = 'informática';

-- Mostrar los módulos de el ciclo se asir y daw
SELECT M.DESCRIPCION FROM ciclosfp C, ciclosfpmodulos CM, modulos M
 WHERE (C.COD_CICLO = CM.COD_CICLO AND M.COD_MODULO = CM.COD_MODULO ) AND ( C.DENOMINACION = 'ASIR' OR C.DENOMINACION = 'DAW');
 
-- Mostrar los ciclos con más de 1000 horas pertenecientes a informática
SELECT DENOMINACION FROM ciclosfp C, familiaprofesional F WHERE F.COD_FAMILIA = C.COD_FAMILIA
AND DURACION > 1000;

-- Mostrar los ciclos con más de 1000 horas pertenecientes a informática y sumarles 100 horas más.
SELECT DENOMINACION, DURACION + 1000 FROM ciclosfp C, familiaprofesional F WHERE F.COD_FAMILIA = C.COD_FAMILIA
AND (DURACION > 1000 AND F.DESCRIPCION = 'informática');

-- Ies de alcorcón
SELECT NOMBRE FROM IES WHERE LOCALIDAD = 'Alcorcon';

-- Mostrar los IES de Alcorcón y Móstoles con ciclos de tarde 
SELECT DISTINCT NOMBRE FROM IES I, ciclosfpies CI  WHERE  CI.COD_IES = I.COD_IES AND
   ( (LOCALIDAD = 'Alcorcon' OR LOCALIDAD = 'Mostoles') AND TURNO = 't') ;
   
   
-- Mostrar los IES de Alcorcón y Móstoles con ciclos de tarde CON CICLOS DE ASIR
SELECT DISTINCT NOMBRE FROM IES I, ciclosfpies CI, ciclosfp C WHERE  (CI.COD_IES = I.COD_IES AND C.COD_CICLO = CI.COD_CICLO) AND
  ( ( (LOCALIDAD = 'Alcorcon' OR LOCALIDAD = 'Mostoles') AND TURNO = 't') AND C.DENOMINACION = 'ASIR');

select distinct nombre from ies i,ciclosfpies c where i.cod_ies = c.cod_ies and (localidad in ("Alcorcón","Mostoles") and c.turno = "t" and c.cod_ciclo = "0001");

-- Mostrar los ciclos que se han implantado entre los años 2015 y 2017
SELECT DISTINCT DENOMINACION FROM ciclosfp C, ciclosfpies I WHERE C.COD_CICLO= I.COD_CICLO AND 
F_IMPLANTACION between '2015-01-01' AND '2017-12-31';

-- Mostrar las empresas con sede en Madrid o con un número de trabajadores menor a 50.
SELECT NOMBRE FROM empresafct WHERE SEDE = 'Madrid' OR N_TRABAJADOR <50;

-- Mostrar los datos de las familias profesionales que no tienen dado de alta ciclos formativos
SELECT DESCRIPCION FROM familiaprofesional F WHERE F.COD_FAMILIA NOT IN
( SELECT COD_FAMILIA FROM ciclosfp);

insert into empresafct
values("0004","Paradigma","Madrid","",400,"1","");
-- StratoDB
insert into empresafct
values("0005","StratoDB","Silicon Valley","",Null,"1","");

-- Mostrar los datos de la empresa con mayor número de trabajadores
SELECT NOMBRE FROM empresafct WHERE N_TRABAJADOR = (SELECT max(N_TRABAJADOR ) FROM empresafct);

-- Contar el numero de ciclos por familia
SELECT count(COD_CICLO), DESCRIPCION FROM ciclosfp C, familiaprofesional F where 
C.COD_FAMILIA = F.COD_FAMILIA GROUP BY DESCRIPCION;

-- Contar el numero de módulos por ciclo
SELECT count(CM.COD_MODULO), C.DENOMINACION FROM ciclosfp C, ciclosfpmodulos CM, modulos M 
WHERE C.COD_CICLO = CM.COD_CICLO AND M.COD_MODULO = CM.COD_MODULO group by DENOMINACION;

