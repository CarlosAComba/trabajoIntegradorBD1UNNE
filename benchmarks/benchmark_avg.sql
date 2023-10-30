-- Ejecutar una consulta para comparar el rendimiento de ambas tablas
-- Declarar variables de tiempo
DECLARE @StartTime DATETIME;
DECLARE @EndTime DATETIME;

-- Tiempo de inicio
SET @StartTime = GETDATE();

-- Consulta en la tabla sin �ndice de Columnstore
DECLARE @ValorSinColumnstore INT;
SELECT @ValorSinColumnstore = AVG(importe) FROM gasto  ;

-- Tiempo de finalizaci�n
SET @EndTime = GETDATE();

-- Calcular el tiempo transcurrido
SELECT 'AVG(importe) sin columnstore' AS Tabla, @ValorSinColumnstore AS Cantidad, DATEDIFF(MILLISECOND, @StartTime, @EndTime) AS TiempoTranscurrido;

-- Tiempo de inicio
SET @StartTime = GETDATE();

-- Consulta en la tabla con �ndice de Columnstore
DECLARE @ValorConColumnstore INT;
SELECT @ValorConColumnstore = AVG(importe) FROM gastonew ;

-- Tiempo de finalizaci�n
SET @EndTime = GETDATE();

-- Calcular el tiempo transcurrido
SELECT 'AVG(importe) con columnstore' AS Tabla, @ValorConColumnstore AS Cantidad, DATEDIFF(MILLISECOND, @StartTime, @EndTime) AS TiempoTranscurrido;

 