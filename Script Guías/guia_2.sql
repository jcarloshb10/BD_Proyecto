--======================================================
-- JEAN CARLOS HERNÁNDEZ BENAVIDES 
-- 217034199
--======================================================
-- Guía 2. Análisis de la calidad de datos.
--======================================================
-- Trabajando con el repositorio de saberpro_2012_2014
--======================================================
-- atributo
-- 1. estuconsecutivo

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where estuconsecutivo is not null;
--Resulta 720856

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where estuconsecutivo is null;
-- Resulta 0

-- Numero de valores distintos
select count(distinct estuconsecutivo) from saberpro_2012_2014;
-- Resulta 720856
-- Los10 primeros valores distintos con su cantidad
select estuconsecutivo,count(*) from saberpro_2012_2014 group by 1 order by 1 limit 10;
/* Resulta
"SBPRO201210000001"	1
"SBPRO201210000002"	1
"SBPRO201210000003"	1
"SBPRO201210000004"	1
"SBPRO201210000005"	1
"SBPRO201210000006"	1
"SBPRO201210000007"	1
"SBPRO201210000008"	1
"SBPRO201210000009"	1
"SBPRO201210000010"	1
*/

------------------------------------------------------------------
-- 2. estu_cod_aplicacion

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where estu_cod_aplicacion is not null;
-- Resulta 720856

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where estu_cod_aplicacion is null;
-- Resulta 0

-- Numero de valores distintos
select count(distinct estu_cod_aplicacion) from saberpro_2012_2014;
-- Resulta 7
-- Los 7 valores distintos con su cantidad
select estu_cod_aplicacion,count(*) from saberpro_2012_2014 group by 1 order by 1;
/* Resulta
"EK20121"	102255
"EK20123"	150758
"EK20131"	83782
"EK20133"	162095
"EK20142"	12239
"EK20143"	209726
"EKO2014"	1
*/

------------------------------------------------------------------
-- 3. estu_genero

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where estu_genero is not null;
-- Resulta 718203

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where estu_genero is null;
-- Resulta 2653

-- Numero de valores distintos
select count(distinct estu_genero) from saberpro_2012_2014;
-- Resulta 2
-- Los 2 valores distintos con su cantidad
select estu_genero,count(*) from saberpro_2012_2014 group by 1 order by 1;
/* Resulta
"F"	410712
"M"	307491
null	2653
*/

------------------------------------------------------------------
-- 4. estu_nacimiento_dia

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where estu_nacimiento_dia is not null;
-- Resulta 717711

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where estu_nacimiento_dia is null;
-- Resulta 3145

-- Numero de valores distintos
select count(distinct estu_nacimiento_dia) from saberpro_2012_2014;
-- Resulta 31
-- Los 10 primeros valores distintos con su cantidad
select estu_nacimiento_dia,count(*) from saberpro_2012_2014 group by 1 order by 2 desc limit 10;
/* Resulta
"01"	24807
"10"	24443
"15"	24290
"20"	24250
"28"	23928
"12"	23924
"05"	23874
"17"	23751
"04"	23682
"22"	23670
*/

------------------------------------------------------------------
-- 5. estu_nacimiento_mes

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where estu_nacimiento_mes is not null;
-- Resulta 717711

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where estu_nacimiento_mes is null;
-- Resulta 3145

-- Numero de valores distintos
select count(distinct estu_nacimiento_mes) from saberpro_2012_2014;
-- Resulta 12
-- Los 12 valores distintos con su cantidad
select estu_nacimiento_mes,count(*) from saberpro_2012_2014 group by 1 order by 2 desc;
/* Resulta
"09"	64483
"12"	64176
"10"	63272
"08"	60638
"11"	60591
"07"	59808
"05"	59236
"01"	59050
"03"	58962
"06"	57181
"04"	57116
"02"	53198
null	3145
*/

------------------------------------------------------------------
-- 6. estu_nacimiento_anno

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where estu_nacimiento_anno is not null;
-- Resulta 717711

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where estu_nacimiento_anno is null;
-- Resulta 3145

-- Numero de valores distintos
select count(distinct estu_nacimiento_anno) from saberpro_2012_2014;
-- Resulta 77
-- Los primeros 10 valores distintos con su cantidad
select estu_nacimiento_anno,count(*) from saberpro_2012_2014 group by 1 order by 2 desc limit 10;
/* Resulta
"1900"	1
"1924"	1
"1932"	1
"1933"	1
"1934"	1
"1935"	1
"1937"	2
"1938"	1
"1939"	1
"1940"	3
*/

------------------------------------------------------------------
-- 7. estu_pais_reside

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where estu_pais_reside is not null;
-- Resulta 497481

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where estu_pais_reside is null;
-- Resulta 223375

-- Numero de valores distintos
select count(distinct estu_pais_reside) from saberpro_2012_2014;
-- Resulta 9
-- Los 9 valores distintos con su cantidad
select estu_pais_reside,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"BN"	1
"BO"	1
"CL"	1
"CO"	497463
"EC"	11
"PE"	1
"RU"	1
"TW"	1
"VA"	1
null	223375
*/

------------------------------------------------------------------
-- 8. estu_estado_civil

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where estu_estado_civil is not null;
-- Resulta 717800

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where estu_estado_civil is null;
-- Resulta 3056

-- Numero de valores distintos
select count(distinct estu_estado_civil) from saberpro_2012_2014;
-- Resulta 5
-- Los 5 valores distintos con su cantidad
select estu_estado_civil,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"01"	566073
"02"	78683
"03"	1160
"04"	9470
"05"	62414
null	3056
*/

------------------------------------------------------------------
-- 9. estu_disc_invidente

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where estu_disc_invidente is not null;
-- Resulta 154

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where estu_disc_invidente is null;
-- Resulta 720702

-- Numero de valores distintos
select count(distinct estu_disc_invidente) from saberpro_2012_2014;
-- Resulta 1
-- El valor distinto con su cantidad
select estu_disc_invidente,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"I"	154
null	720702
*/

------------------------------------------------------------------
-- 10. estu_disc_sordo_con_interprete

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where estu_disc_sordo_con_interprete is not null;
-- Resulta 83

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where estu_disc_sordo_con_interprete is null;
-- Resulta 720773

-- Numero de valores distintos
select count(distinct estu_disc_sordo_con_interprete) from saberpro_2012_2014;
-- Resulta 1
-- El valor distinto con su cantidad
select estu_disc_sordo_con_interprete,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"R"	83
null	720773
*/

------------------------------------------------------------------
-- 11. estu_disc_sordo_sin_interprete

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where estu_disc_sordo_sin_interprete is not null;
-- Resulta 135

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where estu_disc_sordo_sin_interprete is null;
-- Resulta 720721

-- Numero de valores distintos
select count(distinct estu_disc_sordo_sin_interprete) from saberpro_2012_2014;
-- Resulta 1
-- El valor distinto con su cantidad
select estu_disc_sordo_sin_interprete,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"S"	135
null	720721
*/

------------------------------------------------------------------
-- 12. estu_disc_motriz

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where estu_disc_motriz is not null;
-- Resulta 817

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where estu_disc_motriz is null;
-- Resulta 720039

-- Numero de valores distintos
select count(distinct estu_disc_motriz) from saberpro_2012_2014;
-- Resulta 1
-- El valor distinto con su cantidad
select estu_disc_motriz,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"M"	817
null	720039
*/

