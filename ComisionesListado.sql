
/****** Object:  StoredProcedure [dbo].[PAE_COMComisiones]    Script Date: 12/6/2019 2:06:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--GRANT EXECUTE ON PAE_COMAplicacion TO PUBLIC 

ALTER PROCEDURE [dbo].[PAE_COMComisiones]
	@pc_CodCompania VARCHAR(10),	
	@vlcUsuario VARCHAR(50),
	@pvnVendedor INT,
	@pvnDiasVence INT,
	@pvnPorc_Cobro DECIMAL(18,4),
	@pvnPorc_Venta DECIMAL(18,4)
AS 
BEGIN	
	
	BEGIN TRY
		DECLARE @vlnTipo INT
		SELECT @vlnTipo = nTipoComision FROM ComParametros WHERE cCompania = @pc_CodCompania

		DELETE FROM ComComisiones WHERE cCompania = @pc_CodCompania AND cCodigo = @pvnVendedor  and ntipo = @vlnTipo 
		
		INSERT INTO ComComisiones 
			(cCompania, cCodigo, ntipo, ncobracancelados, ndiascancelada, cusuariocrea, 
			dfechacreado, cusuariomodifica, dfechamodifica ,nDiasVencida) 
		VALUES 
			(@pc_CodCompania, @pvnVendedor, @vlnTipo, 1,  @pvnDiasVence , @vlcUsuario, 
			getdate(), @vlcUsuario, getdate(), @pvnDiasVence  )
		
		UPDATE GENVendedores SET nDiasVencida = @pvnDiasVence , nporc_comision = @pvnPorc_Cobro 
		WHERE cCodigo =  @pvnVendedor 

		--*********************************************************************************************
		--** Grabar Detalle de Comisiones
		DELETE FROM ComDetComisiones 
		WHERE cCodVend = @pvnVendedor And cCompania = @pc_CodCompania 
		
		INSERT INTO  ComDetComisiones  
					(cCompania,		cCodVend,		cCodigo, nPromedioCobro, nPromedioVenta, nNoPaga) 
		SELECT		@pc_CodCompania,@pvnVendedor,	cCodigo, @pvnPorc_Cobro, @pvnPorc_Venta, 0 
		FROM INVFamilias
		WHERE cCompania = @pc_CodCompania
	
		SELECT 1 Resultado,'Guardado exitósamente' Mensaje
	END TRY	
	BEGIN CATCH
		SELECT  1 Resultado,ERROR_MESSAGE()  Mensaje
			 
	END CATCH
END 


