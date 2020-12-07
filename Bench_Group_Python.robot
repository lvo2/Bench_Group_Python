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

Senario: Buy a T-Shirt
    Login Page
    Click An Item

*** Keywords ***
Open Automation Practice Page
    Open Browser    ${SiteUrl}    ${Browser}
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

Login Page
    Open Browser    ${SiteUrl}    ${Browser}
    Maximize Browser Window
    Click Element    class:login
    Wait Until Element Is Visible    id=email
    Input Text    id=email    ${Username}
    Input Text    id=passwd    ${Password}
    Click Button    id=SubmitLogin

Click An Item
    Click Element    xpath://*[@id="block_top_menu"]/ul/li[3]/a
    Mouse Over    xpath://*[@id="center_column"]/ul/li
    Wait Until Element Is Visible    xpath://*[@id="center_column"]/ul/li/div/div[2]/div[2]/a[1]/span
    Click Element    xpath://*[@id="center_column"]/ul/li/div/div[2]/div[2]/a[1]
    Wait Until Element Is Visible    xpath://*[@id="layer_cart"]/div[1]/div[2]/div[4]/a
    Click Element    xpath://*[@id="layer_cart"]/div[1]/div[2]/div[4]/a
    Wait Until Element Is Visible    xpath://*[@id="cart_title"]
    Take Screenshot
    [Teardown]