------------------------------------------------------------------
-- 13. estu_disc_sordo_ceguera

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where estu_disc_sordo_ceguera is not null;
-- Resulta 9

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where estu_disc_sordo_ceguera is null;
-- Resulta 720847

-- Numero de valores distintos
select count(distinct estu_disc_sordo_ceguera) from saberpro_2012_2014;
-- Resulta 1
-- El valor distinto con su cantidad
select estu_disc_sordo_ceguera,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"C"	9
null	720847
*/

------------------------------------------------------------------
-- 14. estu_zona

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where estu_zona is not null;
-- Resulta 497482

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where estu_zona is null;
-- Resulta 223374

-- Numero de valores distintos
select count(distinct estu_zona) from saberpro_2012_2014;
-- Resulta 10
-- Los 10 valores distintos con su cantidad
select estu_zona,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"1"	51072
"10"	238690
"2"	7188
"3"	27658
"4"	63272
"5"	28882
"6"	13106
"7"	10883
"8"	36102
"9"	20629
null	223374
*/

------------------------------------------------------------------
-- 15. estu_anno_egreso

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where estu_anno_egreso is not null;
-- Resulta 0

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where estu_anno_egreso is null;
-- Resulta 720856

-- Numero de valores distintos
select count(distinct estu_anno_egreso) from saberpro_2012_2014;
-- Resulta 0
-- El valor distinto con su cantidad
select estu_anno_egreso,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
null	720856
*/

------------------------------------------------------------------
-- 16. econ_area_vive

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where econ_area_vive is not null;
-- Resulta 28121

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where econ_area_vive is null;
-- Resulta 692735

-- Numero de valores distintos
select count(distinct econ_area_vive) from saberpro_2012_2014;
-- Resulta 2
-- Los 2 valores distintos con su cantidad
select econ_area_vive,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"1"	23342
"2"	4779
null	692735
*/

------------------------------------------------------------------
-- 17. estu_reside_codmpio

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where estu_reside_codmpio is not null;
-- Resulta 719476

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where estu_reside_codmpio is null;
-- Resulta 1380

-- Numero de valores distintos
select count(distinct estu_reside_codmpio) from saberpro_2012_2014;
-- Resulta 1102
-- Los 10 primeros valores distintos con su cantidad
select estu_reside_codmpio,count(*) from saberpro_2012_2014 group by 1 order by 1 limit 10;
/*Resulta
"05001"	52177
"05002"	56
"05004"	6
"05021"	30
"05030"	186
"05031"	122
"05034"	298
"05036"	4
"05038"	25
"05040"	40
*/

------------------------------------------------------------------
-- 18. estu_exam_codmpio_presentacion

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where estu_exam_codmpio_presentacion is not null;
-- Resulta 720856

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where estu_exam_codmpio_presentacion is null;
-- Resulta 0

-- Numero de valores distintos
select count(distinct estu_exam_codmpio_presentacion) from saberpro_2012_2014;
-- Resulta 296
-- Los 10 primeros valores distintos con su cantidad
select estu_exam_codmpio_presentacion,count(*) from saberpro_2012_2014 group by 1 order by 1 limit 10;
/*Resulta
"05001"	77846
"05002"	21
"05030"	54
"05031"	43
"05034"	323
"05042"	148
"05045"	1587
"05088"	2926
"05129"	706
"05148"	589
*/

------------------------------------------------------------------
-- 19. estu_exam_mpio_presentacion

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where estu_exam_mpio_presentacion is not null;
-- Resulta 720856

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where estu_exam_mpio_presentacion is null;
-- Resulta 0

-- Numero de valores distintos
select count(distinct estu_exam_mpio_presentacion) from saberpro_2012_2014;
-- Resulta 292
-- Los 10 primeros valores distintos con su cantidad
select estu_exam_mpio_presentacion,count(*) from saberpro_2012_2014 group by 1 order by 1 limit 10;
/*Resulta
"ABEJORRAL"	21
"ACACIAS"	102
"AGUACHICA"	515
"AGUADAS"	75
"AGUSTIN CODAZZI"	51
"ALBANIA"	44
"ALGECIRAS"	49
"ALMAGUER"	63
"ALVARADO"	11
"AMAGA"	54
*/

------------------------------------------------------------------
-- 20. estu_exam_dpto_presentacion

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where estu_exam_dpto_presentacion is not null;
-- Resulta 720856

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where estu_exam_dpto_presentacion is null;
-- Resulta 0

-- Numero de valores distintos
select count(distinct estu_exam_dpto_presentacion) from saberpro_2012_2014;
-- Resulta 33
-- Los 10 primeros valores distintos con su cantidad
select estu_exam_dpto_presentacion,count(*) from saberpro_2012_2014 group by 1 order by 1 limit 10;
/*Resulta
"AMAZONAS"	92
"ANTIOQUIA"	94863
"ARAUCA"	1051
"ATLÁNTICO"	36576
"BOGOTÁ"	262480
"BOLÍVAR"	25927
"BOYACÁ"	16215
"CALDAS"	12862
"CAQUETÁ"	3382
"CASANARE"	2836
*/

------------------------------------------------------------------
-- 21. estu_exam_cod

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where estu_exam_cod is not null;
-- Resulta 498890

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where estu_exam_cod is null;
-- Resulta 221966

-- Numero de valores distintos
select count(distinct estu_exam_cod) from saberpro_2012_2014;
-- Resulta 4
-- Los 4 valores distintos con su cantidad
select estu_exam_cod,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"552"	102255
"567"	150758
"587"	83782
"593"	162095
null	221966
*/

------------------------------------------------------------------
-- 22. estu_exam_nombre

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where estu_exam_nombre is not null;
-- Resulta 498890

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where estu_exam_nombre is null;
-- Resulta 221966

-- Numero de valores distintos
select count(distinct estu_exam_nombre) from saberpro_2012_2014;
-- Resulta 4
-- Los 4 valores distintos con su cantidad
select estu_exam_nombre,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"EXAMEN SABER PRO 2012-1"	102255
"EXAMEN SABER PRO 2012-2"	150758
"EXAMEN SABER PRO 2013-1"	83782
"EXAMEN SABER PRO 2013-2"	162095
null	221966
*/

------------------------------------------------------------------
-- 23. inst_cod_institucion

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where inst_cod_institucion is not null;
-- Resulta 720856

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where inst_cod_institucion is null;
-- Resulta 0

-- Numero de valores distintos
select count(distinct inst_cod_institucion) from saberpro_2012_2014;
-- Resulta 437
-- Los 10 primeros valores distintos con su cantidad
select inst_cod_institucion,count(*) from saberpro_2012_2014 group by 1 order by 1 limit 10;
/*Resulta
"001123"	466
"001156"	299
"001206"	21
"001685"	30
"001909"	42
"001917"	132
"002295"	95
"002501"	48
"002543"	34
"002634"	41
*/

------------------------------------------------------------------
-- 24. inst_nombre_institucion

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where inst_nombre_institucion is not null;
-- Resulta 720856

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where inst_nombre_institucion is null;
-- Resulta 0

