SELECT  * FROM [TSFAdmin].DBO.TSFSistema
WHERE SISTEMA LIKE 'INV45'
AND VERSION  = 3



insert into [TSFAdmin].DBO.Sistema_Opcion (compania,sistema,menu,formulario,opcion,descripcion,pin,orden,plataforma,Formulario_Web	,Controlador,Codigo)
SELECT 	'17-0000001' compania,sistema,menu,formulario,opcion,descripcion,pin,orden,plataforma,Formulario_Web	,Controlador,Codigo		
 FROM [TSFAdmin].DBO.Sistema_Opcion
WHERE SISTEMA LIKE '%INV45%'
 and  compania in( '23-0000021' ,'17-0000001')


--17-0000001
SELECT * FROM [TSFAdmin].DBO.GENCOMPA
where compania in( '23-0000021' ,'17-0000001')


--SELECT * FROM [TSFAdmin].DBO.Sistema_Cliente
--WHERE SISTEMA LIKE '%INV45%'
--and compania in( '23-0000021' ,'17-0000001')

INSERT INTO [TSFAdmin].[dbo].[Sistema_Cliente]
SELECT [Cliente]
      ,'17-0000001' [Compania]
      ,[Sistema]
      ,[Fecha_Crea]
      ,[Usuario_Crea]
      ,[Fecha_Modifica]
      ,[Usuario_Modifica]
  FROM [TSFAdmin].[dbo].[Sistema_Cliente]
  WHERE COMPANIA in( '23-0000021' ,'17-0000001')
  AND SISTEMA LIKE '%INV45%'



--SELECT * FROM [TSFAdmin].DBO.GenSistema
--WHERE SISTEMA LIKE '%INV45%'
--and compania in( '23-0000021' ,'17-0000001')




INSERT INTO [TSFAdmin].[dbo].[GenSistema]
SELECT  '17-0000001' [Compania]
      ,[Sistema]
      ,[Nombre]
      ,[Plataforma]
      ,[Orden]
      ,[Imagen]
      ,[Mostrar]
      ,[Desabilitar]
      ,[Ingreso]
      ,[Direccion]
      ,[Uri_Direccion_WS_GEN]
      ,[Uri_Direccion_WS_SEG]
      ,[Uri_Direccion_WS_INT]
      ,[Uri_Direccion_WS_NOM]
      ,[Nombre_Corto]
      ,[Tipo_Orden_Menu]
      ,[Siglas_Mostrar]
      ,0 [Instalacion_Local]
      ,[Ind_Self]
  FROM [TSFAdmin].[dbo].[GenSistema]
WHERE SISTEMA LIKE '%INV45%'
and compania in( '23-0000021' ,'17-0000001')