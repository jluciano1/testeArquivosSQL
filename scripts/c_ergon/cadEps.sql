--
--
SET SCAN OFF
ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY HH24:MI:SS';
ALTER SESSION SET NLS_NUMERIC_CHARACTERS = '.,';
EXEC EXEC_SQL_HADES('ALTER TABLE HAD_CAD_SPROC DISABLE ALL TRIGGERS')
INSERT INTO HAD_CAD_SPROC
(AUDITAR, EXEC, SINTAXE, SPROC, TIPO)
SELECT * FROM (
SELECT AUDITAR,EXEC,SINTAXE,SPROC,TIPO FROM HAD_CAD_SPROC WHERE 1=0 UNION ALL
SELECT 'N', 'S', 'BEGIN'||CHR(10)||' IF TRPV_EPB__PRE_CONTA(PCK_PRE_CONTA.V_ROW_NEW,PCK_PRE_CONTA.V_ROW_OLD,:1=''S'',:2=''S'',:3=''S'',:4) THEN :5 := ''S'';'||CHR(10)||' ELSE :5 := ''N''; END IF;'||CHR(10)||'END;', 'EPB__PRE_CONTA', 'EPB' FROM DUAL
) TEMP_20171023130649
WHERE (SPROC) NOT IN
  (SELECT SPROC FROM HAD_CAD_SPROC)
/
COMMIT;
EXEC EXEC_SQL_HADES('ALTER TABLE HAD_CAD_SPROC ENABLE ALL TRIGGERS')
SET SCAN ON


--Atualiza cadastro do EPA__VINCULOS
update had_cad_sproc
   set sintaxe =  'BEGIN IF TRPV_EPA__VINCULOS(PCK_VINCULOS.P_VINCULOS(:1),PCK_VINCULOS.P_VINCULOS_OLD(:1),:2=''S'',:3=''S'',:4=''S'',:5) THEN :6 := ''S''; ELSE :6 := ''N''; END IF; END;',
       exec = 'S'
where sproc = 'EPA__VINCULOS'
  and not exists (select null from had_fix_vw where ident = 'RioPrev.Aposent.CadEps')
/
commit
/
--Atualiza cadastro do EPB__AVERBACOES_CONTA
update had_cad_sproc
   set sintaxe = 'BEGIN IF TRPV_EPB__AVERBACOES_CONTA(PCK_AVERBACOES_CONTA.V_ROW_NEW,PCK_AVERBACOES_CONTA.V_ROW_OLD,:1=''S'',:2=''S'',:3=''S'',:4) THEN :5 := ''S''; ELSE :5 := ''N''; END IF; END;',
       exec = 'S'
where sproc = 'EPB__AVERBACOES_CONTA'
  and not exists (select null from had_fix_vw where ident = 'RioPrev.Aposent.CadEps')
/
commit
/
--Atualiza cadastro do EPB__CESSOES
update had_cad_sproc
   set sintaxe = 'BEGIN IF TRPV_EPB__CESSOES(PCK_CESSOES.V_ROW_NEW,PCK_CESSOES.V_ROW_OLD,:1=''S'',:2=''S'',:3=''S'',:4) THEN :5 := ''S''; ELSE :5 := ''N''; END IF; END;',
       exec = 'S'
where sproc = 'EPB__CESSOES'
  and not exists (select null from had_fix_vw where ident = 'RioPrev.Aposent.CadEps')
/
commit
/
--Atualiza cadastro do EPB__EVENTO_FUNC
update had_cad_sproc
   set sintaxe = 'BEGIN IF TRPV_EPB__EVENTO_FUNC(PCK_EVENTO_FUNC.V_ROW_NEW,PCK_EVENTO_FUNC.V_ROW_OLD,:1=''S'',:2=''S'',:3=''S'',:4) THEN :5 := ''S''; ELSE :5 := ''N''; END IF; END;',
       exec = 'S'
where sproc = 'EPB__EVENTO_FUNC'
  and not exists (select null from had_fix_vw where ident = 'RioPrev.Aposent.CadEps')
/
commit
/
--Atualiza cadastro do EPB__FREQUENCIAS
update had_cad_sproc
   set sintaxe = 'BEGIN IF TRPV_EPB__FREQUENCIAS(PCK_FREQUENCIAS.V_ROW_NEW,PCK_FREQUENCIAS.V_ROW_OLD,:1=''S'',:2=''S'',:3=''S'',:4) THEN :5 := ''S''; ELSE :5 := ''N''; END IF; END;',
       exec = 'S'
where sproc = 'EPB__FREQUENCIAS'
  and not exists (select null from had_fix_vw where ident = 'RioPrev.Aposent.CadEps')
