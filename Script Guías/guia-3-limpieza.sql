--=======================================================
-- JEAN CARLOS HERNÁNDEZ BENAVIDES 217034199
--=======================================================
--=======================================================
-- LIMPIEZA DE DATOS
--=======================================================
-- Crear la tabla saberpro_limpio a partir de la tabla saberpro_2012_2014
create table saberpro_limpio as select * from saberpro_2012_2014;
-- SELECT 720856
-- Consulta retornó exitosamente en 8 min 555 secs.
-- =========================================================
/*
Reemplazar los valores ‘EK20123’, EK20133’,’EK20142’,’EK20143 y ‘EKO2014’
del atributo estu_cod_aplicacion por ‘EK20122’,’EK20132’,’EK20141’, EK20142’ y EK20141
respectivamente:
*/
begin;
update saberpro_limpio set estu_cod_aplicacion= case
when estu_cod_aplicacion='EK20123' then 'EK20122'
when estu_cod_aplicacion='EK20133' then 'EK20132'
when estu_cod_aplicacion='EK20142' then 'EK20141'
when estu_cod_aplicacion='EK20143' then 'EK20142'
when estu_cod_aplicacion='EKO2014' then 'EK20141'
else estu_cod_aplicacion
end;
-- UPDATE 720856
-- Consulta retornó exitosamente en 2 min 46 secs.
-- rollback;
select distinct estu_cod_aplicacion from saberpro_limpio order by 1;
commit;
-------------------------------------------------------------------
/*
Reemplazar los valores ‘20123’,20133’,’20142’,’20143 y ‘O2014’ del atributo
prueba por ‘20122’,’20132’,’20141’,20142’ y 20141 respectivamente:
*/
begin;
update saberpro_limpio set prueba= case
when prueba='20123' then '20122'
when prueba='20133' then '20132'
when prueba='20142' then '20141'
when prueba='20143' then '20142'
when prueba='O2014' then '20141'
else prueba
end;
-- UPDATE 720856
-- Consulta retornó exitosamente en 2 min 35 secs.
select distinct prueba from saberpro_limpio order by 1;
commit;
-----------------------------------------------------------
/*
3. Reemplazar los valores nulos del atributo estu_genero por la moda de este atributo
en saberpro_2012_2014
*/
begin;
-- 1 forma
/*
update saberpro_limpio set estu_genero=
(select t1.genero from
 (select estu_genero as genero,count(*) from saberpro_2012_2014 group by 1 order by 2 desc limit 1) as t1)
 where estu_genero is null;
-- rollback;
-- UPDATE 2653
-- Consulta retornó exitosamente en 46 secs 290 msec.
*/
-- 2 forma- Utilizar la funcion mode() 
update saberpro_limpio set estu_genero=
(select mode() within group (order by estu_genero) from saberpro_2012_2014)
 where estu_genero is null;
select estu_genero as genero,count(*) from saberpro_Limpio group by 1 order by 2 desc; 
commit;
-----------------------------------------------------------------------------
/*
4.Reemplazar los valores nulos del atributo estu_nacimiento_dia 
por la moda de este atributo en la tabla saberpro_2012_2014.
*/
begin;
update saberpro_limpio set estu_nacimiento_dia=
(select mode() within group (order by estu_nacimiento_dia ) from saberpro_2012_2014)
 where estu_nacimiento_dia  is null;
-- UPDATE 3145
-- Consulta retornó exitosamente en 24 secs 514 msec.
select estu_nacimiento_dia,count(*) from saberpro_limpio group by 1 order by 2 desc;
--rollback
commit;
----------------------------------------------------------------------------------
/*
5. Reemplazar el valor ‘5’ del atributo estu_nacimiento_dia por ‘05’
*/
begin;
update saberpro_limpio set estu_nacimiento_dia='05' where estu_nacimiento_dia='5';
-- UPDATE 0
-- Consulta retornó exitosamente en 16 secs 867 msec.
commit;
-----------------------------------------------------------------------------------
/*
6. Reemplazar los valores nulos del atributo estu_nacimiento_mes 
por la moda de este atributo en la tabla saberpro_2012_2014.
*/
begin;
update saberpro_limpio set estu_nacimiento_mes=
(select mode() within group (order by estu_nacimiento_mes ) from saberpro_2012_2014)
 where estu_nacimiento_mes  is null;
-- UPDATE 3145
-- Consulta retornó exitosamente en 8 secs 804 msec.
select estu_nacimiento_mes,count(*) from saberpro_limpio group by 1 order by 2 desc;
--rollback
commit;
-----------------------------------------------------------------------------------
/*
7. Reemplazar los valores nulos del atributo estu_nacimiento_anno por la moda de este atributo
en los respectivos años de las pruebas 2012, 2013 y 2014.
*/
-- 2012
begin;
update saberpro_limpio set estu_nacimiento_anno=
(select mode() within group (order by estu_nacimiento_anno ) from saberpro_2012_2014 where prueba like '2012_')
 where estu_nacimiento_anno  is null and prueba like '2012_' ;
-- UPDATE 1374
-- Consulta retornó exitosamente en 1 min 57 secs. 
select estu_nacimiento_anno,count(*) from saberpro_limpio where prueba like '2012_' group by 1 order by 2 desc;
--rollback
commit;
-- 2013
begin;
update saberpro_limpio set estu_nacimiento_anno=
( select mode() within group (order by estu_nacimiento_anno ) from saberpro_2012_2014 where prueba like '2013_')
 where estu_nacimiento_anno  is null and prueba like '2013_' ;
-- UPDATE 524
-- Consulta retornó exitosamente en 10 secs 662 msec. 
select estu_nacimiento_anno,count(*) from saberpro_limpio where prueba like '2013_' group by 1 order by 2 desc;
--rollback
commit;
--- 2014
begin;
update saberpro_limpio set estu_nacimiento_anno=
(select mode() within group (order by estu_nacimiento_anno ) from saberpro_2012_2014 where prueba like '2014_')
 where estu_nacimiento_anno  is null and prueba like '2014_' ;
-- UPDATE 1247
-- Consulta retornó exitosamente en 20 secs 767 msec.
select estu_nacimiento_anno,count(*) from saberpro_limpio where prueba like '2014_' group by 1 order by 2 desc;
--rollback
commit;
-----------------------------------------------------------------------------
/* proceso inverso: restaurar los valores en saberpro_limpio antes del ajuste anterior
begin;
create index idx_estuconsecutivo1 on saberpro_2012_2014(estuconsecutivo);
create index idx_estuconsecutivo2 on saberpro_limpio(estuconsecutivo);
update saberpro_limpio set estu_nacimiento_anno=
(select t2.estu_nacimiento_anno from saberpro_2012_2014 t2 
where saberpro_limpio.estuconsecutivo=t2.estuconsecutivo);
-- UPDATE 720856
-- Consulta retornó exitosamente en 47 secs 601 msec.
select estu_nacimiento_anno,count(*) from saberpro_limpio group by 1 order by 2 desc;
commit;
*/
-----------------------------------------------------------------------------------
/*
8. Reemplazar los valores nulos del atributo estu_pais_reside por ‘COLOMBIA’
*/
begin;
update saberpro_limpio set estu_pais_reside='COLOMBIA'  where estu_pais_reside is null;
--UPDATE 223375
-- Consulta retornó exitosamente en 9 secs 409 msec.
commit;
------------------------------------------------------------------------------
/*
9. Reemplazar los valores ‘CO’ del atributo estu_pais_reside por ‘COLOMBIA’
*/
begin;
update saberpro_limpio set estu_pais_reside='COLOMBIA'  where estu_pais_reside like 'CO';
-- UPDATE 497463
-- Consulta retornó exitosamente en 1 min 35 secs.
commit;
-----------------------------------------------------------------------------
/*
10. Reemplazar los valores nulos del atributo estu_estado_civil por la moda de este atributo.
*/
begin;
update saberpro_limpio set estu_estado_civil=
(select mode() within group (order by estu_estado_civil ) from saberpro_2012_2014)
 where estu_estado_civil  is null;
