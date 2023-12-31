USE [base_consorcio]
GO

--DROP PROCEDURE IF EXISTS [InsertarAdministrador]
IF OBJECT_ID('InsertarAdministrador', 'P') IS NOT NULL
    DROP PROCEDURE InsertarAdministrador;
GO

CREATE PROCEDURE [InsertarAdministrador] (
	@apeynom varchar(50) = null,
	@viveahi varchar(1) = null,
	@tel varchar(20) = null,
	@sexo varchar(1) = null,
	@fechnac varchar(20)  = null,
	@exito bit OUT,
	@error varchar(200) OUT
)
AS 
BEGIN
	SET @exito = 1
	BEGIN TRY
		BEGIN TRAN
		INSERT INTO administrador (apeynom, viveahi, tel, sexo, fechnac) 
		VALUES (@apeynom, @viveahi, @tel, @sexo, CONVERT( DATETIME, 'N'+@fechnac, 121)) -- No es necesario CONVERT aqu�
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		SET @error = CASE
						WHEN ERROR_MESSAGE() LIKE '%CK_habitante_viveahi%' THEN 'Valor incorrecto para el campo viveahi. Los valores posibles son S y N.'
						ELSE ERROR_MESSAGE()
						END
		ROLLBACK TRAN;
		SET @exito = 0
	END CATCH
END
