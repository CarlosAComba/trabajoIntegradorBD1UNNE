-- Ejecutar una consulta para comparar el rendimiento de ambas tablas
-- Declarar variables de tiempo
DECLARE @StartTime DATETIME;
DECLARE @EndTime DATETIME;

-- Tiempo de inicio
SET @StartTime = GETDATE();

-- Consulta en la tabla sin índice de Columnstore
SELECT gasto.*, provincia.descripcion AS NombreProvincia
FROM gasto
JOIN provincia ON gasto.idprovincia = provincia.idprovincia
WHERE gasto.idprovincia BETWEEN 4 AND 5;

-- Tiempo de finalización
SET @EndTime = GETDATE();

-- Calcular el tiempo transcurrido
SELECT 'JOIN sin columnstore' AS Tabla,  DATEDIFF(MILLISECOND, @StartTime, @EndTime) AS TiempoTranscurrido;

-- Tiempo de inicio
SET @StartTime = GETDATE();

-- Consulta en la tabla con índice de Columnstore
 
SELECT gastonew.*, provincia.descripcion AS NombreProvincia
FROM gastonew
JOIN provincia ON gastonew.idprovincia = provincia.idprovincia
WHERE gastonew.idprovincia BETWEEN 4 AND 5;

-- Tiempo de finalización
SET @EndTime = GETDATE();

-- Calcular el tiempo transcurrido
SELECT 'JOIN con columnstore' AS Tabla,  DATEDIFF(MILLISECOND, @StartTime, @EndTime) AS TiempoTranscurrido;

 