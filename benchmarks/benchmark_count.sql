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

-- Tiempo de inicio
SET @StartTime = GETDATE();

-- Consulta en la tabla con índice de Columnstore
DECLARE @ValorConColumnstore INT;
SELECT @ValorConColumnstore = COUNT(*) FROM gastonew WHERE idconsorcio <= 250;

-- Tiempo de finalización
SET @EndTime = GETDATE();

-- Calcular el tiempo transcurrido
SELECT 'COUNT(*) con columnstore' AS Tabla, @ValorConColumnstore AS Cantidad, DATEDIFF(MILLISECOND, @StartTime, @EndTime) AS TiempoTranscurrido;

 