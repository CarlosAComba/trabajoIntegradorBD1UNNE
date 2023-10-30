-- Ejecutar una consulta para comparar el rendimiento de ambas tablas
-- Declarar variables de tiempo
DECLARE @StartTime DATETIME;
DECLARE @EndTime DATETIME;

-- Tiempo de inicio
SET @StartTime = GETDATE();

-- Consulta en la tabla sin índice de Columnstore
SELECT * FROM gasto

-- Tiempo de finalización
SET @EndTime = GETDATE();

-- Calcular el tiempo transcurrido
SELECT 'SELECT * sin columnstore' AS Tabla,  DATEDIFF(MILLISECOND, @StartTime, @EndTime) AS TiempoTranscurrido;

-- Tiempo de inicio
SET @StartTime = GETDATE();

-- Consulta en la tabla con índice de Columnstore
 
SELECT * FROM gastonew

-- Tiempo de finalización
SET @EndTime = GETDATE();

-- Calcular el tiempo transcurrido
SELECT 'SELECT * con columnstore' AS Tabla,  DATEDIFF(MILLISECOND, @StartTime, @EndTime) AS TiempoTranscurrido;

 