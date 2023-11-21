USE [base_consorcio]
GO

-- INSERTANDO UTILIZANDO SENTENCIA INSERT
INSERT INTO gasto (idprovincia, idlocalidad, idconsorcio, periodo, fechapago, idtipogasto, importe)
VALUES (1, 1, 4, 1, getdate(), 5, convert(decimal(8,2),rand()*10000.00))
INSERT INTO gasto (idprovincia, idlocalidad, idconsorcio, periodo, fechapago, idtipogasto, importe)
VALUES (1, 1, 5, 1, getdate(), 5, convert(decimal(8,2),rand()*10000.00))
INSERT INTO gasto (idprovincia, idlocalidad, idconsorcio, periodo, fechapago, idtipogasto, importe)
VALUES (1, 1, 6, 1, getdate(), 5, convert(decimal(8,2),rand()*10000.00))
INSERT INTO gasto (idprovincia, idlocalidad, idconsorcio, periodo, fechapago, idtipogasto, importe)
VALUES (1, 1, 7, 1, getdate(), 5, convert(decimal(8,2),rand()*10000.00))
INSERT INTO gasto (idprovincia, idlocalidad, idconsorcio, periodo, fechapago, idtipogasto, importe)
VALUES (1, 1, 8, 1, getdate(), 5, convert(decimal(8,2),rand()*10000.00))

-- INSERTANDO UTILIZANDO PROCEDIMIENTO ALMACENADO

DECLARE @exito1 bit
DECLARE @error1 varchar(200)
DECLARE @date date = GETDATE()
DECLARE @importe1 decimal(8,2) = CONVERT(decimal(8,2),RAND())*10000.00

EXEC dbo.InsertarGasto 1, 1, 9, 1, @date, 5, @importe1, @exito1 OUT, @error1 OUT
SELECT Exito=@exito1, Error=@error1
SELECT @exito1=NULL, @error1=NULL, @importe1=CONVERT(decimal(8,2),RAND())*10000.00

DECLARE @exito2 bit
DECLARE @error2 varchar(200)
DECLARE @importe2 decimal(8,2) = CONVERT(decimal(8,2),RAND())*10000.00

EXEC dbo.InsertarGasto 1, 1, 10, 1, @date, 5, @importe2, @exito2 OUT, @error2 OUT
SELECT Exito=@exito2, Error=@error2
SELECT @exito2=NULL, @error2=NULL, @importe2=CONVERT(decimal(8,2),RAND())*10000.00

DECLARE @exito3 bit
DECLARE @error3 varchar(200)
DECLARE @importe3 decimal(8,2) = CONVERT(decimal(8,2),RAND())*10000.00

EXEC dbo.InsertarGasto 1, 1, 11, 1, @date, 5, @importe3, @exito3 OUT, @error3 OUT
SELECT Exito=@exito3, Error=@error3
SELECT @exito3=NULL, @error3=NULL, @importe3=CONVERT(decimal(8,2),RAND())*10000.00

-- ELIMINANDO UTILIZANDO PROCEDIMIENTO ALMACENADO
DECLARE @exitoEliminar bit
DECLARE @errorEliminar varchar(200)

EXEC dbo.EliminarGasto 174, @exitoEliminar OUT, @errorEliminar OUT
SELECT Exito=@exitoEliminar, Error=@errorEliminar
SELECT @exitoEliminar=NULL, @errorEliminar=NULL

-- MODIFICANDO UTILIZANDO PROCEDIMIENTO ALMACENADO
DECLARE @exitoModificar bit
DECLARE @errorModificar varchar(200)
DECLARE @importeModificar decimal(8,2) = 1540.00

EXEC dbo.CambiarImporteGasto 120, @importeModificar, @exitoModificar OUT, @errorModificar OUT
SELECT Exito=@exitoModificar, Error=@errorModificar
SELECT @exitoModificar=NULL, @errorModificar=NULL
