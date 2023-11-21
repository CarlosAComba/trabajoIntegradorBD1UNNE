PRINT '---Pruebas para usuario usuarioDBA con rol DBA_Role---'
USE base_consorcio;
EXECUTE AS LOGIN = 'logDBA' ;
PRINT '(Ejecutando como usuario '+ USER +')'

PRINT 'Prueba 1: Crear o modificar tablas, deberia ser exitosa si la tabla no existe'
CREATE TABLE Ejemplo (ID INT, cantidad INT);
GO

PRINT 'Prueba 2: Insertar 2 registros en la tabla Ejemplo, deberia ser exitosa'
INSERT INTO Ejemplo (ID, cantidad) VALUES (1, 10);
INSERT INTO Ejemplo (ID, cantidad) VALUES (2, 20);
GO

PRINT 'Prueba 3: Actualizar un registro en la tabla Ejemplo, deberia ser exitosa'
UPDATE Ejemplo SET cantidad = 30 WHERE ID = 2;
GO
REVERT; -- Salir del contexto de usuarioDBA

-------------------------------2da prueba--------------------------------------------

PRINT '---Pruebas para usuario usuarioReadOnly con rol ReadOnly_Role---'
EXECUTE AS LOGIN = 'logRO'; -- Iniciar sesión como usuarioReadOnly
PRINT '(Ejecutando como usuario '+ USER +')'

PRINT 'Prueba 1: SELECT sobre tabla, deberia ser exitosa '
SELECT * FROM Ejemplo;
GO

PRINT 'Prueba 2: Insertar 2 registros en la tabla Ejemplo, deberia fallar'
INSERT INTO Ejemplo (ID, cantidad) VALUES (4, 100);
INSERT INTO Ejemplo (ID, cantidad) VALUES (6, 200);
GO

PRINT 'Prueba 3: Actualizar un registro en la tabla Ejemplo, deberia fallar'
UPDATE Ejemplo SET cantidad = 30 WHERE ID = 2;
GO
REVERT; -- Salir del contexto de usuarioReadOnly

