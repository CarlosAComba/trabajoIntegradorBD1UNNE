USE [base_consorcio]
GO

-- INSERTANDO UTILIZANDO SENTENCIA INSERT
INSERT INTO administrador (apeynom, sexo, fechnac) VALUES ('CANDELA BUONANOTTE', 'F', '1990-01-13 00:00:00.000')
INSERT INTO administrador (apeynom, sexo, fechnac) VALUES ('JUAN ALVAREZ', 'M', '1988-08-28 00:00:00.000')
INSERT INTO administrador (apeynom, sexo, fechnac) VALUES ('CAROLINA GARNACHO', 'S', '1975-06-15 00:00:00.000')
INSERT INTO administrador (apeynom, sexo, fechnac) VALUES ('MARIELA OTAMENDI', 'F', '1984-04-21 00:00:00.000')
INSERT INTO administrador (apeynom, sexo, fechnac) VALUES ('CLAUDIA PERRONE', 'F', '1977-02-19 00:00:00.000')
INSERT INTO administrador (apeynom, sexo, fechnac) VALUES ('FERNANDA CORREA', 'F', '1966-03-06 00:00:00.000')
INSERT INTO administrador (apeynom, sexo, fechnac) VALUES ('GASTON DE PAUL', 'M', '1956-05-24 00:00:00.000')
INSERT INTO administrador (apeynom, sexo, fechnac) VALUES ('JORGE MARTINEZ', 'M', '1989-07-04 00:00:00.000')
INSERT INTO administrador (apeynom, sexo, fechnac) VALUES ('LUIS OTAMENDI', 'M', '1986-09-17 00:00:00.000')
INSERT INTO administrador (apeynom, sexo, fechnac) VALUES ('AGUSTIN ROMERO', 'M', '1968-11-03 00:00:00.000')

-- INSERTANDO UTILIZANDO PROCEDIMIENTO ALMACENADO
DECLARE @exitoInsertar1 bit
DECLARE @errorInsertar1 varchar(200)

EXEC dbo.InsertarAdministrador 'CAROLINA GARNACHO', 'S', '3794123456', 'S', '1975-06-15 00:00:00.000', @exitoInsertar1 OUT, @errorInsertar1 OUT
SELECT Exito=@exitoInsertar1, Error=@errorInsertar1
SELECT @exitoInsertar1=NULL, @errorInsertar1=NULL

DECLARE @exitoInsertar2 bit
DECLARE @errorInsertar2 varchar(200)

EXEC dbo.InsertarAdministrador 'FERNANDA CORREA', 'N', '3794654987', 'F', '1966-03-06 00:00:00.000', @exitoInsertar2 OUT, @errorInsertar2 OUT
SELECT Exito=@exitoInsertar2, Error=@errorInsertar2
SELECT @exitoInsertar2=NULL, @errorInsertar2=NULL

DECLARE @exitoInsertar3 bit
DECLARE @errorInsertar3 varchar(200)

EXEC dbo.InsertarAdministrador 'GASTON DE PAUL', 'N', '3795456123', 'M', '1956-05-24 00:00:00.000', @exitoInsertar3 OUT, @errorInsertar3 OUT
SELECT Exito=@exitoInsertar3, Error=@errorInsertar3
SELECT @exitoInsertar3=NULL, @errorInsertar3=NULL

-- ELIMINANDO UTILIZANDO PROCEDIMIENTO ALMACENADO
DECLARE @exitoEliminar bit
DECLARE @errorEliminar varchar(200)

EXEC dbo.EliminarAdministrador 15, @exitoEliminar OUT, @errorEliminar OUT
SELECT Exito=@exitoEliminar, Error=@errorEliminar
SELECT @exitoEliminar=NULL, @errorEliminar=NULL

-- MODIFICANDO UTILIZANDO PROCEDIMIENTO ALMACENADO
DECLARE @exitoModificar bit
DECLARE @errorModificar varchar(200)

EXEC dbo.CambiarResidenciaAdministrador 15, 'G', @exitoModificar OUT, @errorModificar OUT
SELECT Exito=@exitoModificar, Error=@errorModificar
SELECT @exitoModificar=NULL, @errorModificar=NULL

EXEC dbo.CambiarResidenciaAdministrador 15, 'S', @exitoModificar OUT, @errorModificar OUT
SELECT Exito=@exitoModificar, Error=@errorModificar
SELECT @exitoModificar=NULL, @errorModificar=NULL

-- UTILIZANDO FUNCION PARA CALCULAR EDAD
SELECT [Nombre y Apellido]=apeynom, [Edad]=dbo.[CalcularEdad](fechnac) FROM administrador