-- UPDATE 3056
-- Consulta retornó exitosamente en 1 min 10 secs.
select estu_estado_civil,count(*) from saberpro_limpio group by 1 order by 2 desc;
--rollback
commit;
------------------------------------------------------------------------------------------
/*
11. Reemplazar los valores nulos del atributo estu_reside_codmpio
por los valores del atributo estu_exam_codmpio_presentacion.
*/
begin;
update saberpro_limpio set estu_reside_codmpio=estu_exam_codmpio_presentacion
where estu_reside_codmpio is null;
-- UPDATE 1380
-- Consulta retornó exitosamente en 9 secs 574 msec.
select count(*) from saberpro_limpio where estu_reside_codmpio is null;
commit;
------------------------------------------------------------------------------------
/*
12. Estandarizar el valor del atributo 
estu_exam_mpio_presentacion de “BOGOTÁ D.C.” por el valor “BOGOTA D.C”.
*/
update saberpro_limpio set estu_exam_mpio_presentacion='BOGOTA D.C.' where estu_exam_mpio_presentacion like 'BOGOTÁ D.C.';
-- UPDATE 262480
-- Consulta retornó exitosamente en 1 min 8 secs.
select distinct estu_exam_mpio_presentacion from saberpro_limpio where estu_exam_mpio_presentacion like 'BOG%'
--------------------------------------------------------------------------------------------
/*
13. Estandarizar el valor del atributo estu_exam_dpto_presentacion de “BOGOTÁ” por el valor BOGOTA,
"BOYACÁ" por BOYACA, CAQUETÁ por CAQUETA,
"ATLÁNTICO" por ATLANTICO, “CHOCÓ” por CHOCO, 
“CÓRDOBA” por CORDOBA,” SAN ANDRÉS” por SAN ANDRES,
“VAUPÉS” por VAUPES, “QUINDÍO” por QUINDIO, 
“GUAINÍA” por GUANIA,” BOLÍVAR” por BOLIVAR,
*/
begin;
update saberpro_limpio set estu_exam_dpto_presentacion= case
when estu_exam_dpto_presentacion like 'BOGOTÁ' then 'BOGOTA'
when estu_exam_dpto_presentacion like 'BOYACÁ' then 'BOYACA'
when estu_exam_dpto_presentacion like 'CAQUETÁ' then 'CAQUETA'
when estu_exam_dpto_presentacion like 'ATLÁNTICO' then 'ATLANTICO'
when estu_exam_dpto_presentacion like 'CHOCÓ' then 'CHOCO'
when estu_exam_dpto_presentacion like 'CÓRDOBA' then 'CORDOBA'
when estu_exam_dpto_presentacion like 'SAN ANDRÉS' then 'SAN ANDRES'
when estu_exam_dpto_presentacion like 'VAUPÉS' then 'VAUPES'
when estu_exam_dpto_presentacion like 'QUINDÍO' then 'QUINDIO'
when estu_exam_dpto_presentacion like 'GUAINÍA' then 'GUAINIA'
when estu_exam_dpto_presentacion like 'BOLÍVAR' then 'BOLIVAR'
else estu_exam_dpto_presentacion
end;
-- rollback
-- UPDATE 720856
-- Consulta retornó exitosamente en 2 min 45 secs.
select estu_exam_dpto_presentacion,count(*) from saberpro_limpio group by 1 order by 2 desc;
commit;
-------------------------------------------------------------------------------------
/*
14.Reemplazar los valores nulos del atributo estu_exam_cod por 141 para la prueba 20141 
y por 142 para la prueba 20142.
*/

--- 20141
begin;
update saberpro_limpio set estu_exam_cod= '141' where estu_exam_cod is null and prueba like '20141' ;
-- UPDATE 12240
-- Consulta retornó exitosamente en 12 secs 309 msec.
select estu_exam_cod,count(*) from saberpro_limpio where prueba like '20141' group by 1 order by 2 desc;
--rollback
commit;

--- 20142
begin;
update saberpro_limpio set estu_exam_cod= '142' where estu_exam_cod is null and prueba like '20142';
-- UPDATE 209726
-- sulta retornó exitosamente en 38 secs 233 msec.
select estu_exam_cod,count(*) from saberpro_limpio where prueba like '20142' group by 1 order by 2 desc;
--rollback
commit;

-------------------------------------------------------------------------------------
/*15. Reemplazar los valores nulos del atributo estu_exam_nombre por EXAMEN SABER PRO 2014-1 para la prueba 20141
y por EXAMEN SABER PRO 2014-2 para la prueba 20142.*/

begin;
update saberpro_limpio set (estu_exam_cod,estu_exam_nombre)=('141','EXAMEN SABER PRO 2014-1')
where prueba like '20141' and (estu_exam_cod is null or estu_exam_nombre is null) ;
-- UPDATE 12240
-- Consulta retornó exitosamente en 53 secs 533 msec.
update saberpro_limpio set (estu_exam_cod,estu_exam_nombre)=('142','EXAMEN SABER PRO 2014-2')
where prueba like '20142' and (estu_exam_cod is null or estu_exam_nombre is null) ;
-- UPDATE 209726
-- Consulta retornó exitosamente en 50 secs 262 msec.
-- rollback;
select estu_exam_cod,estu_exam_nombre,count(*) from saberpro_limpio 
where prueba like '2014_' group by 1,2 order by 2 desc;
commit;
--------------------------------------------------------------------------------------
/*
16. Estandarizar los nombres de las instituciones del atributo inst_nombre_institucion, el origen inst_origen
el caracter academico  inst_caracter_academico a partir de los nombres, origen
y caracter academico de las instituciones de la tabla IES teniendo en cuenta los códigos de las instituciones
*/
begin;
update saberpro_limpio set (inst_nombre_institucion,inst_origen,inst_caracter_academico)=
(select inst_nombre_institucion,inst_origen,inst_caracter_academico from ies where inst_cod_institucion=cod_ies);
-- UPDATE 720856
-- Consulta retornó exitosamente en 2 min 39 secs.
select * from ies;
select inst_cod_institucion,inst_nombre_institucion,inst_origen,inst_caracter_academico,count(*) from saberpro_limpio 
group by 1,2,3,4 order by 1 desc;
-- rollback
commit;
--------------------------------------------------------------------------------
-- Con esto se solucionan los puntos de la antigua guia 17,18,19,20,21 anterior
---------------------------------------------------------------------------------
/*
17. Reemplazar los valores nulos del atributo inst_origen por el código ‘4’ 
para las instituciones o escuelas normal superior

begin;
update saberpro_limpio set inst_origen='4' 
where inst_nombre_institucion like '%NORMAL%' and inst_origen is null;
-- UPDATE 11426
-- Consulta retornó exitosamente en 1 secs 951 msec.
select inst_nombre_institucion,inst_origen,count(*) from saberpro_limpio
where inst_nombre_institucion like '%NORMAL%' group by 1,2 order by 3;
commit;
--------------------------------------------------------------------------------
/*
18. Reemplazar los valores nulos del atributo inst_origen de saberpro_limpio
por los valores del atributo inst_origen de la tabla IES  
teniendo en cuenta los códigos de las instituciones
*/
begin;
update saberpro_limpio set inst_origen=
(select t2.inst_origen from ies t2 where inst_cod_institucion=t2.cod_ies
)
where inst_origen is null;
--rollback
--UPDATE 176
--Consulta retornó exitosamente en 676 msec.
select inst_cod_institucion,inst_nombre_institucion,inst_origen,count(*) from saberpro_limpio
group by 1,2,3 order by 1 desc;
commit;
*/
--------------------------------------------------------------------------------
/* Numeral de la nueva guia
17. Reemplazar los valores nulos del atributo estu_nivel_prgm_academico 
por el valor no nulo del atributo estu_nivel_prgm_academico de los programas 
iguales de la misma institución
*/
begin;
update saberpro_limpio set estu_nivel_prgm_academico=
(select estu_nivel_prgm_academico from saberpro_2012_2014 t2 where
 estu_prac_id_prgrm_academico=t2.estu_prac_id_prgrm_academico and
 inst_cod_institucion=t2.inst_cod_institucion and t2.estu_nivel_prgm_academico is not null limit 1)