-- Numero de valores distintos
select count(distinct inst_nombre_institucion) from saberpro_2012_2014;
-- Resulta 396
-- Los 10 primeros valores distintos con su cantidad
select inst_nombre_institucion,count(*) from saberpro_2012_2014 group by 1 order by 1 limit 10;
/*Resulta
"32/01 INSTITUCION EDUCATIVA NORMAL SUPERIOR SANTIAGO DE CALI"	290
"CENT ESTUDIOS PSICOPEDAG                                                                            "	176
"CENTRAL"	23
"CENTRO DE EDUCACION MILITAR"	12
"COL NORMAL SUPERIOR  NUESTRA SEÑORA DE LAS MERCEDES"	132
"COL NORMAL SUPERIOR LA INMACULADA"	18
"COL NORMAL SUPERIOR MANUEL CAÑIZALEZ"	178
"COLEGIO DE ESTUDIOS SUPERIORES DE ADMINISTRACION-CESA-"	506
"COLEGIO INTEGRADO NACIONAL ORIENTE DE CALDAS"	119
"COLEGIO MAYOR DE ANTIOQUIA"	1034
*/

------------------------------------------------------------------
-- 25. inst_origen

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where inst_origen is not null;
-- Resulta 709254

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where inst_origen is null;
-- Resulta 11602

-- Numero de valores distintos
select count(distinct inst_origen) from saberpro_2012_2014;
-- Resulta 12
-- Los 12 valores distintos con su cantidad
select inst_origen,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"1"	90484
"2"	97579
"3"	15020
"7"	137444
"8"	145175
"9"	1586
"NO OFICIAL - CORPORACIÓN"	70870
"NO OFICIAL - FUNDACIÓN"	64075
"OFICIAL DEPARTAMENTAL"	45912
"OFICIAL MUNICIPAL"	4985
"OFICIAL NACIONAL"	36033
"RÉGIMEN ESPECIAL"	91
null	11602
*/

------------------------------------------------------------------
-- 26. inst_caracter_academico

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where inst_caracter_academico is not null;
-- Resulta 709254

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where inst_caracter_academico is null;
-- Resulta 11602

-- Numero de valores distintos
select count(distinct inst_caracter_academico) from saberpro_2012_2014;
-- Resulta 5
-- Los 5 valores distintos con su cantidad
select inst_caracter_academico,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"ESCUELA TECNOLOGICA"	6773
"INSTITUCION TECNOLOGICA"	22032
"INSTITUCION UNIVERSITARIA"	193678
"TECNICA PROFESIONAL"	25455
"UNIVERSIDAD"	461316
null	11602
*/

------------------------------------------------------------------
-- 27. estu_prac_id_prgrm_academico

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where estu_prac_id_prgrm_academico is not null;
-- Resulta 720856

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where estu_prac_id_prgrm_academico is null;
-- Resulta 0

-- Numero de valores distintos
select count(distinct estu_prac_id_prgrm_academico) from saberpro_2012_2014;
-- Resulta 7801
-- Los 10 primeros valores distintos con su cantidad
select estu_prac_id_prgrm_academico,count(*) from saberpro_2012_2014 group by 1 order by 1 limit 10;
/*Resulta
"1"	187
"10"	72
"10003"	140
"10017"	181
"10024"	94
"10036"	203
"10044"	88
"10049"	93
"10051"	58
"10052"	357
*/

------------------------------------------------------------------
-- 28. estu_prgm_academico

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where estu_prgm_academico is not null;
-- Resulta 720856

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where estu_prgm_academico is null;
-- Resulta 0

-- Numero de valores distintos
select count(distinct estu_prgm_academico) from saberpro_2012_2014;
-- Resulta 1617
-- Los 10 primeros valores distintos con su cantidad
select estu_prgm_academico,count(*) from saberpro_2012_2014 group by 1 order by 1 limit 10;
/*Resulta
"3°  CICLO PROFESIONAL NEGOCIOS INTERNACIONALES"	257
"ACUICULTURA"	123
"ADMINISTRACION"	305
"ADMINISTRACION  FINANCIERA"	61
"ADMINISTRACION AERONAUTICA"	164
"ADMINISTRACION AGROPECUARIA"	190
"ADMINISTRACION AMBIENTAL"	461
"ADMINISTRACION AMBIENTAL Y DE LOS RECURSOS NATURALES"	203
+"ADMINISTRACION BANCARIA Y FINANCIERA"	181
"ADMINISTRACION COMERCIAL"	108	
*/

------------------------------------------------------------------
-- 29. estu_nivel_prgm_academico

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where estu_nivel_prgm_academico is not null;
-- Resulta 498890

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where estu_nivel_prgm_academico is null;
-- Resulta 221966

-- Numero de valores distintos
select count(distinct estu_nivel_prgm_academico) from saberpro_2012_2014;
-- Resulta 4
-- Los 4 valores distintos con su cantidad
select estu_nivel_prgm_academico,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"NORMALISTA"	11602
"TECNICA PROFESIONAL"	29830
"TECNOLOGICA TERMINAL"	46101
"UNIVERSITARIA"	411357
null	221966
*/

------------------------------------------------------------------
-- 30. estu_metodo_prgm

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where estu_metodo_prgm is not null;
-- Resulta 498890

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where estu_metodo_prgm is null;
-- Resulta 221966

-- Numero de valores distintos
select count(distinct estu_metodo_prgm) from saberpro_2012_2014;
-- Resulta 4
-- Los 4 valores distintos con su cantidad
select estu_metodo_prgm,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"A DISTANCIA (VIRTUAL)"	4714
"DISTANCIA (TRADICIONAL)"	80105
"PRESENCIAL"	413715
"SEMIPRESENCIAL"	356
null	221966
*/

------------------------------------------------------------------
-- 31. dipo_codigomunicipio

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where dipo_codigomunicipio is not null;
-- Resulta 0

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where dipo_codigomunicipio is null;
-- Resulta 720856

-- Numero de valores distintos
select count(distinct dipo_codigomunicipio) from saberpro_2012_2014;
-- Resulta 4
-- Los 4 valores distintos con su cantidad
select dipo_codigomunicipio,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
null	720856
*/

------------------------------------------------------------------
-- 32. inst_cod_jornada

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where inst_cod_jornada is not null;
-- Resulta 0

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where inst_cod_jornada is null;
-- Resulta 720856

-- Numero de valores distintos
select count(distinct inst_cod_jornada) from saberpro_2012_2014;
-- Resulta 0
-- El valor distintocon su cantidad
select inst_cod_jornada,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
null	720856	
*/

------------------------------------------------------------------
-- 33. estu_area_conoc

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where estu_area_conoc is not null;
-- Resulta 498890

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where estu_area_conoc is null;
-- Resulta 221966

-- Numero de valores distintos
select count(distinct estu_area_conoc) from saberpro_2012_2014;
-- Resulta p
-- Los 9 valores distintos con su cantidad
select estu_area_conoc,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"AGRONOMIA VETERINARIA Y AFINES"	7354
"BELLAS ARTES"	20086
"CIENCIAS DE LA EDUCACION"	50013
"CIENCIAS DE LA SALUD"	42907
"CIENCIAS SOCIALES Y HUMANAS"	86863
"ECONOMIA, ADMINISTRACION, CONTADURIA Y AFINES"	159521
"INGENIERIA, ARQUITECTURA, URBANISMO Y AFINES"	112645
"MATEMATICAS Y CIENCIAS NATURALES"	7899
"SIN CLASIFICAR"	11602
null	221966
*/


