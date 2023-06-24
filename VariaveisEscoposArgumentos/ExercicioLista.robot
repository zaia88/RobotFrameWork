*** Settings ***
Documentation    Teste com meses usando variavel do tipo lista

*** Variables ***
#Variável do tipo lista
@{MESES_DO_ANO}    Janeiro    Fevereiro    Março    Abril    Maio    Junho    Julho    Agosto    Setembro    Outubro    Novembro    Dezembro

*** Test Cases ***
Exibir meses do ano
    Os meses do ano são

*** Keywords ***
Os meses do ano são
    Log To Console    O primeiro mês do ano é ${MESES_DO_ANO[0]}
    Log To Console    O segundo mês do ano é ${MESES_DO_ANO[1]}
    Log To Console    O terceiro mês do ano é ${MESES_DO_ANO[2]}
    Log To Console    O quarto mês do ano é ${MESES_DO_ANO[3]}
    Log To Console    O quinto mês do ano é ${MESES_DO_ANO[4]}
    Log To Console    O sexto mês do ano é ${MESES_DO_ANO[5]}
    Log To Console    O sétimo mês do ano é ${MESES_DO_ANO[6]}
    Log To Console    O oitavo mês do ano é ${MESES_DO_ANO[7]}
    Log To Console    O nono mês do ano é ${MESES_DO_ANO[8]}
    Log To Console    O décimo mês do ano é ${MESES_DO_ANO[9]}
    Log To Console    O décimo primeiro mês do ano é ${MESES_DO_ANO[10]}
    Log To Console    O último mês do ano é ${MESES_DO_ANO[11]}