where estu_nivel_prgm_academico is null;
-- UPDATE 221966
-- Consulta retornó exitosamente en 51 secs 660 msec.
--
select 
t1.estu_prac_id_prgrm_academico,t1.estu_nivel_prgm_academico,t1.inst_cod_institucion,
t2.estu_prac_id_prgrm_academico,t2.estu_nivel_prgm_academico,t2.inst_cod_institucion
from saberpro_limpio t1 join saberpro_2012_2014 t2 on t1.inst_cod_institucion=t2.inst_cod_institucion
and t1.estu_prac_id_prgrm_academico=t2.estu_prac_id_prgrm_academico
where t1.estu_nivel_prgm_academico is null and t2.estu_nivel_prgm_academico is not null limit 1000;
--
commit;
---------------------------------------------------------------------------------------------------------
/*
18. Reemplazar los valores nulos del atributo estu_nivel_prgm_academico 
por “UNIVERSITARIA” para aquellas instituciones cuyo nombre inst_nombre_institucion inicie con “UNIVERSIDAD”
*/
update saberpro_limpio set estu_nivel_prgm_academico='UNIVERSITARIA' 
where inst_nombre_institucion like 'UNIVERSIDAD%' and estu_nivel_prgm_academico is null;
-- UPDATE 0
-- Consulta retornó exitosamente en 19 secs 17 msec.

select distinct estu_prgm_academico,estu_nivel_prgm_academico,inst_nombre_institucion,inst_caracter_academico 
from saberpro_limpio where inst_nombre_institucion like 'UNIVERSIDAD%'
-------------------------------------------------------------------------------------------------------
/*
19. Reemplazar los valores nulos del atributo estu_nivel_prgm_academico por
“UNIVERSITARIA” para aquellos programas cuyo nombre
estu_prgm_academico contengan las palabras INGENIERIA, DERECHO,
MEDICINA, ODONTOLOGIA, CONTADURIA, LICENCIATURA,PSICOLOGIA
ARQUITECTURA, ECOLOGIA, FISIOTERAPIA, ZOOTECNIA,
ADMINISTRACIÓN, DISEÑO, SOCIAL, PUBLICIDAD, INTERNACIONAL,
ARTES, PERIODISMO, GASTRONOMÍA, CIENCIA, TERAPIA, SALUD
*/
--gin;
--select * from saberpro_limpio;
begin;
update saberpro_limpio set estu_nivel_prgm_academico='UNIVERSITARIA' 
where estu_prgm_academico like '%INGENIERIA%' or
 estu_prgm_academico like '%DERECHO%' or
 estu_prgm_academico like '%MEDICINA%' or
 estu_prgm_academico like '%ODONTOLOGIA%' or
 estu_prgm_academico like '%CONTADURIA%' or
 estu_prgm_academico like '%LICENCIATURA%' or
 estu_prgm_academico like '%PSICOLOGIA%' or
 estu_prgm_academico like '%ARQUITECTURA%' or
 estu_prgm_academico like '%ECOLOGIA%' or
 estu_prgm_academico like '%FISIOTERAPIA%' or
 estu_prgm_academico like '%ZOOTECNIA%' or
 estu_prgm_academico like '%ADMINISTRACIÓN%' or
 estu_prgm_academico like '%DISEÑO%' or
 estu_prgm_academico like '%SOCIAL%' or
 estu_prgm_academico like '%PUBLICIDAD%' or
 estu_prgm_academico like '%INTERNACIONAL%' or
 estu_prgm_academico like '%ARTES%' or
 estu_prgm_academico like '%PERIODISMO%' or
 estu_prgm_academico like '%GASTRONOMÍA%' or
 estu_prgm_academico like '%CIENCIA%' or
 estu_prgm_academico like '%TERAPIA%' or
 estu_prgm_academico like '%SALUD%' and estu_nivel_prgm_academico is null;
-- UPDATE 470458
-- Consulta retornó exitosamente en 1 min 36 secs.
-- rollback;
commit;

-------------------------------------------------------------------------------------------------------
/*
20. Reemplazar los valores del atributo estu_nivel_prgm_academico por
“TECNOLOGIA” para aquellos programas cuyo nombre estu_prgm_academico
inicie con la palabra ‘TECNOLOGÍA’ o ‘TECNOLOGIA’
*/
begin;
update saberpro_limpio set estu_nivel_prgm_academico= case
when estu_prgm_academico like 'TECNOLOGÍA%' then 'TECNOLOGIA'
when estu_prgm_academico like 'TECNOLOGIA%' then 'TECNOLOGIA'
else estu_nivel_prgm_academico
end;
-- UPDATE 45966
-- Consulta retornó exitosamente en 15 secs 819 msec.
--rollback;
select estu_nivel_prgm_academico, estu_prgm_academico from saberpro_limpio
where estu_prgm_academico like 'TECNOLOGÍA%' or estu_prgm_academico like 'TECNOLOGIA%';
commit;

-------------------------------------------------------------------------------------------------------
/*
21. Reemplazar los valores del atributo estu_nivel_prgm_academico por “TECNICO”
para aquellos programas cuyo nombre estu_prgm_academico inicie con la palabra
‘TECNICO’, ‘TÉCNICO’,’TÉCNICA’,’TECNICA’
*/
begin;
update saberpro_limpio set estu_nivel_prgm_academico= case
when estu_prgm_academico like 'TECNICO%' then 'TECNICO'
when estu_prgm_academico like 'TÉCNICO%' then 'TECNICO'
when estu_prgm_academico like 'TÉCNICA%' then 'TECNICO'
when estu_prgm_academico like 'TECNICA%' then 'TECNICO'
else estu_nivel_prgm_academico
end;
-- UPDATE 29841
-- Consulta retornó exitosamente en 1 min 58 secs.
--rollback;
select estu_nivel_prgm_academico, estu_prgm_academico from saberpro_limpio
where estu_prgm_academico 
like 'TECNICO%' or estu_prgm_academico like 'TÉCNICO%' or estu_prgm_academico like 'TÉCNICA%' or estu_prgm_academico like 'TECNICA%';
commit;


-------------------------------------------------------------------------------------------------------
/*
22. Reemplazar los valores nulos del atributo estu_metodo_prgm por el valor no nulo del
atributo estu_metodo_prgm de la institución con igual código (inst_cod_institucion)
o nombre (inst_nombre_institucion), y de los programas del mismo
código(estu_prac_id_prgrm_academico) o nombre (estu_prgm_academico)
*/
begin;
update saberpro_limpio set estu_metodo_prgm = (UPPER(estu_metodo_prgm))
commit;