------------------------------------------------------------------
-- 34. estu_area_conoc

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where estu_area_conoc is not null;
-- Resulta 498890

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where estu_area_conoc is null;
-- Resulta 221966

-- Numero de valores distintos
select count(distinct estu_area_conoc) from saberpro_2012_2014;
-- Resulta p
-- Los 9 valores distintos con su cantidad
select estu_area_conoc,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"AGRONOMIA VETERINARIA Y AFINES"	7354
"BELLAS ARTES"	20086
"CIENCIAS DE LA EDUCACION"	50013
"CIENCIAS DE LA SALUD"	42907
"CIENCIAS SOCIALES Y HUMANAS"	86863
"ECONOMIA, ADMINISTRACION, CONTADURIA Y AFINES"	159521
"INGENIERIA, ARQUITECTURA, URBANISMO Y AFINES"	112645
"MATEMATICAS Y CIENCIAS NATURALES"	7899
"SIN CLASIFICAR"	11602
null	221966
*/

------------------------------------------------------------------
-- 35. estu_nucleo_pregrado

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where estu_nucleo_pregrado is not null;
-- Resulta 498890

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where estu_nucleo_pregrado is null;
-- Resulta 221966

-- Numero de valores distintos
select count(distinct estu_nucleo_pregrado) from saberpro_2012_2014;
-- Resulta 57
-- Los 10 primeros valores distintos con su cantidad
select estu_nucleo_pregrado,count(*) from saberpro_2012_2014 group by 1 order by 1 limit 10;
/*Resulta
"ADMINISTRACION"	102655
"AGRONOMIA"	1967
"ANTROPOLOGIA, ARTES LIBERALES"	726
"ARQUITECTURA"	6139
"ARTES REPRESENTATIVAS"	397
"ATES PLASTICAS, VISUALES Y AFINES"	2505
"BACTERIOLOGIA"	1969
"BIBLIOTECOLOGIA, OTROS DE CIENCIAS SOCIALES Y HUMANAS"	722
"BIOLOGIA, MICROBIOLOGIA Y AFINES"	3760
"CIENCIA POLITICA, RELACIONES INTERNACIONALES"	2797
*/

------------------------------------------------------------------
-- 36. estu_grupo_referencia

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where estu_grupo_referencia is not null;
-- Resulta 720856

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where estu_grupo_referencia is null;
-- Resulta 0

-- Numero de valores distintos
select count(distinct estu_grupo_referencia) from saberpro_2012_2014;
-- Resulta 35
-- Los 10 primeros valores distintos con su cantidad
select estu_grupo_referencia,count(*) from saberpro_2012_2014 group by 1 order by 1 limit 10;
/*Resulta
"ADMINISTRACIÓN Y AFINES"	145344
"ARQUITECTURA Y URBANISMO "	8895
"BELLAS ARTES Y DISEÑO"	17469
"CIENCIAS AGROPECUARIAS "	11268
"CIENCIAS MILITARES Y NAVALES"	1479
"CIENCIAS NATURALES Y EXACTAS"	8954
"CIENCIAS SOCIALES"	22313
"COMUNICACIÓN, PERIODISMO Y PUBLICIDAD"	22406
"CONTADURÍA Y AFINES"	41245
"DERECHO"	52691
*/

------------------------------------------------------------------
-- 37. estu_cod_grupo_ref

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where estu_cod_grupo_ref is not null;
-- Resulta 498890

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where estu_cod_grupo_ref is null;
-- Resulta 221966

-- Numero de valores distintos
select count(distinct estu_cod_grupo_ref) from saberpro_2012_2014;
-- Resulta 35
-- Los 10 primeros valores distintos con su cantidad
select estu_cod_grupo_ref,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"1"	11366
"10"	50449
"11"	5699
"12"	85261
"13"	23854
"14"	11760
"15"	9795
"16"	20730
"17"	4994
"18"	3839
*/

------------------------------------------------------------------
-- 38. estu_semestre_cursa

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where estu_semestre_cursa is not null;
-- Resulta 719937

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where estu_semestre_cursa is null;
-- Resulta 919

-- Numero de valores distintos
select count(distinct estu_semestre_cursa) from saberpro_2012_2014;
-- Resulta 13
-- Los 13 valores distintos con su cantidad
select estu_semestre_cursa,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"1"	11366
"10"	50449
"11"	5699
"12"	85261
"13"	23854
"14"	11760
"15"	9795
"16"	20730
"17"	4994
"18"	3839
"19"	3113
"2"	6103
"20"	1451
"21"	2697
"22"	9380
"23"	1830
"24"	1700
"25"	2931
"26"	758
"27"	11602
"28"	552
"29"	11567
"3"	16487
"30"	1136
"31"	6498
"32"	20649
"33"	8549
"34"	5265
"4"	2960
"5"	33291
"6"	14366
"7"	994
"8"	7887
"81"	11
"9"	99366
null	221966
*/

------------------------------------------------------------------
-- 39. estu_semestre_cursa

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where estu_semestre_cursa is not null;
-- Resulta 719937

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where estu_semestre_cursa is null;
-- Resulta 919

-- Numero de valores distintos
select count(distinct estu_semestre_cursa) from saberpro_2012_2014;
-- Resulta 13
-- Los 13 valores distintos con su cantidad
select estu_semestre_cursa,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"01"	1661
"02"	8465
"03"	2105
"04"	11777
"05"	15809
"06"	34164
"07"	31588
"08"	91043
"09"	216861
"10"	235035
"11"	33334
"12"	26323
"99"	11772
null	919
*/

------------------------------------------------------------------
-- 40. estu_pje_creditos

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where estu_pje_creditos is not null;
-- Resulta 708112

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where estu_pje_creditos is null;
-- Resulta 12744

-- Numero de valores distintos
select count(distinct estu_pje_creditos) from saberpro_2012_2014;
-- Resulta 5
-- Los 5 valores distintos con su cantidad
select estu_pje_creditos,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"0"	44424
"1"	19986
"2"	96570
"3"	245248
"4"	301884
null	12744
*/

------------------------------------------------------------------
-- 41. inst_vlr_matricula_ant

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where inst_vlr_matricula_ant is not null;
-- Resulta 708015

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where inst_vlr_matricula_ant is null;
-- Resulta 12841

-- Numero de valores distintos
select count(distinct inst_vlr_matricula_ant) from saberpro_2012_2014;
-- Resulta 6
-- Los 6 valores distintos con su cantidad
select inst_vlr_matricula_ant,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"0"	13324
"1"	111265
"2"	123781
"3"	260360
"4"	106636
"5"	92649
null	12841
*/

------------------------------------------------------------------
-- 41. estu_sn_matricula_propio

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where estu_sn_matricula_propio is not null;
-- Resulta 349654

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where estu_sn_matricula_propio is null;
-- Resulta 371202

-- Numero de valores distintos
select count(distinct estu_sn_matricula_propio) from saberpro_2012_2014;
-- Resulta 2
-- Los 2 valores distintos con su cantidad
select estu_sn_matricula_propio,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"0"	102519
"1"	247135
null	371202
*/

------------------------------------------------------------------
-- 42. estu_sn_matricula_padres

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where estu_sn_matricula_padres is not null;
-- Resulta 465988

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where estu_sn_matricula_padres is null;
-- Resulta 254868

