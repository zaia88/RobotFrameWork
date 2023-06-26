*** Settings ***
Documentation    Teste com meses usando variavel do tipo dicionário

*** Variables ***
#Variável do tipo dicionário
&{MESES}    Jan=31
    ...     Fev=28
    ...     Mar=31
    ...     Abr=30
    ...     Mai=31
    ...     Jun=30
    ...     jul=31
    ...     Ago=31
    ...     Set=30
    ...     Out=31
    ...     Nov=30
    ...     Dez=31

*** Test Cases ***
Quantidade de dias em cada mês
    Log To Console    Janeiro possui ${MESES.Jan} dias
    Log To Console    Fevereiro possui ${MESES.Fev} dias
    Log To Console    Março possui ${MESES.Mar} dias
    Log To Console    Abril possui ${MESES.Abr} dias
    Log To Console    Maio possui ${MESES.Mai} dias
    Log To Console    Junho possui ${MESES.Jun} dias
    Log To Console    julho possui ${MESES.jul} dias
    Log To Console    Agosto possui ${MESES.Ago} dias
    Log To Console    Setembro possui ${MESES.Set} dias
    Log To Console    Outubro possui ${MESES.Out} dias
    Log To Console    Novembro possui ${MESES.Nov} dias
    Log To Console    Dezembro possui ${MESES.Dez} dias