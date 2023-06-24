*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}               chrome
${URL}                   http://www.amazon.com.br
${MENU_ELETRONICOS}      //a[contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}    //h1[contains(.,'Eletrônicos e Tecnologia')]
${CAMPO_PESQUISA}        twotabsearchtextbox
${BOTAO_PESQUISA}        nav-search-submit-button

*** Keywords ***
#GHERKIN STEPS
Abrir o navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window
Fechar o navegador
    Capture Page Screenshot
    Close Browser
Dado que estou na home page da Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}
Quando acessar o menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}
E o texto "${FRASE}" deve ser exibido na página
    Wait Until Page Contains    text=${FRASE}
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}
Então o título da página deve ficar "${TITULO}"
    Title Should Be    title=${TITULO}
E a categoria "${NOME_CATEGORIA}" deve ser exibida na página
    Element Should Be Visible    locator=//img[@alt='${NOME_CATEGORIA}']
Quando pesquisar pelo produto "${NOME_PRODUTO}"
    Input Text    locator=${CAMPO_PESQUISA}    text=${NOME_PRODUTO}
    Click Button    locator=${BOTAO_PESQUISA}
E um produto da linha "${NOME_PRODUTO}" deve ser mostrado na página
    Wait Until Element Is Visible    locator=(//span[contains(.,'${NOME_PRODUTO}')])[3]