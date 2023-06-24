*** Settings ***
Documentation    Essa suite testa o site Amazon.com.br
Resource         amazon_gherkin_bdd_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
Caso de Teste 01 - Acesso ao menu "Eletrônicos"
    [Documentation]    Este teste verifica o menu eletrônicos do site da Amazon.com.br
    ...                e verifica a categoria Computadores e Informática
    [Tags]            menus    categorias
    Dado que estou na home page da Amazon.com.br
    Quando acessar o menu "Eletrônicos"
    E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    E a categoria "Computadores e Informática" deve ser exibida na página

Caso de Teste 02 - Pesquisa de um Produto
    [Documentation]    Esse teste verifica a busca de um produto
    [Tags]            busca_produtos    lista_busca
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Xbox Series S"
    Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    E um produto da linha "Xbox Series S" deve ser mostrado na página

Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho
    Dado que pesquiso pelo produto "Xbox Series S" na home page da Amazon.com.br
    E um produto da linha "Xbox Series S" deve ser mostrado na página
    E seleciono o produto "Xbox Series S" filtrado
    Quando adicionar o produto "Xbox Series S" no carrinho
    Então o produto "Xbox Series S" deve ser exibido na página do carrinho
 
Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho
    Dado que adiciono o produto "Xbox Series S" no carrinho da home page Amazon.com.br
    E o produto "Xbox Series S" é exibido no carrinho
    Quando remover o produto "Xbox Series S" do carrinho
    Então é exibida a mensagem "Seu carrinho de compras da Amazon está vazio."