create or replace PROCEDURE ep__conta_conexao (
  p_programa IN VARCHAR2,
  p_execucao IN NUMBER,
  p_grupo IN NUMBER,
  p_chave IN NUMBER)
IS
/**************** INICIO_HELP: ****************
----------------------------------------------------
Nome:
  PROCEDURE EP__CONTA_CONEXAO
Proposito:
  Esta procedure tem por finalidade executar procedimentos em PL-SQL, imediatamente apos o
  estabelecimento de conex?o ao banco, nos programas de calculo de contagem.
  No programa ServC0, os parametros que identificam uma execuc?o n?o estar?o disponiveis, pois
  este programa n?o 'abre' estes detalhes, o que e feito somente a partir do programa Conta0.
Parametros:
  P_PROGRAMA:
    texto de identificac?o do programa que esta abrindo a sess?o, possiveis valores:
    ServC0, Conta0, Conta0a, Conta2g, Conta1, Conta2 e Conta3;
  P_EXECUCAO:
    numero da execuc?o da contagem (n?o disponivel se o programa e ServC0);
  P_GRUPO:
    grupo que sera processado (n?o disponivel se o programa e ServC0);
  P_CHAVE:
    numero da chave de contagem (n?o disponivel se o programa e ServC0);
Utilizac?o:
  Este procedimento e chamado na func?o de conex?o ao banco, portanto logo no inicio da sess?o
  iniciada pelo programa, permitindo assim, entre outras coisas, alterar parametros de sess?o
  antes da execuc?o de queries e outros comandos SQL.
----------------------------------------------------
***************** FINAL_HELP: ****************/
    v_empresa_func  vinculos.emp_codigo%type;
BEGIN
  begin
    select v.emp_codigo
      into v_empresa_func
      from vinculos v, eleitos_ext ee
     where ee.grupo = p_grupo
       and v.numfunc = ee.numfunc
       and v.numero = ee.numvinc;
  exception
    when others then
        v_empresa_func := flag_pack.get_empresa;
  end;
  flag_pack.set_empresa(v_empresa_func);
END;
/