-- Numero de valores distintos
select count(distinct estu_sn_matricula_padres) from saberpro_2012_2014;
-- Resulta 2
-- Los 2 valores distintos con su cantidad
select estu_sn_matricula_padres,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"0"	94947
"1"	371041
null	254868
*/

------------------------------------------------------------------
-- 43. estu_sn_matricula_beca

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where estu_sn_matricula_beca is not null;
-- Resulta 229087

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where estu_sn_matricula_beca is null;
-- Resulta 491769

-- Numero de valores distintos
select count(distinct estu_sn_matricula_beca) from saberpro_2012_2014;
-- Resulta 2
-- Los 2 valores distintos con su cantidad
select estu_sn_matricula_beca,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"0"	158547
"1"	70540
null	491769
*/

------------------------------------------------------------------
-- 44. estu_sn_matricula_credito

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where estu_sn_matricula_credito is not null;
-- Resulta 325643

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where estu_sn_matricula_credito is null;
-- Resulta 395213

-- Numero de valores distintos
select count(distinct estu_sn_matricula_credito) from saberpro_2012_2014;
-- Resulta 2
-- Los 2 valores distintos con su cantidad
select estu_sn_matricula_credito,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"0"	138650
"1"	186993
null	395213
*/

------------------------------------------------------------------
-- 45. estu_titulo_bto

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where estu_titulo_bto is not null;
-- Resulta 719748

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where estu_titulo_bto is null;
-- Resulta 1108

-- Numero de valores distintos
select count(distinct estu_titulo_bto) from saberpro_2012_2014;
-- Resulta 3
-- Los 3 valores distintos con su cantidad
select estu_titulo_bto,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"A"	532883
"N"	34644
"T"	152221
null 1108
*/

------------------------------------------------------------------
-- 46. estu_exam_semestre_pretacion

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where estu_exam_semestre_pretacion is not null;
-- Resulta 719539

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where estu_exam_semestre_pretacion is null;
-- Resulta 1317

-- Numero de valores distintos
select count(distinct estu_exam_semestre_pretacion) from saberpro_2012_2014;
-- Resulta 14
-- Los 14 valores distintos con su cantidad
select estu_exam_semestre_pretacion,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"01"	47
"02"	73
"03"	189
"04"	307
"05"	657
"06"	2230
"07"	10474
"08"	36051
"09"	71965
"1"	107223
"10"	80538
"11"	10181
"12"	8335
"2"	391269
null	1317
*/

------------------------------------------------------------------
-- 47. estu_exam_anno_presentacion

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where estu_exam_anno_presentacion is not null;
-- Resulta 719708

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where estu_exam_anno_presentacion is null;
-- Resulta 1148

-- Numero de valores distintos
select count(distinct estu_exam_anno_presentacion) from saberpro_2012_2014;
-- Resulta 48
-- Los 10 primeros valores distintos con su cantidad
select estu_exam_anno_presentacion,count(*) from saberpro_2012_2014 group by 1 order by 1 limit 10;
/*Resulta
"1968"	58
"1969"	24
"1970"	44
"1971"	36
"1972"	59
"1973"	65
"1974"	124
"1975"	140
"1976"	188
"1977"	304
*/

------------------------------------------------------------------
-- 48. estu_hogar_actual

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where estu_hogar_actual is not null;
-- Resulta 719745

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where estu_hogar_actual is null;
-- Resulta 1111

-- Numero de valores distintos
select count(distinct estu_hogar_actual) from saberpro_2012_2014;
-- Resulta 2
-- Los 2 valores distintos con su cantidad
select estu_hogar_actual,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"1"	594956
"2"	124789
null	1111
*/

------------------------------------------------------------------
-- 49. fami_num_pers_grup_fam

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where fami_num_pers_grup_fam is not null;
-- Resulta 719379

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where fami_num_pers_grup_fam is null;
-- Resulta 1477

-- Numero de valores distintos
select count(distinct fami_num_pers_grup_fam) from saberpro_2012_2014;
-- Resulta 12
-- Los 12 valores distintos con su cantidad
select fami_num_pers_grup_fam,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"1"	26792
"10"	3149
"11"	1236
"12"	3664
"2"	84556
"3"	170475
"4"	208378
"5"	131054
"6"	53839
"7"	21515
"8"	10495
"9"	4226
null	1477
*/

------------------------------------------------------------------
-- 50. estu_sn_cabeza_fmlia

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where estu_sn_cabeza_fmlia is not null;
-- Resulta 719745

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where estu_sn_cabeza_fmlia is null;
-- Resulta 1111

-- Numero de valores distintos
select count(distinct estu_sn_cabeza_fmlia) from saberpro_2012_2014;
-- Resulta 2
-- Los 2 valores distintos con su cantidad
select estu_sn_cabeza_fmlia,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"0"	586345
"1"	133400
null	1111
*/

------------------------------------------------------------------
-- 51. fami_num_pers_cargo

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where fami_num_pers_cargo is not null;
-- Resulta 719618

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where fami_num_pers_cargo is null;
-- Resulta 1238

-- Numero de valores distintos
select count(distinct fami_num_pers_cargo) from saberpro_2012_2014;
-- Resulta 6
-- Los 6 valores distintos con su cantidad
select fami_num_pers_cargo,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"0"	486755
"1"	107307
"2"	75432
"3"	32119
"4"	12157
"5"	5848
null	1238
*/

------------------------------------------------------------------
-- 52. fami_cod_educa_padre

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where fami_cod_educa_padre is not null;
-- Resulta 719847

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where fami_cod_educa_padre is null;
-- Resulta 1009

-- Numero de valores distintos
select count(distinct fami_cod_educa_padre) from saberpro_2012_2014;
-- Resulta 19
-- Los 19 valores distintos con su cantidad
select fami_cod_educa_padre,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"0"	27043
"1"	67
"10"	92240
"11"	93816
"12"	147468
"13"	21652
"14"	56355
"15"	22069
"16"	90517
"17"	44461
"2"	271
"3"	193
"4"	182
"5"	313
"6"	33
"7"	88
"8"	23
"9"	123044
"99"	12
null	1009
*/

------------------------------------------------------------------
-- 53. fami_cod_educa_madre

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where fami_cod_educa_madre is not null;
-- Resulta 719847

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where fami_cod_educa_madre is null;
-- Resulta 1009

-- Numero de valores distintos
select count(distinct fami_cod_educa_madre) from saberpro_2012_2014;
-- Resulta 19
-- Los 19 valores distintos con su cantidad
select fami_cod_educa_madre,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"0"	11674
"1"	39
"10"	92347
"11"	111045
"12"	162884
"13"	22122
"14"	72398
"15"	18075
"16"	81402
"17"	42120
"2"	251
"3"	189
"4"	222
"5"	314
"6"	30
"7"	120
"8"	22
"9"	102572
"99"	2021
null	1009
*/

------------------------------------------------------------------
-- 54. fami_sn_lee_escribe_padre

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where fami_sn_lee_escribe_padre is not null;
-- Resulta 0

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where fami_sn_lee_escribe_padre is null;
-- Resulta 720856

-- Numero de valores distintos
select count(distinct fami_sn_lee_escribe_padre) from saberpro_2012_2014;
-- Resulta 0
-- 0 valores distintos con su cantidad
select fami_sn_lee_escribe_padre,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
null	720856
*/

