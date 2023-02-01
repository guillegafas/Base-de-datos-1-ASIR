
ALTER TABLE medicos
ADD formacion VARCHAR(50);


ALTER TABLE medicos
ADD publicaciones VARCHAR(100) NOT NULL;

ALTER TABLE medicos
MODIFY COLUMN CARGO varchar(50);

ALTER TABLE INGRESOS
ADD RADIOGRAFIAS VARCHAR (50) AFTER DIAGNOSTICO;

ALTER TABLE Ingresos DROP FOREIGN KEY FK_PACIENTE;

ALTER TABLE Medicos
MODIFY COLUMN Especialidad ENUM ('Pediatría','Intensivista','Cardiólogo','Trauma');

INSERT INTO Medicos (N_colegiado, Nombre, Apellido, Apellido2, Especialidad, CARGO, formacion, publicaciones )
VALUES ('', 'JUAN', 'ALBERTO', 'CUENCA', 'pediatria', 'buena', 'yeii')

DROP TABLE INGRESOS;
