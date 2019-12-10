--TAREAS  --
--CREAR TABLAS -- OK
--TRASLADAR DATOS-- OK
--ASIGNAR PERMISOS-- OK
--PROBAR ACCESP EN ETIPLAST-- OK
--PAGINA EN CONSTRUCCION-- OK
--PANTALLA DE TIPOS DE COSTO-- OK
--ESTA DEJANDO APLICAR SIN HABER INGRESADO DATOS DE LOS ARTICULOS. No deja seleccionar la opcion de pendiente


SELECT  * 
FROM SYS.TABLES A
WHERE A.NAME LIKE 'CPR%'
 
INSERT INTO CPR_OrdenCompra_Estado  
          SELECT 1	,'Pendiente'
UNION ALL SELECT 2	,'Aplicada'
UNION ALL SELECT 3	,'Cancelada'
UNION ALL SELECT 4	,'Borrada'
UNION ALL SELECT 5	,'Entregada'
UNION ALL SELECT 6	,'Aduanas'


INSERT INTO CPR_OrdenCompra_Formato
          SELECT '02',			1		,'Importación',	'Rep_Cap_OrdenCompra_Importacion.rpt'
UNION ALL SELECT '02',			2		,'Local',		'Rep_Cap_OrdenCompra_Local.rpt'


INSERT INTO CPR_OrdenCompra_Tipo (Compania	,Codigo,	Nombre,	Formato_Reporte	,Observacion,Ind_Destino,Ind_Termino_Comercial,Ind_Transporte,Ind_Entrega_Estimada)
          SELECT '02',1,'Importacion',1,'observacion',1,1,1,0
UNION ALL SELECT  '02',2,'Local',	2,	'Observcion',1,0,0,1

INSERT INTO CPR_TerminoComercial (Codigo,Nombre,Observacion,Estado)
SELECT 1,	'CIF',	'Observacion',	1

INSERT INTO CPR_TipoCosto
SELECT  * FROM CPR_TipoCosto_bk

INSERT INTO CPR_Transporte_Tipo (Codigo	,Nombre	,Estado)
			SELECT 1,	'Aereo',	1
UNION ALL	SELECT 2,	'Maritimo',	1


--[TSFSistema]  --**OK
--[TSFSistema_Opcion]  --**OK
--[Sistema_Opcion] --**OK
--[GenSistema]

--INSERT INTO [TSFAdmin].[dbo].[GenSistema]
--SELECT '5-00000001'  [Compania]
--      ,[Sistema]
--      ,[Nombre]
--      ,[Plataforma]
--      ,[Orden]
--      ,[Imagen]
--      ,[Mostrar]
--      ,[Desabilitar]
--      ,[Ingreso]
--      ,[Direccion]
--      ,[Uri_Direccion_WS_GEN]
--      ,[Uri_Direccion_WS_SEG]
--      ,[Uri_Direccion_WS_INT]
--      ,[Uri_Direccion_WS_NOM]
--      ,[Nombre_Corto]
--      ,[Tipo_Orden_Menu]
--      ,[Siglas_Mostrar]
--      ,[Instalacion_Local]
--      ,[Ind_Self]
--  FROM [TSFAdmin].[dbo].[GenSistema]
--  WHERE SISTEMA = 'CPR45'


--INSERT INTO [TSFAdmin].[dbo].[Sistema_Cliente]
--SELECT  [Cliente]
--      ,[Compania]
--      ,'CPR45'[Sistema]
--      ,[Fecha_Crea]
--      ,[Usuario_Crea]
--      ,[Fecha_Modifica]
--      ,[Usuario_Modifica]
--  FROM [TSFAdmin].[dbo].[Sistema_Cliente]
--  WHERE COMPANIA = '5-00000001'
--  AND Sistema  = 'COM45'


--  /****** Script for SelectTopNRows command from SSMS  ******/
--INSERT INTO [TSFAdmin].[dbo].[GenSistema]
SELECT TOP 1000 [Compania]
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
      ,[Instalacion_Local]
      ,[Ind_Self]
  FROM [TSFAdmin].[dbo].[GenSistema]
  WHERE SISTEMA = 'CPR45'


  --crear tablas
  --INVTipoDocumentos
  --INVTipoDocumentosCuentas 
  --INVArticuloEmpaque
  --INVTipoDocumeUsuarios
  --BORRAR REFERENCIA DE TABLAS DE [CPR_OrdenCompra_Tipo] Y [CPR_OrdenCompra_Formato]



  
INSERT INTO INVTipoDocumentos
SELECT  [ccodigo]
      ,[ccompania]
      ,[cnombre]
      ,[ind_movimiento]
      ,[ind_edita]
      ,[ind_activo]
      ,[cUsuarioRegistra]
      ,[dFechaRegistra]
      ,[cUsuarioModifica]
      ,[dFechaModifica]
      ,[nTipoDocume]
      ,[indMontoManual]
      ,[nConsecutivo]
      ,[indModifica]
      ,[indMovSinExistencia]
      ,[cCodigoCuentaContable]
      ,[indReservadoAuxiliar]
      ,[indCuentasAutomaticas] 
  FROM [dbo].[INVTipoDocumentos201911]
  WHERE ccompania = '01'

UPDATE A SET ESTADO = 1
FROM [dbo].CPR_OrdenCompra_Tipo a