--update saberpro_limpio set estu_metodo_prgm=
--(select estu_metodo_prgm,inst_nombre_institucion,inst_origen,inst_caracter_academico from ies where inst_cod_institucion=cod_ies);


-------------------------------------------------------------------------------------------------------
/*
23. Reemplazar los valores nulos del atributo estu_metodo_prgm por los valores del
atributo metodología de la tabla programas_ies teniendo en cuenta los códigos de las
instituciones y de los programas
*/
begin;
update saberpro_limpio set estu_metodo_prgm=case
when metodologia from programas_ies like 'TECNICA%' then 'TECNICO'
else estu_nivel_prgm_academico
end;
commit;
select estu_metodo_prgm from saberpro_limpio;

-------------------------------------------------------------------------------------------------------
/*
24. Reemplazar los 2 restantes valores nulos del atributo estu_metodo_prgm por la moda
‘PRESENCIAL’
*/


-------------------------------------------------------------------------------------------------------
/*
25. Estandarizar los valores del atributo estu_metodo_prgm en mayúsculas;
*/
begin;
update saberpro_limpio set estu_metodo_prgm = (UPPER(estu_metodo_prgm))
commit;

--update saberpro_limpio set (inst_nombre_institucion,inst_origen,inst_caracter_academico)=
--(select inst_nombre_institucion,inst_origen,inst_caracter_academico from ies where inst_cod_institucion=cod_ies);

select estu_metodo_prgm from saberpro_limpio;

-------------------------------------------------------------------------------------------------------
/*
26. Reemplazar los valores nulos del atributo dipo_codigomunicipio por los valores del
atributo estu_exam_codmpio_presentacion:
*/
begin;
update saberpro_limpio set dipo_codigomunicipio=estu_exam_codmpio_presentacion
where dipo_codigomunicipio is null;
-- UPDATE 720856
-- Consulta retornó exitosamente en 2 min 24 secs.
rollback;
commit;
select dipo_codigomunicipio from saberpro_limpio;

-------------------------------------------------------------------------------------------------------
/*
27. Reemplazar los valores nulos del atributo inst_cod_jornada por la moda “1” para los
nombres de instituciones que contengan la palabra ‘NORMAL’.
*/
begin;
update saberpro_limpio set inst_cod_jornada='1'
where inst_cod_jornada is null and inst_nombre_institucion like '%NORMAL%';
-- UPDATE 11426
-- Consulta retornó exitosamente en 13 secs 184 msec.
--rollback
commit;
select inst_cod_jornada,inst_nombre_institucion from saberpro_limpio where inst_nombre_institucion like '%NORMAL%';

-------------------------------------------------------------------------------------------------------
/*
28. Reemplazar los valores nulos del atributo inst_cod_jornada por la moda del resto de
instituciones que es ‘12’
*/
begin;
update saberpro_limpio set inst_cod_jornada='12'
where inst_cod_jornada is null;
-- UPDATE 709430
-- Consulta retornó exitosamente en 1 min 41 secs.
--rollback 
commit;
select inst_cod_jornada,inst_nombre_institucion from saberpro_limpio;


-------------------------------------------------------------------------------------------------------
/*
29. Reemplazar los valores nulos del atributo estu_area_conoc de saberpro_limpio, por
el valor no nulo del atributo estu_area_conoc de los programas del mismo nombre
(estu_prgm_academico) de la tabla saberpro_2012_2014
*/

begin;
update saberpro_limpio set estu_area_conoc=
(select estu_area_conoc from saberpro_2012_2014 t2 where
 estu_prgm_academico=t2.estu_prgm_academico and
 inst_cod_institucion=t2.inst_cod_institucion and t2.estu_area_conoc is not null limit 1)
where estu_area_conoc is null;
--UPDATE 221966
--Consulta retornó exitosamente en 49 secs 941 msec.
commit;

select estu_area_conoc from saberpro_limpio;

-------------------------------------------------------------------------------------------------------
/*
30. Reemplazar los valores nulos del atributo estu_nucleo_pregrado de saberpro_limpio,
por el valor no nulo del atributo estu_nucleo_pregrado de los programas del mismo
nombre (estu_prgm_academico) de la tabla saberpro_2012_2014
*/
begin;
update saberpro_limpio set estu_nucleo_pregrado=
(select estu_nucleo_pregrado from saberpro_2012_2014 t2 where
 estu_prgm_academico=t2.estu_prgm_academico and
 inst_cod_institucion=t2.inst_cod_institucion and t2.estu_nucleo_pregrado is not null limit 1)
where estu_nucleo_pregrado is null;
-- UPDATE 221966
-- Consulta retornó exitosamente en 55 secs 953 msec.
commit;

select estu_area_conoc from saberpro_limpio;

-------------------------------------------------------------------------------------------------------
/*
31. Reemplazar los valores nulos del atributo estu_cod_grupo_ref de saberpro_limpio,
por el valor no nulo del atributo estu_cod_grupo_ref de los grupos de referencia con
el nombre (estu_grupo_referencia) de la tabla saberpro_2012_2014
*/
begin;
update saberpro_limpio set estu_cod_grupo_ref=
(select estu_cod_grupo_ref from saberpro_2012_2014 t2 where
 estu_grupo_referencia=t2.estu_grupo_referencia and
 inst_cod_institucion=t2.inst_cod_institucion and t2.estu_cod_grupo_ref is not null limit 1)
where estu_cod_grupo_ref is null;
-- UPDATE 221966
-- Consulta retornó exitosamente en 1 min 10 secs.
commit;

select estu_area_conoc from saberpro_limpio ;

-------------------------------------------------------------------------------------------------------
/*
32. Actualizar en la tabla saberpro_limpio, el atributo estu_cod_grupo_ref utilizando en
algunos casos caracteres comodines “%” y “_” asi: (utilice select case when)
*/
select estu_cod_grupo_ref,estu_grupo_referencia from saberpro_limpio;
begin;
update saberpro_limpio set estu_cod_grupo_ref=case
when estu_grupo_referencia like 'BELLAS ARTES Y DISEÑO' then '1'
when estu_grupo_referencia like 'CIENCIAS NATURALES Y EXACTAS' then '2'
when estu_grupo_referencia like 'CIENCIAS SOCIALES' then '3'
when estu_grupo_referencia like 'HUMANIDADES' then '4'
when estu_grupo_referencia like 'DERECHO' then '5'
when estu_grupo_referencia like 'COMUNICACI_N, PERIODISMO Y PUBLICIDAD' then '6'
when estu_grupo_referencia like 'CIENCIAS MILITARES Y NAVALES' then '7'
when estu_grupo_referencia like '%CIENCIAS AGROPECUARIAS%' then '8'
when estu_grupo_referencia like '%ADMINISTRACI_N%' then '9'
when estu_grupo_referencia like 'EDUCACI_N' then '10'
when estu_grupo_referencia like 'ARQUITECTURA Y URBANISMO' then '11'
when estu_grupo_referencia like 'INGENIER_A' then '12'
when estu_grupo_referencia like '%SALUD%' then '13'
when estu_grupo_referencia like 'MEDICINA' then '14'
when estu_grupo_referencia like '%INGENIER_A, INDUSTRIA Y MINAS%' then '15'
when estu_grupo_referencia like '%TIC%' then '17'
when estu_grupo_referencia like '%ARTES - DISEÑO – COMUNICACI_N%' then '19'
when estu_grupo_referencia like '%CIENCIAS AGROPECUARIAS%' then '20'
when estu_grupo_referencia like 'NORMALES SUPERIORES' then '27'
when estu_grupo_referencia like '%JUDICIAL%' then '28'
when estu_grupo_referencia like '%MILITAR Y POLICIAL%' then '29'
when estu_grupo_referencia like 'RECREACI_N Y DEPORTES' then '30'
when estu_grupo_referencia like '%ECONOM%' then '31'
when estu_grupo_referencia like '%CONTADUR_A%' then '32'
when estu_grupo_referencia like 'PSICOLOG_A' then '33'
when estu_grupo_referencia like 'ENFERMER_A' then '34'
when estu_grupo_referencia like 'GRUPO REFERENCIA NACIONAL%' then '42'
else estu_cod_grupo_ref
end;
-- UPDATE 720856
-- Consulta retornó exitosamente en 2 min 24 secs.
commit;

