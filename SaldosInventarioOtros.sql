select  * 
update a set norden = 'S/L'
from InvdetDocumentos a
where ccodarticulo = '1155'
and norden = 'SIN LOTE'

select  * 
--UPDATE A SET norden_origen = norden
--UPDATE A SET norden = ''
from Invmovimientos A
where ccodarticulo = '1155'
and ccompania = '01'
and cbodega = '01'
order by nconsecutivo desc

and (isnull(norden,'') = ''
	or isnull(norden,'') = 'SIN LOTE'
)


select  * 
from Invmovimientos A
where ccodarticulo = '1155'
and ccompania = '01'
and cbodega = '01'
order by nconsecutivo desc



select  sum(case when cinvafecta ='AUMENTA' THEN 1 ELSE - 1 END * ncantidad )
		,ccodarticulo,NORDEN,cbodega
from Invmovimientos A
where ccodarticulo = '1155'
and ccompania = '01'
and cbodega = '01'

GROUP by ccodarticulo,NORDEN,cbodega
