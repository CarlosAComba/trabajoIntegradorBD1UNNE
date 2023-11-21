USE [base_consorcio]
GO

-- INSERTANDO UTILIZANDO SENTENCIA INSERT
INSERT INTO consorcio (idprovincia, idlocalidad, idconsorcio, nombre, direccion, idzona, idconserje, idadmin)
VALUES (1, 1,  5,  'EDIFICIO-115',  'CALLE FALSA 115', 5, 100, 1)
INSERT INTO consorcio (idprovincia, idlocalidad, idconsorcio, nombre, direccion, idzona, idconserje, idadmin)
VALUES (1, 1,  6,  'EDIFICIO-116',  'CALLE FALSA 116', 5, 100, 1)
INSERT INTO consorcio (idprovincia, idlocalidad, idconsorcio, nombre, direccion, idzona, idconserje, idadmin)
VALUES (1, 1,  8,  'EDIFICIO-118',  'CALLE FALSA 118', 5, 100, 1)
INSERT INTO consorcio (idprovincia, idlocalidad, idconsorcio, nombre, direccion, idzona, idconserje, idadmin)
VALUES (1, 1,  9,  'EDIFICIO-119',  'CALLE FALSA 119', 5, 100, 1)
INSERT INTO consorcio (idprovincia, idlocalidad, idconsorcio, nombre, direccion, idzona, idconserje, idadmin)
VALUES (1, 1, 11, 'EDIFICIO-1111', 'CALLE FALSA 1111', 5, 100, 1)
INSERT INTO consorcio (idprovincia, idlocalidad, idconsorcio, nombre, direccion, idzona, idconserje, idadmin)
VALUES (1, 1, 12, 'EDIFICIO-1112', 'CALLE FALSA 1112', 5, 100, 1)
INSERT INTO consorcio (idprovincia, idlocalidad, idconsorcio, nombre, direccion, idzona, idconserje, idadmin)
VALUES (1, 1, 13, 'EDIFICIO-1113', 'CALLE FALSA 1113', 5, 100, 1)

-- INSERTANDO UTILIZANDO PROCEDIMIENTO ALMACENADO
DECLARE @exitoInsertar1 bit
DECLARE @errorInsertar1 varchar(200)

EXEC dbo.InsertarConsorcio 1, 1,  114,  'EDIFICIO-114',  'CALLE FALSA 11114', 5, 100, 1, @exitoInsertar1 OUT, @errorInsertar1 OUT
SELECT Exito=@exitoInsertar1, Error=@errorInsertar1
SELECT @exitoInsertar1=NULL, @errorInsertar1=NULL

DECLARE @exitoInsertar2 bit
DECLARE @errorInsertar2 varchar(200)

EXEC dbo.InsertarConsorcio 1, 1,  7,  'EDIFICIO-117',  'CALLE FALSA 117', 5, 100, 1, @exitoInsertar2 OUT, @errorInsertar2 OUT
SELECT Exito=@exitoInsertar2, Error=@errorInsertar2
SELECT @exitoInsertar2=NULL, @errorInsertar2=NULL

DECLARE @exitoInsertar3 bit
DECLARE @errorInsertar3 varchar(200)

EXEC dbo.InsertarConsorcio 1, 1, 200, 'EDIFICIO-1110', 'CALLE FALSA 11200', 5, 100, 1, @exitoInsertar3 OUT, @errorInsertar3 OUT
SELECT Exito=@exitoInsertar3, Error=@errorInsertar3
SELECT @exitoInsertar3=NULL, @errorInsertar3=NULL

-- ELIMINANDO UTILIZANDO PROCEDIMIENTO ALMACENADO
DECLARE @exitoEliminar bit
DECLARE @errorEliminar varchar(200)

EXEC dbo.EliminarConsorcio 1, 1, 15, @exitoEliminar OUT, @errorEliminar OUT
SELECT Exito=@exitoEliminar, Error=@errorEliminar
SELECT @exitoEliminar=NULL, @errorEliminar=NULL

-- MODIFICANDO UTILIZANDO PROCEDIMIENTO ALMACENADO
DECLARE @exitoModificar bit
DECLARE @errorModificar varchar(200)

EXEC dbo.CambiarDireccionConsorcio 1, 1, 5, 'ESTA ES UNA DIRECCION MODIFICADA', @exitoModificar OUT, @errorModificar OUT
SELECT Exito=@exitoModificar, Error=@errorModificar
SELECT @exitoModificar=NULL, @errorModificar=NULL

	