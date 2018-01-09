SET SCAN OFF
ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY HH24:MI:SS';
ALTER SESSION SET NLS_NUMERIC_CHARACTERS = '.,';
EXEC EXEC_SQL_ERGON('ALTER TABLE ERG_GRUPOS_FREQ_ DISABLE ALL TRIGGERS')
INSERT INTO ERG_GRUPOS_FREQ_
(COEFICIENTE, DESCRICAO, FLEX_CAMPO_01, FLEX_CAMPO_02, FLEX_CAMPO_03, FLEX_CAMPO_04, FLEX_CAMPO_05, GRUPOFREQ, OBS)
SELECT * FROM (
SELECT COEFICIENTE,DESCRICAO,FLEX_CAMPO_01,FLEX_CAMPO_02,FLEX_CAMPO_03,FLEX_CAMPO_04,FLEX_CAMPO_05,GRUPOFREQ,OBS FROM ERG_GRUPOS_FREQ_ WHERE 1=0 UNION ALL
SELECT TO_NUMBER(''), 'Relat�rio de certid�o de regularidade previdenci�ria', '', '', '', '', '', 'CERT_PREVIDENCIARIA', 'Frequ�ncias utilizadas para emiss�o do relat�rio de certid�o de regularidade previdenci�ria' FROM DUAL
) TEMP_20170922131305
WHERE (GRUPOFREQ) NOT IN
  (SELECT GRUPOFREQ FROM ERG_GRUPOS_FREQ_)
/
COMMIT;
EXEC EXEC_SQL_ERGON('ALTER TABLE ERG_GRUPOS_FREQ_ ENABLE ALL TRIGGERS')
SET SCAN ON

declare
  cursor c1 is
    select empresa
      from hades.empresas;
begin
  for rr in c1 loop
    begin
      insert into ergon.ERG_GRUPOS_FREQ_EMPRESA(grupofreq, empresa) values ('CERT_PREVIDENCIARIA', rr.empresa);
      commit;
    exception
      when dup_val_on_index then
      null;
    end;
  end loop;
end;
/

asdasd
asda