-------------------------------------------------------------------------------------------------------

/*
33.	Reemplazar los nulos del atributo estu_semestre_cursa por la moda (de las NORMALES) del 
atributo estu_semestre_cursa de la tabla saberpro_2012_2014, 
para los nombres de instituciones que contengan la palabra ‘NORMAL’.
*/
begin;
update saberpro_limpio set estu_semestre_cursa=
(select mode() within group (order by estu_semestre_cursa) from saberpro_2012_2014 
 where inst_nombre_institucion like '%NORMAL%')
 where inst_nombre_institucion like '%NORMAL%' and estu_semestre_cursa is null;
-- UPDATE 0
-- Consulta retornó exitosamente en 1 min 4 secs.
select estu_semestre_cursa,count(*) from saberpro_limpio  where inst_nombre_institucion like '%NORMAL%'
group by 1 order by 2 desc;
commit;
------------------------------------------------------------------------------------------
/*
34.	Reemplazar los valores nulos del atributo estu_semestre_cursa de saberpro_limpio, 
por el valor no nulo del atributo estu_semestre_cursa 
de la tabla saberpro_2012_2014 de igual instituciones con los mismos programas
*/
begin;
update saberpro_limpio set estu_semestre_cursa=
(select t2.estu_semestre_cursa from saberpro_2012_2014 t2
where t2.estu_semestre_cursa is not null and inst_cod_institucion=t2.inst_cod_institucion
and estu_prac_id_prgrm_academico=t2.estu_prac_id_prgrm_academico limit 1)
where estu_semestre_cursa is null
-- UPDATE 919
-- Consulta retornó exitosamente en 12 secs 855 msec.
rollback
select estu_semestre_cursa,count(*) from saberpro_limpio group by 1 order by 2 desc;
commit;

------------------------------------------------------------------------------------------
/*
35. Reemplazar los nulos del atributo estu_pje_creditos por el código ‘0’ para aquellas
instituciones cuyo valor del atributo estu_nivel_prgm_academico es
‘NORMALISTA’ o el nombre de la institución del atributo inst_nombre_institucion
contiene la sigla SENA.
*/

begin;
update saberpro_limpio set estu_pje_creditos='0'
where estu_pje_creditos is null and inst_nombre_institucion like 'SENA'
or estu_nivel_prgm_academico like 'NORMALISTA';
where estu_pje_creditos is null;

-- UPDATE 11602
-- Consulta retornó exitosamente en 11 secs 695 msec.
commit ;

------------------------------------------------------------------------------------------
/*
36. Reemplazar los valores nulos del atributo estu_pje_creditos por el valor no nulo del 
atributo estu_pje_creditos de la institución con igual código (inst_cod_institucion) o
nombre (inst_nombre_institucion), y de los programas del mismo
código(estu_prac_id_prgrm_academico) o nombre (estu_prgm_academico)
*/
begin;
update saberpro_limpio set estu_pje_creditos=
(select t2.estu_pje_creditos from saberpro_2012_2014 t2
where t2.estu_pje_creditos is not null and inst_cod_institucion=t2.inst_cod_institucion
or inst_nombre_institucion=t2.inst_nombre_institucion 
and estu_prac_id_prgrm_academico=t2.estu_prac_id_prgrm_academico or estu_prgm_academico=t2.estu_prgm_academico limit 1)
where estu_pje_creditos is null;
-- UPDATE 1157
-- Consulta retornó exitosamente en 9 secs 917 msec.
commit;

------------------------------------------------------------------------------------------
/*
37. Reemplazar los valores nulos del atributo inst_vlr_matricula_ant por la moda (de las
NORMALES) del atributo inst_vlr_matricula_ant de la tabla saberpro_2012_2014,
para los nombres de instituciones que contengan la palabra ‘NORMAL’.
*/
begin;

update saberpro_limpio set inst_vlr_matricula_ant=
(select mode() within group (order by inst_vlr_matricula_ant) from saberpro_2012_2014)
 where inst_nombre_institucion like '%NORMAL%' and inst_vlr_matricula_ant is null;
-- UPDATE 11411
-- Consulta retornó exitosamente en 21 secs 432 msec.
commit;
select inst_vlr_matricula_ant, inst_nombre_institucion 
from saberpro_limpio where inst_nombre_institucion like '%NORMAL%';

------------------------------------------------------------------------------------------
/*
38. Reemplazar los valores nulos del atributo inst_vlr_matricula_ant de
saberpro_limpio, por el valor no nulo del atributo inst_vlr_matricula_ant de la tabla
saberpro_2012_2014 de igual instituciones con los mismos programas
*/
begin;
update saberpro_limpio set inst_vlr_matricula_ant=
(select t2.inst_vlr_matricula_ant from saberpro_2012_2014 t2
where t2.inst_vlr_matricula_ant is not null and inst_cod_institucion=t2.inst_cod_institucion
and estu_prac_id_prgrm_academico=t2.estu_prac_id_prgrm_academico limit 1)
where inst_vlr_matricula_ant is null;
-- UPDATE 1430
-- Consulta retornó exitosamente en 9 secs 428 msec.
commit;
select estu_prac_id_prgrm_academico, inst_vlr_matricula_ant 
from saberpro_limpio ;

------------------------------------------------------------------------------------------
/*
39. Reemplazar los valores nulos del atributo estu_titulo_bto por la moda (de las
NORMALES) del atributo estu_titulo_bto de la tabla saberpro_2012_2014, para los
nombres de instituciones que contengan la palabra ‘NORMAL’
*/
begin;

update saberpro_limpio set estu_titulo_bto=
(select mode() within group (order by estu_titulo_bto) from saberpro_2012_2014)
 where inst_nombre_institucion like '%NORMAL%' and estu_titulo_bto is null;
-- UPDATE 9
-- Consulta retornó exitosamente en 20 secs 938 msec.
commit;
select estu_titulo_bto, inst_nombre_institucion 
from saberpro_limpio where inst_nombre_institucion like '%NORMAL%';


------------------------------------------------------------------------------------------
/*
40. Reemplazar los valores nulos del atributo estu_titulo_bto al resto de instituciones por
la moda del atributo estu_titulo_bto de la tabla saberpro_2012_2014
*/
begin;

update saberpro_limpio set estu_titulo_bto=
(select mode() within group (order by estu_titulo_bto) from saberpro_2012_2014)
 where estu_titulo_bto is null;
-- UPDATE 1099
-- Consulta retornó exitosamente en 53 secs 57 msec.
commit;
select estu_titulo_bto, inst_nombre_institucion 
from saberpro_limpio; 

------------------------------------------------------------------------------------------
/*
41. Reemplazar los valores nulos del atributo estu_hogar_actual por la moda del atributo
estu_hogar_actual de la tabla saberpro_2012_2014
*/
begin;