------------------------------------------------------------------
-- 55. fami_sn_lee_escribe_madre

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where fami_sn_lee_escribe_madre is not null;
-- Resulta 0

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where fami_sn_lee_escribe_madre is null;
-- Resulta 720856

-- Numero de valores distintos
select count(distinct fami_sn_lee_escribe_madre) from saberpro_2012_2014;
-- Resulta 0
-- 0 valores distintos con su cantidad
select fami_sn_lee_escribe_madre,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
null	720856
*/

------------------------------------------------------------------
-- 56. fami_cod_ocup_padre

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where fami_cod_ocup_padre is not null;
-- Resulta 719847

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where fami_cod_ocup_padre is null;
-- Resulta 1009

-- Numero de valores distintos
select count(distinct fami_cod_ocup_padre) from saberpro_2012_2014;
-- Resulta 25
-- Los 10 primeros valores distintos con su cantidad
select fami_cod_ocup_padre,count(*) from saberpro_2012_2014 group by 1 order by 1 limit 10;
/*Resulta
"01"	28
"02"	44
"03"	17
"04"	4
"05"	101
"06"	29
"07"	235
"08"	33
"09"	449
"10"	30
*/

------------------------------------------------------------------
-- 57. fami_cod_ocup_madre

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where fami_cod_ocup_madre is not null;
-- Resulta 719847

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where fami_cod_ocup_madre is null;
-- Resulta 1009

-- Numero de valores distintos
select count(distinct fami_cod_ocup_madre) from saberpro_2012_2014;
-- Resulta 25
-- Los 10 primeros valores distintos con su cantidad
select fami_cod_ocup_madre,count(*) from saberpro_2012_2014 group by 1 order by 1 limit 10;
/*Resulta
"01"	9
"02"	30
"03"	5
"04"	10
"05"	78
"06"	59
"07"	83
"08"	36
"09"	148
"10"	732
*/

------------------------------------------------------------------
-- 58. estu_estrato

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where estu_estrato is not null;
-- Resulta 716417

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where estu_estrato is null;
-- Resulta 4439

-- Numero de valores distintos
select count(distinct estu_estrato) from saberpro_2012_2014;
-- Resulta 7
-- Los 7 valores distintos con su cantidad
select estu_estrato,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"1"	92414
"2"	237766
"3"	255785
"4"	84532
"5"	29866
"6"	14994
"8"	1060
null	4439
*/

------------------------------------------------------------------
-- 59. fami_num_hermanos

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where fami_num_hermanos is not null;
-- Resulta 0

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where fami_num_hermanos is null;
-- Resulta 720856

-- Numero de valores distintos
select count(distinct fami_num_hermanos) from saberpro_2012_2014;
-- Resulta 0
-- 0 valores distintos con su cantidad
select fami_num_hermanos,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
null	720856
*/

------------------------------------------------------------------
-- 60. fami_nivel_hermano

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where fami_nivel_hermano is not null;
-- Resulta 0

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where fami_nivel_hermano is null;
-- Resulta 720856

-- Numero de valores distintos
select count(distinct fami_nivel_hermano) from saberpro_2012_2014;
-- Resulta 0
-- 0 valores distintos con su cantidad
select fami_nivel_hermano,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
null	720856
*/

------------------------------------------------------------------
-- 61. econ_cuartos

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where econ_cuartos is not null;
-- Resulta 0

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where econ_cuartos is null;
-- Resulta 720856

-- Numero de valores distintos
select count(distinct econ_cuartos) from saberpro_2012_2014;
-- Resulta 0
-- 0 valores distintos con su cantidad
select econ_cuartos,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
null	720856
*/

------------------------------------------------------------------
-- 62. fami_nivel_sisben

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where fami_nivel_sisben is not null;
-- Resulta 719845

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where fami_nivel_sisben is null;
-- Resulta 1011

-- Numero de valores distintos
select count(distinct fami_nivel_sisben) from saberpro_2012_2014;
-- Resulta 5
-- Los 5 valores distintos con su cantidad
select fami_nivel_sisben,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"1"	136800
"2"	154183
"3"	57593
"4"	7025
"5"	364244
null	1011
*/

------------------------------------------------------------------
-- 63. econ_material_pisos

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where econ_material_pisos is not null;
-- Resulta 719845

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where econ_material_pisos is null;
-- Resulta 1011

-- Numero de valores distintos
select count(distinct econ_material_pisos) from saberpro_2012_2014;
-- Resulta 5
-- Los 5 valores distintos con su cantidad
select econ_material_pisos,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"1"	8016
"2"	120440
"3"	21898
"4"	502495
"5"	66996
null	1011
*/

------------------------------------------------------------------
-- 64. econ_sn_televisor

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where econ_sn_televisor is not null;
-- Resulta 0

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where econ_sn_televisor is null;
-- Resulta 720856

-- Numero de valores distintos
select count(distinct econ_sn_televisor) from saberpro_2012_2014;
-- Resulta 0
-- 0 valores distintos con su cantidad
select econ_sn_televisor,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
null	720856
*/

------------------------------------------------------------------
-- 65. econ_sn_motocicleta

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where econ_sn_motocicleta is not null;
-- Resulta 0

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where econ_sn_motocicleta is null;
-- Resulta 720856

-- Numero de valores distintos
select count(distinct econ_sn_motocicleta) from saberpro_2012_2014;
-- Resulta 0
-- 0 valores distintos con su cantidad
select econ_sn_motocicleta,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
null	720856
*/

------------------------------------------------------------------
-- 66. econ_sn_energia

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where econ_sn_energia is not null;
-- Resulta 0

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where econ_sn_energia is null;
-- Resulta 720856

-- Numero de valores distintos
select count(distinct econ_sn_energia) from saberpro_2012_2014;
-- Resulta 0
-- 0 valores distintos con su cantidad
select econ_sn_energia,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
null	720856
*/

------------------------------------------------------------------
-- 67. econ_sn_acueducto

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where econ_sn_acueducto is not null;
-- Resulta 0

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where econ_sn_acueducto is null;
-- Resulta 720856

-- Numero de valores distintos
select count(distinct econ_sn_acueducto) from saberpro_2012_2014;
-- Resulta 0
-- 0 valores distintos con su cantidad
select econ_sn_acueducto,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
null	720856
*/

------------------------------------------------------------------
-- 68. econ_sn_alcantarillado

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where econ_sn_alcantarillado is not null;
-- Resulta 0

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where econ_sn_alcantarillado is null;
-- Resulta 720856

-- Numero de valores distintos
select count(distinct econ_sn_alcantarillado) from saberpro_2012_2014;
-- Resulta 0
-- 0 valores distintos con su cantidad
select econ_sn_alcantarillado,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
null	720856
*/

------------------------------------------------------------------
-- 69. econ_sn_aseo

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where econ_sn_aseo is not null;
-- Resulta 0

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where econ_sn_aseo is null;
-- Resulta 720856

-- Numero de valores distintos
select count(distinct econ_sn_aseo) from saberpro_2012_2014;
-- Resulta 0
-- 0 valores distintos con su cantidad
select econ_sn_aseo,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
null	720856
*/

------------------------------------------------------------------
-- 70. econ_sn_estufa

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where econ_sn_estufa is not null;
-- Resulta 0

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where econ_sn_estufa is null;
-- Resulta 720856

