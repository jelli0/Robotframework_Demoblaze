*** Settings ***
Resource            ../Testcase/setup.robot
Variables            ../Data/homepage.py
Variables            ../Data/testdata.py
Test Setup          Start Test Case


*** Test Cases ***
01.Register with valid account
    [Tags]    Register
    Click Element    ${RegisterMenu}
    Wait Until Element Is Visible    //input[@id='sign-username']
    Input Text    //input[@id='sign-username']    Jelly
    Input Text    ${RegisterPassword}    ${Password}
    Click Element    ${ButtonRegister}
    Handle Alert    ACCEPT

02.Register with invalid account
    [Tags]    Register
    Click Element    ${RegisterMenu}
    Input Text    ${RegisterUsername}    ${Username}
    Input Text    ${RegisterPassword}    ${EMPTY}
    Click Element    ${ButtonRegister}
    Handle Alert    ACCEPT

03.Login with valid account
    [Tags]    Login
    Click Element    ${LoginMenu}
    Input Text    ${LoginUsername}    ${Username}
    Input Text    ${LoginPassword}    ${Password}
    Click Element    ${ButtonLogin}
    Wait Until Element Is Visible    ${LoginUserWelcome}

04. Login with invalid account
    [Tags]    Login
    Click Element    ${LoginMenu}
    Input Text    ${LoginUsername}    ${Username}
    Input Text    ${LoginPassword}    InvalidPassword
    Click Element    ${ButtonLogin}
    Handle Alert    ACCEPT