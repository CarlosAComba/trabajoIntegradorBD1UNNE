USE [base_consorcio]
GO

--DROP FUNCTION IF EXISTS [CalcularEdad]
IF OBJECT_ID('CalcularEdad', 'P') IS NOT NULL
    DROP PROCEDURE CalcularEdad;
GO

CREATE FUNCTION [CalcularEdad] (
	@FechaNacimiento date
)
RETURNS int
AS
BEGIN
	RETURN DATEDIFF(YEAR, @FechaNacimiento, GETDATE())
END