update saberpro_limpio set estu_hogar_actual=
(select mode() within group (order by estu_hogar_actual) from saberpro_2012_2014)
 where estu_hogar_actual is null;
-- UPDATE 1111
-- Consulta retornó exitosamente en 28 secs 656 msec..
commit;
select estu_hogar_actual, inst_nombre_institucion 
from saberpro_limpio;

------------------------------------------------------------------------------------------
/*
42. Reemplazar los valores nulos del atributo fami_num_pers_grup_fam por la media
(redondeada a entera) de los valores no nulos de fami_num_pers_grup_fam de la tabla
saberpro_2012_2014;
*/
begin;

update saberpro_limpio set fami_num_pers_grup_fam=
(select round(avg(fami_num_pers_grup_fam::numeric),0) from saberpro_2012_2014 )
 where fami_num_pers_grup_fam is null;
-- UPDATE 1477
-- Consulta retornó exitosamente en 32 secs 627 msec.
rollback;
commit;
select fami_num_pers_grup_fam 
from saberpro_limpio; 


------------------------------------------------------------------------------------------
/*
43. Reemplazar los valores nulos del atributo estu_sn_cabeza_fmlia por la moda del
atributo estu_sn_cabeza_fmlia de la tabla saberpro_2012_2014.
*/
begin;

update saberpro_limpio set estu_sn_cabeza_fmlia=
(select mode() within group (order by estu_sn_cabeza_fmlia) from saberpro_2012_2014)
 where estu_sn_cabeza_fmlia is null;
-- UPDATE 1111
-- Consulta retornó exitosamente en 23 secs 965 msec.
commit;
select estu_sn_cabeza_fmlia  
from saberpro_limpio;

------------------------------------------------------------------------------------------
/*
44. Reemplazar los valores nulos del atributo fami_num_pers_cargo por la media
(redondeada a entera) de los valores no nulos de fami_num_pers_cargo de la tabla
saberpro_2012_2014;
*/
begin;

update saberpro_limpio set fami_num_pers_cargo=
(select round(avg(fami_num_pers_cargo::numeric),0) from saberpro_2012_2014 where fami_num_pers_cargo is not null)
 where fami_num_pers_cargo is null;
-- UPDATE 1238
-- Consulta retornó exitosamente en 23 secs 582 msec.
commit;
select fami_num_pers_cargo 
from saberpro_limpio ; 

------------------------------------------------------------------------------------------
/*
45. Reemplazar los valores nulos del atributo fami_cod_educa_padre por el código ‘99’
*/
begin;

update saberpro_limpio set fami_cod_educa_padre='99'
 where fami_cod_educa_padre is null;
-- UPDATE 1009
-- Consulta retornó exitosamente en 15 secs 21 msec.
commit;
select fami_cod_educa_padre 
from saberpro_limpio; 

------------------------------------------------------------------------------------------
/*
46. Reemplazar los valores 1,2,3,4,5,6,7,8 del atributo fami_cod_educa_padre por el
código ‘9’
*/
begin;

update saberpro_limpio set fami_cod_educa_padre= '9'
where fami_cod_educa_padre in ('1','2','3','4','5','6','7','8');
-- UPDATE 1170
-- Consulta retornó exitosamente en 16 secs 676 msec.
commit;

select fami_cod_educa_padre 
from saberpro_limpio;

------------------------------------------------------------------------------------------
/*
47. Reemplazar los valores nulos del atributo fami_cod_educa_madre por el código ‘99’
*/
begin;

update saberpro_limpio set fami_cod_educa_madre='99'
 where fami_cod_educa_madre is null;
-- UPDATE 1009
-- Consulta retornó exitosamente en 23 secs 378 msec.
commit;
select fami_cod_educa_madre 
from saberpro_limpio; 

------------------------------------------------------------------------------------------
/*
48. Reemplazar los valores 1,2,3,4,5,6,7,8 del atributo fami_cod_educa_madre por el
código ‘9’
*/
begin;

update saberpro_limpio set fami_cod_educa_madre= '9'
where fami_cod_educa_madre in ('1','2','3','4','5','6','7','8');
-- UPDATE 1187
-- Consulta retornó exitosamente en 15 secs 164 msec.
commit;

select fami_cod_educa_madre 
from saberpro_limpio;

------------------------------------------------------------------------------------------
/*
49. Reemplazar los valores nulos del atributo fami_cod_ocup_madre por el código
‘99’
*/
begin;

update saberpro_limpio set fami_cod_ocup_madre='99'
 where fami_cod_ocup_madre is null;
-- UPDATE 1009
-- Consulta retornó exitosamente en 15 secs 78 msec.
commit;
select fami_cod_ocup_madre 
from saberpro_limpio; 

------------------------------------------------------------------------------------------
/*
55. Reemplazar los valores 01,02,03,04,05,06,07,08,09,10,11,12 del atributo
fami_cod_ocup_madre por la moda del atributo fami_cod_ocup_madre de la tabla 
saberpro_2012_2014
*/
begin;

update saberpro_limpio set fami_cod_ocup_madre=
(select mode() within group (order by fami_cod_ocup_madre) from saberpro_2012_2014)
 where fami_cod_ocup_madre in ('01','02','03','04','05','06','07','08','09','10','11','12');
-- UPDATE 1326
-- Consulta retornó exitosamente en 26 secs 152 msec.
commit;
select fami_cod_ocup_madre  
from saberpro_limpio;

------------------------------------------------------------------------------------------
/*
56. Reemplazar los valores nulos del atributo estu_estrato por la moda del atributo
estu_estrato de la tabla saberpro_2012_2014
*/
begin;

update saberpro_limpio set estu_estrato=
(select mode() within group (order by estu_estrato) from saberpro_2012_2014)
 where estu_estrato is null;
-- UPDATE 4439
-- Consulta retornó exitosamente en 29 secs 445 msec.
commit;
select estu_estrato  
from saberpro_limpio;

------------------------------------------------------------------------------------------
/*
57. Reemplazar los valores nulos del atributo fami_nivel_sisben por la moda del atributo
fami_nivel_sisben de la tabla saberpro_2012_2014
*/
begin;

update saberpro_limpio set fami_nivel_sisben=
(select mode() within group (order by fami_nivel_sisben) from saberpro_2012_2014)
 where fami_nivel_sisben is null;
-- UPDATE 1011
-- Consulta retornó exitosamente en 40 secs 624 msec.
commit;
select fami_nivel_sisben  
from saberpro_limpio;

------------------------------------------------------------------------------------------
/*
58. Reemplazar los valores nulos del atributo econ_material_pisos por la moda del
atributo econ_material_pisos de la tabla saberpro_2012_2014
*/
begin;

update saberpro_limpio set econ_material_pisos=
(select mode() within group (order by econ_material_pisos) from saberpro_2012_2014)
 where econ_material_pisos is null;
-- UPDATE 1011
-- Consulta retornó exitosamente en 23 secs 604 msec.
commit;
select econ_material_pisos  
from saberpro_limpio;

------------------------------------------------------------------------------------------
/*
59. Reemplazar los valores nulos del atributo econ_sn_telefonia por la moda del atributo
econ_sn_telefonia de la tabla saberpro_2012_2014
*/
begin;

update saberpro_limpio set econ_sn_telefonia=
(select mode() within group (order by econ_sn_telefonia) from saberpro_2012_2014)
 where econ_sn_telefonia is null;
-- UPDATE 1027
-- Consulta retornó exitosamente en 25 secs 855 msec.
commit;
select econ_sn_telefonia  
from saberpro_limpio;

