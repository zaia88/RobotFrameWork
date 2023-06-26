*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}               chrome
${URL}                   http://www.amazon.com.br
${MENU_ELETRONICOS}      //a[contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}    //h1[contains(.,'Eletrônicos e Tecnologia')]
${CAMPO_PESQUISA}        twotabsearchtextbox
${BOTAO_PESQUISA}        nav-search-submit-button
${ADICIONAR_CARRINHO}    add-to-cart-button
${CARRINHO}              //span[@aria-hidden='true'][contains(.,'Carrinho')]
${REMOVER_PRODUTO}       //input[contains(@value,'Excluir')]

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
Dado que pesquiso pelo produto "${NOME_PRODUTO}" na home page da Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}
    Input Text    locator=${CAMPO_PESQUISA}    text=${NOME_PRODUTO}
    Click Button    locator=${BOTAO_PESQUISA}
E seleciono o produto "${NOME_PRODUTO}" filtrado
    Wait Until Element Is Visible    locator=(//span[contains(.,'${NOME_PRODUTO}')])[5]
    Click Element    locator=(//span[contains(.,'${NOME_PRODUTO}')])[5]
Quando adicionar o produto "${NOME_PRODUTO}" no carrinho
    Wait Until Element Is Visible    locator=//span[@class='a-size-large product-title-word-break'][contains(.,'${NOME_PRODUTO}')]
    Click Element    locator=${ADICIONAR_CARRINHO}
Então o produto "${NOME_PRODUTO}" deve ser exibido na página do carrinho
    Click Element    locator=${CARRINHO}
    Element Should Be Visible    locator=//span[@class='a-truncate-cut'][contains(.,'${NOME_PRODUTO}')]
Dado que adiciono o produto "${NOME_PRODUTO}" no carrinho da home page Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}
    Input Text    locator=${CAMPO_PESQUISA}    text=${NOME_PRODUTO}
    Click Button    locator=${BOTAO_PESQUISA}
    Wait Until Element Is Visible    locator=(//span[contains(.,'${NOME_PRODUTO}')])[5]
    Click Element    locator=(//span[contains(.,'${NOME_PRODUTO}')])[5]
    Wait Until Element Is Visible    locator=//span[@class='a-size-large product-title-word-break'][contains(.,'${NOME_PRODUTO}')]
    Click Element    locator=${ADICIONAR_CARRINHO}
E o produto "${NOME_PRODUTO}" é exibido no carrinho
    Click Element    locator=${CARRINHO}
    Element Should Be Visible    locator=//span[@class='a-truncate-cut'][contains(.,'${NOME_PRODUTO}')]
Quando remover o produto "Xbox Series S" do carrinho
    Click Element    locator=${REMOVER_PRODUTO}
Então é exibida a mensagem "${MENSAGEM}"
    Wait Until Page Contains    text=${MENSAGEM}