-- Numero de valores distintos
select count(distinct econ_sn_estufa) from saberpro_2012_2014;
-- Resulta 0
-- 0 valores distintos con su cantidad
select econ_sn_estufa,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
null	720856
*/

------------------------------------------------------------------
-- 71. econ_sn_telefonia

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where econ_sn_telefonia is not null;
-- Resulta 719829

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where econ_sn_telefonia is null;
-- Resulta 1027

-- Numero de valores distintos
select count(distinct econ_sn_telefonia) from saberpro_2012_2014;
-- Resulta 2
-- Los 2 valores distintos con su cantidad
select econ_sn_telefonia,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"0"	215352
"1"	504477
null	1027
*/

------------------------------------------------------------------
-- 71. econ_sn_internet

-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where econ_sn_internet is not null;
-- Resulta 719846

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where econ_sn_internet is null;
-- Resulta 1010

-- Numero de valores distintos
select count(distinct econ_sn_internet) from saberpro_2012_2014;
-- Resulta 2
-- Los 2 valores distintos con su cantidad
select econ_sn_internet,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"0"	172729
"1"	547117
null	1010
*/

------------------------------------------------------------------
-- 72. econ_sn_servicio_tv
-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where econ_sn_servicio_tv is not null;
-- Resulta 719846

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where econ_sn_servicio_tv is null;
-- Resulta 1010

-- Numero de valores distintos
select count(distinct econ_sn_servicio_tv) from saberpro_2012_2014;
-- Resulta 2
-- Los 2 valores distintos con su cantidad
select econ_sn_servicio_tv,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"0"	156119
"1"	563727
null	1010
*/

------------------------------------------------------------------
-- 73. econ_sn_computador
-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where econ_sn_computador is not null;
-- Resulta 719852

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where econ_sn_computador is null;
-- Resulta 1004

-- Numero de valores distintos
select count(distinct econ_sn_computador) from saberpro_2012_2014;
-- Resulta 5
-- Los 5 valores distintos con su cantidad
select econ_sn_computador,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"0"	84978
"1"	1028
"2"	1
"3"	633842
"4"	3
null	1004
*/

------------------------------------------------------------------
-- 74. econ_sn_celular
-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where econ_sn_celular is not null;
-- Resulta 719811

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where econ_sn_celular is null;
-- Resulta 1045

-- Numero de valores distintos
select count(distinct econ_sn_celular) from saberpro_2012_2014;
-- Resulta 3
-- Los 3 valores distintos con su cantidad
select econ_sn_celular,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"0"	50067
"1"	669729
"2"	15
null	1045
*/

------------------------------------------------------------------
-- 75. econ_sn_dvd
-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where econ_sn_dvd is not null;
-- Resulta 719846

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where econ_sn_dvd is null;
-- Resulta 1010

-- Numero de valores distintos
select count(distinct econ_sn_dvd) from saberpro_2012_2014;
-- Resulta 3
-- Los 3 valores distintos con su cantidad
select econ_sn_dvd,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"0"	223783
"1"	496060
"2"	3
null	1010
*/

------------------------------------------------------------------
-- 76. econ_sn_lavadora
-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where econ_sn_lavadora is not null;
-- Resulta 719829

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where econ_sn_lavadora is null;
-- Resulta 1027

-- Numero de valores distintos
select count(distinct econ_sn_lavadora) from saberpro_2012_2014;
-- Resulta 2
-- Los 2 valores distintos con su cantidad
select econ_sn_lavadora,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"0"	136168
"1"	583661
null	1027
*/

------------------------------------------------------------------
-- 77. econ_sn_microondas
-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where econ_sn_microondas is not null;
-- Resulta 719829

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where econ_sn_microondas is null;
-- Resulta 1027

-- Numero de valores distintos
select count(distinct econ_sn_microondas) from saberpro_2012_2014;
-- Resulta 2
-- Los 2 valores distintos con su cantidad
select econ_sn_microondas,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"0"	395785
"1"	324044
null	1027
*/

------------------------------------------------------------------
-- 78. econ_sn_automovil
-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where econ_sn_automovil is not null;
-- Resulta 719846

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where econ_sn_automovil is null;
-- Resulta 1010

-- Numero de valores distintos
select count(distinct econ_sn_automovil) from saberpro_2012_2014;
-- Resulta 2
-- Los 2 valores distintos con su cantidad
select econ_sn_automovil,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"0"	485588
"1"	234258
null	1010
*/

------------------------------------------------------------------
-- 79. econ_sn_horno
-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where econ_sn_horno is not null;
-- Resulta 719829

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where econ_sn_horno is null;
-- Resulta 1027

-- Numero de valores distintos
select count(distinct econ_sn_horno) from saberpro_2012_2014;
-- Resulta 2
-- Los 2 valores distintos con su cantidad
select econ_sn_horno,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"0"	348906
"1"	370923
null	1027
*/

------------------------------------------------------------------
-- 80. econ_sn_nevera
-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where econ_sn_nevera is not null;
-- Resulta 719829

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where econ_sn_nevera is null;
-- Resulta 1027

-- Numero de valores distintos
select count(distinct econ_sn_nevera) from saberpro_2012_2014;
-- Resulta 2
-- Los 2 valores distintos con su cantidad
select econ_sn_nevera,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"0"	33584
"1"	686245
null	1027
*/

------------------------------------------------------------------
-- 81. infa_dormitorios
-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where infa_dormitorios is not null;
-- Resulta 719848

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where infa_dormitorios is null;
-- Resulta 1008

-- Numero de valores distintos
select count(distinct infa_dormitorios) from saberpro_2012_2014;
-- Resulta 10
-- Los 10 valores distintos con su cantidad
select infa_dormitorios,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"1"	50940
"10"	1945
"2"	214557
"3"	316038
"4"	101849
"5"	24180
"6"	6701
"7"	2169
"8"	1060
"9"	409
null	1008
*/

------------------------------------------------------------------
-- 82. fami_ing_fmliar_mensual
-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where fami_ing_fmliar_mensual is not null;
-- Resulta 719845

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where fami_ing_fmliar_mensual is null;
-- Resulta 1011

-- Numero de valores distintos
select count(distinct fami_ing_fmliar_mensual) from saberpro_2012_2014;
-- Resulta 7
-- Los 7 valores distintos con su cantidad
select fami_ing_fmliar_mensual,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"1"	59906
"2"	245969
"3"	180895
"4"	132296
"5"	48987
"6"	26601
"7"	25191
null	1011
*/

------------------------------------------------------------------
-- 83. estu_trabaja
-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where estu_trabaja is not null;
-- Resulta 718911

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where estu_trabaja is null;
-- Resulta 1945

-- Numero de valores distintos
select count(distinct estu_trabaja) from saberpro_2012_2014;
-- Resulta 6
-- Los 6 valores distintos con su cantidad
select estu_trabaja,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"0"	306604
"1"	8
"3"	263006
"4"	47392
"5"	101900
"6"	1
null	1945
*/

------------------------------------------------------------------
-- 84. estu_horas_trabajo
-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where estu_horas_trabajo is not null;
-- Resulta 412774

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where estu_horas_trabajo is null;
-- Resulta 308082