/
commit
/
--Atualiza cadastro do EPB__FUNCIONARIOS
update had_cad_sproc
   set sintaxe = 'BEGIN IF TRPV_EPB__FUNCIONARIOS(PCK_FUNCIONARIOS.V_ROW_NEW,PCK_FUNCIONARIOS.V_ROW_OLD,:1=''S'',:2=''S'',:3=''S'',:4) THEN :5 := ''S''; ELSE :5 := ''N''; END IF; END;',
       exec = 'S'
where sproc = 'EPB__FUNCIONARIOS'
  and not exists (select null from had_fix_vw where ident = 'RioPrev.Aposent.CadEps')
/
commit
/
--Atualiza cadastro do EPB__VANTAGENS
update had_cad_sproc
   set sintaxe = 'BEGIN IF TRPV_EPB__VANTAGENS(PCK_VANTAGENS.V_ROW_NEW, PCK_VANTAGENS.V_ROW_OLD,:1=''S'',:2=''S'',:3=''S'',:4) THEN :5 := ''S''; ELSE :5 := ''N''; END IF;END;',
       exec = 'S'
where sproc = 'EPB__VANTAGENS'
  and not exists (select null from had_fix_vw where ident = 'RioPrev.Aposent.CadEps')
/
commit
/

SET SCAN OFF
ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY HH24:MI:SS';
ALTER SESSION SET NLS_NUMERIC_CHARACTERS = '.,';
EXEC EXEC_SQL_HADES('ALTER TABLE HAD_CAD_SPROC DISABLE ALL TRIGGERS')
INSERT INTO HAD_CAD_SPROC
(AUDITAR, EXEC, SINTAXE, SPROC, TIPO)
SELECT * FROM (
SELECT AUDITAR,EXEC,SINTAXE,SPROC,TIPO FROM HAD_CAD_SPROC WHERE 1=0 UNION ALL
SELECT 'N', 'S', 'BEGIN'||CHR(10)||' IF TRPV_EPB__AVERB_OQUE_CONTA(PCK_AVERB_OQUE_CONTA.V_ROW_NEW,PCK_AVERB_OQUE_CONTA.V_ROW_OLD,:1=''S'',:2=''S'',:3=''S'',:4) THEN :5 := ''S'';'||CHR(10)||' ELSE :5 := ''N''; END IF;'||CHR(10)||'END;', 'EPB__AVERB_OQUE_CONTA', 'EPB' FROM DUAL
) TEMP_20171023130649
WHERE (SPROC) NOT IN
  (SELECT SPROC FROM HAD_CAD_SPROC)
/
COMMIT;
EXEC EXEC_SQL_HADES('ALTER TABLE HAD_CAD_SPROC ENABLE ALL TRIGGERS')
SET SCAN ON

SET SCAN OFF
ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY HH24:MI:SS';
ALTER SESSION SET NLS_NUMERIC_CHARACTERS = '.,';
EXEC EXEC_SQL_HADES('ALTER TABLE HAD_CAD_SPROC DISABLE ALL TRIGGERS')
INSERT INTO HAD_CAD_SPROC
(AUDITAR, EXEC, EXEC_MULT_EPS, SINTAXE, SPROC, TIPO)
SELECT * FROM (
SELECT AUDITAR,EXEC,EXEC_MULT_EPS,SINTAXE,SPROC,TIPO FROM HAD_CAD_SPROC WHERE 1=0 UNION ALL
SELECT 'N', 'S', 'N', 'BEGIN'||CHR(10)||' IF TRPV_EPA__ERG_APOSENTADORIA(PCK_ERG_APOSENTADORIA.P_ERG_APOSENTADORIA(:1),PCK_ERG_APOSENTADORIA.P_ERG_APOSENTADORIA_OLD(:1),:2=''S'',:3=''S'',:4=''S'',:5) THEN :6 := ''S'';'||CHR(10)||' ELSE :6 := ''N''; END IF;'||CHR(10)||'END;', 'EPA__ERG_APOSENTADORIA', 'EPA' FROM DUAL
) TEMP_20171222093139
WHERE (SPROC) NOT IN
  (SELECT SPROC FROM HAD_CAD_SPROC)
/
COMMIT;
EXEC EXEC_SQL_HADES('ALTER TABLE HAD_CAD_SPROC ENABLE ALL TRIGGERS')
SET SCAN ON

-----------------------------------
INSERT INTO HAD_FIX
(IDENT,DESCRICAO,DATAALTERACAO,SIS,TIPOOBJ,OBJETO,VERSAO)
VALUES
('RioPrev.Aposent.CadEps','Cadastramento dos EPs da aplicação',TO_DATE('04/12/2017','DD/MM/YYYY'),
 'C_Ergon','SCRIPT','cadEps.sql','1.00')
/
COMMIT
/
-- FIM --------------------------------- 

