*** Settings ***
Documentation    Teste com meses usando variavel do tipo dicionário

*** Variables ***
#Variável do tipo dicionário
&{MESES}    mês=Janeiro      dias=31 dias
    ...     mês=Fevereiro    dias=28 dias
    ...     mês=Março        dias=31 dias
    ...     mês=Abril        dias=30 dias
    ...     mês=Maio         dias=31 dias
    ...     mês=Junho        dias=30 dias
    ...     mês=julho        dias=31 dias
    ...     mês=Agosto       dias=31 dias
    ...     mês=Setembro     dias=30 dias
    ...     mês=Outubro      dias=31 dias
    ...     mês=Novembro     dias=30 dias
    ...     mês=Dezembro     dias=31 dias

*** Test Cases ***
Quantidade de dias em cada mês
    Dias de cada mês
*** Keywords ***
Dias de cada mês
    Log To Console    O mês de ${MESES.mês} possui ${MESES.dias}