-- Numero de valores distintos
select count(distinct estu_horas_trabajo) from saberpro_2012_2014;
-- Resulta 21
-- Los 10 primeros valores distintos con su cantidad
select estu_horas_trabajo,count(*) from saberpro_2012_2014 group by 1 order by 1 limit 10;
/*Resulta
"0"	233
"1"	231
"10"	11881
"11"	1000
"12"	7847
"13"	675
"14"	2173
"15"	5471
"16"	6666
"17"	727
*/

------------------------------------------------------------------
-- 85. estu_otro_idioma_lee
-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where estu_otro_idioma_lee is not null;
-- Resulta 0

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where estu_otro_idioma_lee is null;
-- Resulta 720856

-- Numero de valores distintos
select count(distinct estu_otro_idioma_lee) from saberpro_2012_2014;
-- Resulta 0
-- 0 valores distintos con su cantidad
select estu_otro_idioma_lee,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
null	720856
*/

------------------------------------------------------------------
-- 86. estu_otro_idioma_habla
-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where estu_otro_idioma_habla is not null;
-- Resulta 0

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where estu_otro_idioma_habla is null;
-- Resulta 720856

-- Numero de valores distintos
select count(distinct estu_otro_idioma_habla) from saberpro_2012_2014;
-- Resulta 0
-- 0 valores distintos con su cantidad
select estu_otro_idioma_habla,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
null	720856
*/

------------------------------------------------------------------
-- 87. estu_nivel_postgrado
-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where estu_nivel_postgrado is not null;
-- Resulta 0

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where estu_nivel_postgrado is null;
-- Resulta 720856

-- Numero de valores distintos
select count(distinct estu_nivel_postgrado) from saberpro_2012_2014;
-- Resulta 0
-- 0 valores distintos con su cantidad
select estu_nivel_postgrado,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
null	720856
*/

------------------------------------------------------------------
-- 88. estu_etnia
-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where estu_etnia is not null;
-- Resulta 0

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where estu_etnia is null;
-- Resulta 720856

-- Numero de valores distintos
select count(distinct estu_etnia) from saberpro_2012_2014;
-- Resulta 0
-- 0 valores distintos con su cantidad
select estu_etnia,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
null	720856
*/

------------------------------------------------------------------
-- 89. mod_lectura_critica
-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where mod_lectura_critica is not null;
-- Resulta 719872

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where mod_lectura_critica is null;
-- Resulta 984

-- Numero de valores distintos
select count(distinct mod_lectura_critica) from saberpro_2012_2014;
-- Resulta 104
-- Los 10 primeros valores distintos con su cantidad
select mod_lectura_critica,count(*) from saberpro_2012_2014 group by 1 order by 1 limit 10;
/*Resulta
null	720856
*/

------------------------------------------------------------------
-- 90. mod_comunica_escrita_punt
-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where mod_comunica_escrita_punt is not null;
-- Resulta 711863

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where mod_comunica_escrita_punt is null;
-- Resulta 8993

-- Numero de valores distintos
select count(distinct mod_comunica_escrita_punt) from saberpro_2012_2014;
-- Resulta 134
-- Los 10 primeros valores distintos con su cantidad
select mod_comunica_escrita_punt,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"1"	5598
"2"	35798
"3"	113391
"4"	241150
"5"	201125
"6"	88611
"7"	23788
"8"	2393
null	9002
*/

------------------------------------------------------------------
-- 91. mod_comunica_escrita_desem
-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where mod_comunica_escrita_desem is not null;
-- Resulta 711854

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where mod_comunica_escrita_desem is null;
-- Resulta 9002

-- Numero de valores distintos
select count(distinct mod_comunica_escrita_desem) from saberpro_2012_2014;
-- Resulta 8
-- Los 8 valores distintos con su cantidad
select mod_comunica_escrita_desem,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"1"	5598
"2"	35798
"3"	113391
"4"	241150
"5"	201125
"6"	88611
"7"	23788
"8"	2393
null	9002
*/

------------------------------------------------------------------
-- 92. mod_razona_cuantitativo_punt
-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where mod_razona_cuantitativo_punt is not null;
-- Resulta 719878

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where mod_razona_cuantitativo_punt is null;
-- Resulta 978

-- Numero de valores distintos
select count(distinct mod_razona_cuantitativo_punt) from saberpro_2012_2014;
-- Resulta 106
-- Los 10 primeros valores distintos con su cantidad
select mod_razona_cuantitativo_punt,count(*) from saberpro_2012_2014 group by 1 order by 1 limit 10;
/*Resulta
"0.0"	173
"10.0"	22652
"10.1"	35267
"10.2"	28709
"10.3"	23516
"10.4"	24683
"10.5"	23237
"10.6"	15491
"10.7"	24254
"10.8"	14417
*/

------------------------------------------------------------------
-- 93. mod_ingles_punt
-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where mod_ingles_punt is not null;
-- Resulta 720138

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where mod_ingles_punt is null;
-- Resulta 718

-- Numero de valores distintos
select count(distinct mod_ingles_punt) from saberpro_2012_2014;
-- Resulta 66
-- Los 10 primeros valores distintos con su cantidad
select mod_ingles_punt,count(*) from saberpro_2012_2014 group by 1 order by 1 limit 10;
/*Resulta
"0.0"	2357
"10.0"	34204
"10.1"	29781
"10.2"	24810
"10.3"	22864
"10.4"	18667
"10.5"	17122
"10.6"	16080
"10.8"	8854
"10.9"	7559
*/


------------------------------------------------------------------
-- 94. mod_ingles_desem
-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where mod_ingles_desem is not null;
-- Resulta 720138

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where mod_ingles_desem is null;
-- Resulta 718

-- Numero de valores distintos
select count(distinct mod_ingles_desem) from saberpro_2012_2014;
-- Resulta 5
-- Los 5 valores distintos con su cantidad
select mod_ingles_desem,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"A-"	175607
"A1"	254111
"A2"	113244
"B+"	68341
"B1"	108835
null	718
*/

------------------------------------------------------------------
-- 95. prueba
-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where prueba is not null;
-- Resulta 720856

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where prueba is null;
-- Resulta 0

-- Numero de valores distintos
select count(distinct prueba) from saberpro_2012_2014;
-- Resulta 7
-- Los 7 valores distintos con su cantidad
select prueba,count(*) from saberpro_2012_2014 group by 1 order by 1;
/*Resulta
"20121"	102255
"20123"	150758
"20131"	83782
"20133"	162095
"20142"	12239
"20143"	209726
"O2014"	1
*/

------------------------------------------------------------------
-- 96. mod_comp_ciudadanas_punt
-- Numero de tuplas no nulas
select count(*) from saberpro_2012_2014 where mod_comp_ciudadanas_punt is not null;
-- Resulta 719861

-- Numero de tuplas nulas
select count(*) from saberpro_2012_2014 where mod_comp_ciudadanas_punt is null;
-- Resulta 995

-- Numero de valores distintos
select count(distinct mod_comp_ciudadanas_punt) from saberpro_2012_2014;
-- Resulta 91
-- Los 10 primeros valores distintos con su cantidad
select mod_comp_ciudadanas_punt,count(*) from saberpro_2012_2014 group by 1 order by 1 limit 10;
/*Resulta
"0.0"	390
"10.0"	32936
"10.1"	20043
"10.2"	37662
"10.3"	15180
"10.4"	33520
"10.5"	27233
"10.6"	19576
"10.7"	20897
"10.8"	21414
*/

--=================================================================
-- FIN SCRIPT
--=================================================================
