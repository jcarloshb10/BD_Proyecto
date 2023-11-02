--==================================================
-- LIMPIEZA DE DATOS
--==================================================
--Crear tabla saberpro_limpio a partir de la tabla saberpro_2012_2014
create table saberpro_limpio as select * from saberpro_2012_2014;
--  SELECT 720856
--Consulta retornó exitosamente en 59 secs 362 msec.
--=========================================================================
/*
Reemplazar los valores de EK20123, EK20133, EK20142, 'EK20143 y EKO2014 por 
EK20122, EK20132, EK20141, EK20142 y EK20141 respectivamente.
*/
begin;
update saberpro_limpio set estu_cod_aplicacion= case
when estu_cod_aplicacion = 'EK20123' then 'EK20122'
when estu_cod_aplicacion = 'EK20133' then 'EK20132'
when estu_cod_aplicacion = 'EK20142' then 'EK20141'
when estu_cod_aplicacion = 'EK20143' then 'EK20142'
when estu_cod_aplicacion = 'EKO2014' then 'EK20141'
else estu_cod_aplicacion
end;
--UPDATE 720856
--Consulta retornó exitosamente en 4 min 33 secs.
-- rollback
select distinct estu_cod_aplicacion from saberpro_limpio order by 1;
commit;

----------------------------------------------------------------------------
/* 
Reemplazar los valores 20123, 20133, 20142, 20143 y O2014 del atributo prueba
por 20122, 20132, 20141, 20142 y 20141 respectivamente.
*/
begin;
update saberpro_limpio set estu_cod_aplicacion= case
when prueba = '20123' then '20122'
when prueba = '20133' then '20132'
when prueba = '20142' then '20141'
when prueba = '20143' then '20142'
when prueba = 'O2014' then '20141'
else prueba
end;
-- UPDATE 720856
-- Consulta retornó exitosamente en 6 min 21 secs.

----------------------------------------------------------------------------------------
/* 
3. Reemplazar los valores nulos del tributo estu_genero por la moda de este atributo.
en saberpro_2012_2014
*/
begin;
-- 1 forma
update saberpro_limpio set estu_genero =
(select t1.genero from
 (select estu_genero as genero,count(*) from saberpro_2012_2014 group by 1 order by 2 desc limit 1) as t1)
 where estu_genero is null;
 
-- rollback
-- UPDATE 2653
-- Query 369 msec.

-- 2 forma: Usar la función mode()
update saberpro_limpio set estu_genero =
(select mode() within group (order by estu_genero) from saberpro_2012_2014)
 where estu_genero is null;
select estu_genero as genero,count(*) from saberpro_limpio group by 1 order by 2 desc;
commit;

-------------------------------------------------------------------------------
/* 
4. Reemplazar los valores nulos del tributo estu_nacimiento_dia por la moda de este atributo.
en saberpro_2012_2014
*/
begin;
-- 2 forma: Usar la función mode()
update saberpro_limpio set estu_nacimiento_dia =
(select mode() within group (order by estu_nacimiento_dia) from saberpro_2012_2014)
 where estu_nacimiento_dia is null;
-- UPDATE 3145
-- Consulta retornó exitosamente en 1 min 24 secs.
select estu_nacimiento_dia,count(*) from saberpro_limpio group by 1 order by 2 desc;
-- rollback
commit;

---------------------------------------------------------------------------------
/* 
5. Reemplazar los va del tributo estu_nacimiento_dia por '05'.
en saberpro_2012_2014
*/
begin;
update saberpro_limpio set estu_nacimiento_dia = '05' where estu_nacimiento_dia = '5';
-- UPDATE 0
-- Query
commit;

----------------------------------------------------------------------------
/* 
6. Reemplazar los valores nulos del tributo estu_nacimiento_mes por la moda de este atributo.
en saberpro_2012_2014
*/
begin;
-- 2 forma: Usar la función mode()
update saberpro_limpio set estu_nacimiento_mes =
(select mode() within group (order by estu_nacimiento_mes) from saberpro_2012_2014)
 where estu_nacimiento_mes is null;
-- UPDATE 3145
-- Query ...
select estu_nacimiento_mes,count(*) from saberpro_limpio group by 1 order by 2 desc;
-- rollback
commit;

----------------------------------------------------------------------------
/* 
7. Reemplazar los valores nulos del tributo estu_nacimiento_anno por la moda de este atributo.
en saberpro_2012_2014 en los años 2012, 2013 y 2014.
*/
-- 2012
begin;
-- 2 forma: Usar la función mode()
update saberpro_limpio set estu_nacimiento_anno =
(select mode() within group (order by estu_nacimiento_anno) from saberpro_2012_2014)
 where estu_nacimiento_anno is null and prueba like '2012_';
-- UPDATE 1374
-- Consulta retornó exitosamente en 1 min 48 secs.
select estu_nacimiento_anno,count(*) from saberpro_limpio group by 1 order by 2 desc;
-- rollback
commit;

-- 2013
begin;
-- 2 forma: Usar la función mode()
update saberpro_limpio set estu_nacimiento_anno =
(select mode() within group (order by estu_nacimiento_anno) from saberpro_2012_2014)
 where estu_nacimiento_anno is null and prueba like '2013_';
-- UPDATE 524
-- Consulta retornó exitosamente en 1 min 5 secs.
select estu_nacimiento_anno,count(*) from saberpro_limpio group by 1 order by 2 desc;
-- rollback
commit;

-- 2014
begin;
-- 2 forma: Usar la función mode()
update saberpro_limpio set estu_nacimiento_anno =
(select mode() within group (order by estu_nacimiento_anno) from saberpro_2012_2014)
 where estu_nacimiento_anno is null and prueba like '2014_';
-- UPDATE 1374
-- Consulta retornó exitosamente en 1 min 48 secs.
select estu_nacimiento_anno,count(*) from saberpro_limpio group by 1 order by 2 desc;
-- rollback
commit;

-----------------------------------------------------------------------------
--Proceso inverso: restaurar a los valores anteriores desde el último cambio.
begin;
create index idx_estuconsecutivo1 on saberpro_2012_2014(estuconsecutivo);
create index idx_estuconsecutivo2 on saberpro_limpio(estuconsecutivo);
update saberpro_limpio set estu_nacimiento_anno=
(select t2.estu_nacimiento_anno from saberpro_2012_2014 t2
where saberpro_limpio.estuconasecutivo=t2.estuconsecutivo);
select estu_nacimiento_anno,count(*) from saberpro_limpio group by 1 order by 2 desc;
----------------------------------------------------------------------------
/* 
8. Reemplazar los valores nulos del tributo estu_pais_reside por 'COLOMBIA'.
*/
begin;
update saberpro_limpio set estu_pais_reside = 'COLOMBIA' where estu_pais_reside is null;
--  UPDATE, me faltó
commit;
------------------------------------------------------------------------
/*
9. 
*/


------------------------------------------------------------------------
/*
10. 
*/