------------------------------------------------------------------------------------------
/*
60. Reemplazar los valores nulos del atributo econ_sn_internet por la moda del atributo
econ_sn_internet de la tabla saberpro_2012_2014
*/
begin;

update saberpro_limpio set econ_sn_internet=
(select mode() within group (order by econ_sn_internet) from saberpro_2012_2014)
 where econ_sn_internet is null;
-- UPDATE 1010
-- Consulta retornó exitosamente en 22 secs 835 msec.
commit;
select econ_sn_internet  
from saberpro_limpio;

------------------------------------------------------------------------------------------
/*
61. Reemplazar los valores nulos del atributo econ_sn_servicio_tv por la moda del
atributo econ_sn_servicio_tv de la tabla saberpro_2012_2014
*/
begin;

update saberpro_limpio set econ_sn_servicio_tv=
(select mode() within group (order by econ_sn_servicio_tv) from saberpro_2012_2014)
 where econ_sn_servicio_tv is null;
-- UPDATE 1010
-- Consulta retornó exitosamente en 24 secs 853 msec.
commit;
select econ_sn_servicio_tv  
from saberpro_limpio;

------------------------------------------------------------------------------------------
/*
62.	Reemplazar los valores nulos del atributo econ_sn_computador 
por la moda del atributo econ_sn_computador de la tabla saberpro_2012_2014
*/
begin;
update saberpro_limpio set econ_sn_computador=
(select mode() within group (order by econ_sn_computador) from saberpro_2012_2014)
where econ_sn_computador is null;
--UPDATE 1004
--Consulta retornó exitosamente en 16 secs 115 msec.
select econ_sn_computador,count(*) from saberpro_limpio group by 1 order by 2 desc;
commit;
---------------------------------------------------------------------------------------------------------
/*
63.	Actualizar el atributo econ_sn_computador por 1 para aquellos valores del atributo econ_sn_computador>0.
*/
begin;
update saberpro_limpio set econ_sn_computador='1'
where econ_sn_computador::numeric>0;
-- UPDATE 635878
-- Consulta retornó exitosamente en 2 min 2 secs.
select econ_sn_computador,count(*) from saberpro_limpio group by 1 order by 2 desc;
commit;

-----------------------------------------------------------------------------------------------------
/*
64. Reemplazar los valores nulos del atributo econ_sn_celular y los de econ_sn_celular
código 2 por la moda del atributo econ_sn_celular de la tabla saberpro_2012_2014
*/
begin;
update saberpro_limpio set econ_sn_celular=
(select mode() within group (order by econ_sn_celular) from saberpro_2012_2014)
where econ_sn_celular in ('2') or econ_sn_celular is null;
-- UPDATE 1060
-- Consulta retornó exitosamente en 1 min 10 secs.
select econ_sn_celular,count(*) from saberpro_limpio group by 1 order by 2 desc;
commit;

-----------------------------------------------------------------------------------------------------
/*
65. Reemplazar los valores nulos del atributo econ_sn_dvd y los de econ_sn_dvd
código 2 por la moda del atributo econ_sn_dvd de la tabla saberpro_2012_2014
*/
begin;
update saberpro_limpio set econ_sn_dvd=
(select mode() within group (order by econ_sn_dvd) from saberpro_2012_2014)
where econ_sn_dvd in ('2') or econ_sn_dvd is null;
-- UPDATE 1013
-- Consulta retornó exitosamente en 42 secs 319 msec.
select econ_sn_dvd,count(*) from saberpro_limpio group by 1 order by 2 desc;
commit;

-----------------------------------------------------------------------------------------------------
/*
66. Reemplazar los valores nulos del atributo econ_sn_lavadora por la moda del atributo
econ_sn_lavadora de la tabla saberpro_2012_2014
*/
begin;
update saberpro_limpio set econ_sn_lavadora=
(select mode() within group (order by econ_sn_lavadora) from saberpro_2012_2014)
where econ_sn_lavadora is null;
-- UPDATE 1027
-- Consulta retornó exitosamente en 26 secs 816 msec.
select econ_sn_lavadora,count(*) from saberpro_limpio group by 1 order by 2 desc;
commit;

-----------------------------------------------------------------------------------------------------
/*
67. Reemplazar los valores nulos del atributo econ_sn_microondas por la moda del
atributo econ_sn_microondas de la tabla saberpro_2012_2014
*/
begin;
update saberpro_limpio set econ_sn_microondas=
(select mode() within group (order by econ_sn_microondas) from saberpro_2012_2014)
where econ_sn_microondas is null;
-- UPDATE 1027
-- Consulta retornó exitosamente en 43 secs 394 msec.
select econ_sn_microondas,count(*) from saberpro_limpio group by 1 order by 2 desc;
commit;

-----------------------------------------------------------------------------------------------------
/*
68. Reemplazar los valores nulos del atributo econ_sn_automovil por la moda del atributo
econ_sn_automovil de la tabla saberpro_2012_2014
*/
begin;
update saberpro_limpio set econ_sn_automovil=
(select mode() within group (order by econ_sn_automovil) from saberpro_2012_2014)
where econ_sn_automovil is null;
-- UPDATE 1010
-- Consulta retornó exitosamente en 25 secs 302 msec.
select econ_sn_automovil,count(*) from saberpro_limpio group by 1 order by 2 desc;
commit;

-----------------------------------------------------------------------------------------------------
/*
69. Reemplazar los valores nulos del atributo econ_sn_horno por la moda del atributo
econ_sn_horno de la tabla saberpro_2012_2014
*/
begin;
update saberpro_limpio set econ_sn_horno=
(select mode() within group (order by econ_sn_horno) from saberpro_2012_2014)
where econ_sn_horno is null;
-- UPDATE 1027
-- Consulta retornó exitosamente en 31 secs 271 msec.
select econ_sn_horno,count(*) from saberpro_limpio group by 1 order by 2 desc;
commit;

-----------------------------------------------------------------------------------------------------
/*
70. Reemplazar los valores nulos del atributo econ_sn_nevera por la moda del atributo
econ_sn_nevera de la tabla saberpro_2012_2014
*/
begin;
update saberpro_limpio set econ_sn_nevera=
(select mode() within group (order by econ_sn_nevera) from saberpro_2012_2014)
where econ_sn_nevera is null;
-- UPDATE 1027
-- Consulta retornó exitosamente en 26 secs 56 msec.
select econ_sn_nevera,count(*) from saberpro_limpio group by 1 order by 2 desc;
commit;


-----------------------------------------------------------------------------------------------------
/*
71. Reemplazar los valores nulos del atributo infa_dormitorios por la moda del atributo
infa_dormitorios de la tabla saberpro_2012_2014
*/
begin;
update saberpro_limpio set infa_dormitorios=
(select mode() within group (order by infa_dormitorios) from saberpro_2012_2014)
where infa_dormitorios is null;
-- UPDATE 1008
-- Consulta retornó exitosamente en 28 secs 519 msec.
select infa_dormitorios,count(*) from saberpro_limpio group by 1 order by 2 desc;
commit;

-----------------------------------------------------------------------------------------------------
/*
72. Reemplazar los valores nulos del atributo fami_ing_fmliar_mensual por la moda del
atributo fami_ing_fmliar_mensual de la tabla saberpro_2012_2014
*/
begin;
update saberpro_limpio set fami_ing_fmliar_mensual=
(select mode() within group (order by fami_ing_fmliar_mensual) from saberpro_2012_2014)
where fami_ing_fmliar_mensual is null;
-- UPDATE 1011
-- Consulta retornó exitosamente en 36 secs 166 msec.
select fami_ing_fmliar_mensual,count(*) from saberpro_limpio group by 1 order by 2 desc;
commit;

