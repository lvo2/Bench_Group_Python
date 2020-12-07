*** Settings ***
Test Teardown     Close Browser
Library           Selenium2Library
Library           Screenshot

*** Variables ***
${Username}       vongoclien@gmail.com
${Password}       lienvo@123
${Browser}        Chrome
${SiteUrl}        http://automationpractice.com/index.php

*** Test Cases ***
Senario: Login Successfully in Automation Practice Site
    Open Automation Practice Page
    Click Login
    Enter User Name
    Enter Wrong Password
    Click SignUp
    Expected Login Success

*** Keywords ***
Open Automation Practice Page
    open browser    ${SiteUrl}    ${Browser}
    Maximize Browser Window

Click Login
    Click Element    class:login

Enter User Name
    Wait Until Element Is Visible    id=email
    Input Text    id=email    ${Username}

Enter Wrong Password
    Input Text    id=passwd    ${Password}

Click SignUp
    Click Button    id=SubmitLogin

Expected Login Success
    Wait Until Element Is Visible    xpath://*[@id="center_column"]/h1
    Take Screenshot
    [Teardown]
