--
-- Cadastro do sistema 'RPrevAposent'
--
SET SCAN OFF
ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY HH24:MI:SS';
ALTER SESSION SET NLS_NUMERIC_CHARACTERS = '.,';
EXEC EXEC_SQL_HADES('ALTER TABLE SISTEMA DISABLE ALL TRIGGERS')
INSERT INTO SISTEMA
(FLEX_CAMPO_01, FLEX_CAMPO_02, FLEX_CAMPO_03, FLEX_CAMPO_04, FLEX_CAMPO_05, FLEX_CAMPO_06, FLEX_CAMPO_07, FLEX_CAMPO_08, FLEX_CAMPO_09, FLEX_CAMPO_10, HABILSIS, NOMESIS, SIS, TAKE, VERSAO)
SELECT * FROM (
SELECT FLEX_CAMPO_01,FLEX_CAMPO_02,FLEX_CAMPO_03,FLEX_CAMPO_04,FLEX_CAMPO_05,FLEX_CAMPO_06,FLEX_CAMPO_07,FLEX_CAMPO_08,FLEX_CAMPO_09,FLEX_CAMPO_10,HABILSIS,NOMESIS,SIS,TAKE,VERSAO FROM SISTEMA WHERE 1=0 UNION ALL
SELECT '', '', '', '', '', '', '', '', '', '', 'S', 'Concess�o de aposentadorias Rio Previd�ncia', 'RPrevAposent', TO_DATE(''), '1.0' FROM DUAL
) TEMP_20170217084041
WHERE (SIS) NOT IN
  (SELECT SIS FROM SISTEMA)
/
COMMIT;
EXEC EXEC_SQL_HADES('ALTER TABLE SISTEMA ENABLE ALL TRIGGERS')
SET SCAN ON

SET SCAN OFF
ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY HH24:MI:SS';
ALTER SESSION SET NLS_NUMERIC_CHARACTERS = '.,';
EXEC EXEC_SQL_HADES('ALTER TABLE TABELA DISABLE ALL TRIGGERS')
INSERT INTO TABELA
(DESCR, SIS, TAB, TAMINFO, TAMINFO1, TAMINFO2, TAMINFO3, TIPO, TIPO1, TIPO2)
SELECT * FROM (
SELECT DESCR,SIS,TAB,TAMINFO,TAMINFO1,TAMINFO2,TAMINFO3,TIPO,TIPO1,TIPO2 FROM TABELA WHERE 1=0 UNION ALL
SELECT 'Motivos de revers�o de aposentadoria', 'RPrevAposent', 'TRPV_MOT_REV_APOS', TO_NUMBER('30'), TO_NUMBER(''), TO_NUMBER(''), TO_NUMBER(''), 'A', '', '' FROM DUAL
) TEMP_20171009150555
WHERE (TAB) NOT IN
  (SELECT TAB FROM TABELA)
/
COMMIT;
EXEC EXEC_SQL_HADES('ALTER TABLE TABELA ENABLE ALL TRIGGERS')
SET SCAN ON

SET SCAN OFF
ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY HH24:MI:SS';
ALTER SESSION SET NLS_NUMERIC_CHARACTERS = '.,';
EXEC EXEC_SQL_HADES('ALTER TABLE TABELA DISABLE ALL TRIGGERS')
INSERT INTO TABELA
(DESCR, SIS, TAB, TAMINFO, TAMINFO1, TAMINFO2, TAMINFO3, TIPO, TIPO1, TIPO2)
SELECT * FROM (
SELECT DESCR,SIS,TAB,TAMINFO,TAMINFO1,TAMINFO2,TAMINFO3,TIPO,TIPO1,TIPO2 FROM TABELA WHERE 1=0 UNION ALL
SELECT 'Motivos de reabertura de aposentadoria', 'RPrevAposent', 'TRPV_MOT_REAB_APOS', TO_NUMBER('30'), TO_NUMBER(''), TO_NUMBER(''), TO_NUMBER(''), 'A', '', '' FROM DUAL
) TEMP_20171009150555
WHERE (TAB) NOT IN
  (SELECT TAB FROM TABELA)
/
COMMIT;
EXEC EXEC_SQL_HADES('ALTER TABLE TABELA ENABLE ALL TRIGGERS')
SET SCAN ON