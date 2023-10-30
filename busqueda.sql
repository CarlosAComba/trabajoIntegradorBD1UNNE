use base_consorcio;
go
--test 1
--parte 1
-- Ejecutar una consulta para comparar el rendimiento de ambas tablas
-- Declarar variables de tiempo
DECLARE @StartTime DATETIME;
DECLARE @EndTime DATETIME;

-- Tiempo de inicio
SET @StartTime = GETDATE();

-- Consulta en la tabla sin índice de Columnstore
DECLARE @ValorSinColumnstore BIGINT;
SELECT @ValorSinColumnstore = SUM(importe) FROM gasto  ;

-- Tiempo de finalización
SET @EndTime = GETDATE();

-- Calcular el tiempo transcurrido
SELECT 'SUM(importe) sin columnstore' AS Tabla, @ValorSinColumnstore AS Cantidad, DATEDIFF(MILLISECOND, @StartTime, @EndTime) AS TiempoTranscurrido;

------------------------------------------------------------------
--parte 2
DECLARE @StartTime DATETIME;
DECLARE @EndTime DATETIME;
-- Tiempo de inicio
SET @StartTime = GETDATE();

-- Consulta en la tabla con índice de Columnstore
DECLARE @ValorConColumnstore BIGINT;
SELECT @ValorConColumnstore = SUM(importe) FROM gastonew ;

-- Tiempo de finalización
SET @EndTime = GETDATE();

-- Calcular el tiempo transcurrido
SELECT 'SUM(importe) con columnstore' AS Tabla, @ValorConColumnstore AS Cantidad, DATEDIFF(MILLISECOND, @StartTime, @EndTime) AS TiempoTranscurrido;

--test 2
-- Ejecutar una consulta para comparar el rendimiento de ambas tablas
-- Declarar variables de tiempo
DECLARE @StartTime DATETIME;
DECLARE @EndTime DATETIME;

-- Tiempo de inicio
SET @StartTime = GETDATE();

-- Consulta en la tabla sin índice de Columnstore
DECLARE @ValorSinColumnstore INT;
SELECT @ValorSinColumnstore = AVG(importe) FROM gasto  ;

-- Tiempo de finalización
SET @EndTime = GETDATE();

-- Calcular el tiempo transcurrido
SELECT 'AVG(importe) sin columnstore' AS Tabla, @ValorSinColumnstore AS Cantidad, DATEDIFF(MILLISECOND, @StartTime, @EndTime) AS TiempoTranscurrido;

------------------------------------------------------------------
--parte 2

DECLARE @StartTime DATETIME;
DECLARE @EndTime DATETIME;
-- Tiempo de inicio
SET @StartTime = GETDATE();

-- Consulta en la tabla con índice de Columnstore
DECLARE @ValorConColumnstore INT;
SELECT @ValorConColumnstore = AVG(importe) FROM gastonew ;

-- Tiempo de finalización
SET @EndTime = GETDATE();

-- Calcular el tiempo transcurrido
SELECT 'AVG(importe) con columnstore' AS Tabla, @ValorConColumnstore AS Cantidad, DATEDIFF(MILLISECOND, @StartTime, @EndTime) AS TiempoTranscurrido;

--test 3
--parte 1
-- Ejecutar una consulta para comparar el rendimiento de ambas tablas
-- Declarar variables de tiempo
DECLARE @StartTime DATETIME;
DECLARE @EndTime DATETIME;

-- Tiempo de inicio
SET @StartTime = GETDATE();

-- Consulta en la tabla sin índice de Columnstore
DECLARE @ValorSinColumnstore INT;
SELECT @ValorSinColumnstore = COUNT(*) FROM gasto WHERE idconsorcio <= 250;

-- Tiempo de finalización
SET @EndTime = GETDATE();

-- Calcular el tiempo transcurrido
SELECT 'COUNT(*) sin columnstore' AS Tabla, @ValorSinColumnstore AS Cantidad, DATEDIFF(MILLISECOND, @StartTime, @EndTime) AS TiempoTranscurrido;

------------------------------------------------------------------
--parte 2
DECLARE @StartTime DATETIME;
DECLARE @EndTime DATETIME;
-- Tiempo de inicio
SET @StartTime = GETDATE();

-- Consulta en la tabla con índice de Columnstore
DECLARE @ValorConColumnstore INT;
SELECT @ValorConColumnstore = COUNT(*) FROM gastonew WHERE idconsorcio <= 250;

-- Tiempo de finalización
SET @EndTime = GETDATE();

-- Calcular el tiempo transcurrido
SELECT 'COUNT(*) con columnstore' AS Tabla, @ValorConColumnstore AS Cantidad, DATEDIFF(MILLISECOND, @StartTime, @EndTime) AS TiempoTranscurrido;


--test 4
--parte 1

-- Calcular el tiempo transcurrido
SELECT *
FROM gasto
WHERE idconsorcio <= 250


------------------------------------------------------------------
--parte 2
-- Calcular el tiempo transcurrido
SELECT gn.* , pro.*
FROM gastonew as gn
WHERE idconsorcio <= 250

--test 5
--parte 1

-- Calcular el tiempo transcurrido
SELECT gn.* , pro.*
FROM gasto as gn
join provincia as pro on gn.idprovincia = pro.idprovincia
WHERE idconsorcio <= 250 and pro.idprovincia = 1


------------------------------------------------------------------
--parte 2
-- Calcular el tiempo transcurrido
SELECT gn.* , pro.*
FROM gastonew as gn
join provincia as pro on gn.idprovincia = pro.idprovincia
WHERE idconsorcio <= 250 and pro.idprovincia = 1
