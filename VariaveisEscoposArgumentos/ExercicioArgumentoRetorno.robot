*** Settings ***
Documentation    Exercícios usando variáveis como argumentos em keywords
Library    String

*** Variables ***
&{PESSOA}    Nome=Isaías    Sobrenome=Ferreira

*** Test Cases ***
Gerar email para pessoa
    ${DADOS_EMAIL}    Criar email aleatório    ${PESSOA.Nome}    ${PESSOA.Sobrenome}
    Log To Console    ${DADOS_EMAIL}

*** Keywords ***
Criar email aleatório
    [Arguments]       ${NOME}    ${SOBRENOME}
    ${ALEATORIO}      Generate Random String
    ${EMAIL_FINAL}    Set Variable    ${NOME}${SOBRENOME}${ALEATORIO}@email.com
    [Return]          ${EMAIL_FINAL}