-----------------------------------------------------------------------------------------------------
/*
73.	Reemplazar los valores nulos del atributo estu_trabaja y los valores de estu_trabaja códigos 1,6,7 
por la moda del atributo estu_trabaja de la tabla saberpro_2012_2014
*/
begin;
update saberpro_limpio set estu_trabaja=
(select mode() within group (order by estu_trabaja) from saberpro_2012_2014)
where estu_trabaja in ('1','6','7') or  estu_trabaja is null;
--UPDATE 1954
--Consulta retornó exitosamente en 32 secs 595 msec.
select estu_trabaja,count(*) from saberpro_limpio group by 1 order by 2 desc;
commit;
-------------------------------------------------------------------------------------------
/*
74.	Reemplazar los valores nulos del atributo estu_horas_trabajo por 0 para los estudiantes que no trabajan.
*/
begin;
update saberpro_limpio set estu_horas_trabajo=0
where estu_trabaja::numeric=0 and estu_horas_trabajo is null;
rollback;
-- UPDATE 308076
-- Consulta retornó exitosamente en 1 min 42 secs.
select estu_horas_trabajo,count(*) from saberpro_limpio group by 1 order by 2 desc;
commit;
---------------------------------------------------------------------------------------------
/*
75.	Reemplazar los valores nulos del atributo estu_horas_trabajo por la media 
entera de los valores del atributo estu_horas_trabajo de los estudiantes 
cuyo atributo estu_trabaja es de código ‘3’ de la tabla saberpro_2012_2014. 
Actualizar únicamente para los estudiantes que trabajan con código ‘3’
*/
begin;
update saberpro_limpio set estu_horas_trabajo=
(select round(avg(estu_horas_trabajo::numeric),0) from saberpro_2012_2014 where estu_trabaja='3') 
where estu_horas_trabajo is null and estu_trabaja='3';
-- UPDATE 0
-- Consulta retornó exitosamente en 1 min 15 secs.
commit;
----------------------------------------------------------------------------------------------
/*
76.	Reemplazar los valores nulos del atributo estu_horas_trabajo por
la media entera de los valores del atributo estu_horas_trabajo de los estudiantes 
cuyo atributo estu_trabaja es de código ‘4’ de la tabla saberpro_2012_2014.
Actualizar únicamente para los estudiantes que trabajan con código ‘4’
*/
begin;
update saberpro_limpio set estu_horas_trabajo=
(select round(avg(estu_horas_trabajo::numeric),0) from saberpro_2012_2014 where estu_trabaja='4') 
where estu_horas_trabajo is null and estu_trabaja='4';
-- UPDATE 4
-- Consulta retornó exitosamente en 34 secs 483 msec.
commit;
--------------------------------------------------------------------------------------------------
/*
77.	Reemplazar los valores nulos del atributo estu_horas_trabajo por 
la media entera de los valores del atributo estu_horas_trabajo de los 
estudiantes cuyo atributo estu_trabaja es de código ‘5’ de la tabla saberpro_2012_2014. 
Actualizar únicamente para los estudiantes que trabajan con código ‘5’
*/
begin;
update saberpro_limpio set estu_horas_trabajo=
(select round(avg(estu_horas_trabajo::numeric),0) from saberpro_2012_2014 where estu_trabaja='5') 
where estu_horas_trabajo is null and estu_trabaja='5';
-- UPDATE 2
-- Consulta retornó exitosamente en 48 secs 931 msec.
commit;
-----------------------------------------------------------------------------------
/*
78.	Estandarizar a punto decimal los valores del atributo mod_lectura_critica
*/
begin;
update saberpro_limpio set mod_lectura_critica=replace(mod_lectura_critica,',','.');
-- UPDATE 720856
-- Consulta retornó exitosamente en 2 min 34 secs.
select distinct mod_lectura_critica from saberpro_limpio;
commit;
-----------------------------------------------------------------------------------
/*
79.	Reemplazar los valores nulos del atributo mod_lectura_critica por ‘NP’
*/
begin;
update saberpro_limpio set mod_lectura_critica='NP'
where mod_lectura_critica is null;
-- UPDATE 984
-- Consulta retornó exitosamente en 1 min 11 secs.
commit;
--------------------------------------------------------------------------------
/*
80.	Reemplazar la coma por punto decimal a los valores del atributo mod_comunica_escrita_punt
*/
begin;
update saberpro_limpio set mod_comunica_escrita_punt=replace(mod_comunica_escrita_punt,',','.');
-- UPDATE 720856
-- Consulta retornó exitosamente en 2 min 29 secs.
select distinct mod_comunica_escrita_punt from saberpro_limpio;
commit;
-----------------------------------------------------------------------------
/*
81.	Reemplazar los valores nulos del atributo mod_comunica_escrita_punt por ‘NP’
*/
begin;
update saberpro_limpio set mod_comunica_escrita_punt='NP'
where mod_comunica_escrita_punt is null;
-- UPDATE 8993
-- Consulta retornó exitosamente en 1 min 5 secs.
commit;
rollback;
-----------------------------------------------------------------------------------
/*
82. Estandarizar a punto decimal los valores del atributo
mod_razona_cuantitativo_punt
*/
begin;
update saberpro_limpio set mod_razona_cuantitativo_punt=replace(mod_razona_cuantitativo_punt,',','.');
-- UPDATE 720856
-- Consulta retornó exitosamente en 1 min 17secs.
select distinct mod_razona_cuantitativo_punt from saberpro_limpio;
commit;

-----------------------------------------------------------------------------------
/*
83. Reemplazar los valores nulos del atributo mod_razona_cuantitativo_punt por 0
*/
begin;
update saberpro_limpio set mod_razona_cuantitativo_punt='0'
where mod_razona_cuantitativo_punt is null;
-- UPDATE 978
-- Consulta retornó exitosamente en 3 min 34 secs.
commit;

-----------------------------------------------------------------------------------
/*
84. Estandarizar a punto decimal los valores del atributo mod_ingles_punt.
*/
begin;
update saberpro_limpio set mod_ingles_punt=replace(mod_ingles_punt,',','.');
-- UPDATE 720856
-- Consulta retornó exitosamente en 1 min 01 secs.
select distinct mod_ingles_punt from saberpro_limpio;
commit;

-----------------------------------------------------------------------------------
/*
85. Reemplazar los valores nulos del atributo mod_ingles_punt por 0
*/
begin;
update saberpro_limpio set mod_ingles_punt='0'
where mod_ingles_punt is null;
-- UPDATE 718
-- Consulta retornó exitosamente en 1 min 08 secs.
commit;

-----------------------------------------------------------------------------------
/*
86. Estandarizar a punto decimal los valores del atributo mod_comp_ciudadanas_punt.
*/
begin;
update saberpro_limpio set mod_comp_ciudadanas_punt=replace(mod_comp_ciudadanas_punt,',','.');
-- UPDATE 720856
-- Consulta retornó exitosamente en 1 min 15 secs.
select distinct mod_comp_ciudadanas_punt from saberpro_limpio;
commit;

-----------------------------------------------------------------------------------
/*
87. Reemplazar los valores nulos del atributo mod_comp_ciudadanas_punt por 0
*/
begin;
update saberpro_limpio set mod_comp_ciudadanas_punt='0'
where mod_comp_ciudadanas_punt is null;
-- UPDATE 995
-- Consulta retornó exitosamente en 2 min 11 secs.
commit;





