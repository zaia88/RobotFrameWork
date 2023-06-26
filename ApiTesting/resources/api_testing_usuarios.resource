*** Settings ***
Library    RequestsLibrary
Library    String
Library    Collections

*** Keywords ***
Criar Sessão na ServeRest
    ${headers}    Create Dictionary
    ...    accept=application/json    
    ...    Content-Type=application/json
    Create Session    
    ...    alias=ServeRest    
    ...    url=https://serverest.dev
    ...    headers=${headers}

Criar email aleatório para cadastrar novo usuário
    ${palavra_aleatoria}    Generate Random String    length=4    chars=[LETTERS]
    ${palavra_aleatoria}    Convert To Lower Case    ${palavra_aleatoria}
    Set Test Variable    ${EMAIL_TESTE}    ${palavra_aleatoria}@emailteste.com
    Log    ${EMAIL_TESTE}

Cadastrar o usuário criado na ServeRest
    [Arguments]    ${email}    ${status_code_desejado}
    ${body}    Create Dictionary    
    ...    nome=Fulano da Silva    
    ...    email=${email}    
    ...    password=1234    
    ...    administrador=true
    Log    ${body}
    
    Criar Sessão na ServeRest

    ${resposta}    POST On Session
    ...    alias=ServeRest
    ...    url=/usuarios
    ...    json=${body}
    ...    expected_status=${status_code_desejado}
    Log    ${resposta.json()}
    Set Test Variable    ${RESPOSTA}    ${resposta.json()}

Conferir se o usuário foi cadastrado corretamente
    Log    ${RESPOSTA}
    Dictionary Should Contain Item    ${RESPOSTA}    message    Cadastro realizado com sucesso
    Dictionary Should Contain Key    ${RESPOSTA}    key=_id

Vou repetir o cadastro do usuário
    Cadastrar o usuário criado na ServeRest    email=${EMAIL_TESTE}    status_code_desejado=400

Verificar se a API não permitiu o cadastro repetido
    Dictionary Should Contain Item    ${RESPOSTA}    message    Este email já está sendo usado