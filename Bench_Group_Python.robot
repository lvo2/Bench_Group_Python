*** Settings ***
Test Teardown     Close Browser
Library           SeleniumLibrary
Library           Screenshot

*** Variables ***
${Username}       vongoclien@gmail.com
${Password}       lienvo@123
${Browser}        Chrome
${SiteUrl}        http://automationpractice.com/index.php
${CategoryWomen}    xpath://*[@id="block_top_menu"]/ul/li[1]/a
${CategoryType}    xpath://*[@id="categories_block_left"]/div/ul/li[2]/a
${Item}           xpath://*[@id="center_column"]/ul/li[5]
${MyCart}         xpath://*[@id="header"]/div[3]/div/div/div[3]/div/a

*** Test Cases ***
Senario: Login Successfully in Automation Practice Site
    Open Automation Practice Page
    Click Login
    Enter User Name
    Enter Wrong Password
    Click SignUp
    Expected Login Success

Senario: Add an item into cart
    Login Page
    ${ItemUnit}    Get Text    xpath://*[@id="header"]//span[5]
    Run Keyword If    '${ItemUnit}' == '(empty)'    Add An Item

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

Add An Item
    Click Element    ${CategoryWomen}
    Click Element    ${CategoryType}
    Scroll Element Into View    ${Item}
    Mouse Over    xpath://*[@id="center_column"]/ul/li
    Wait Until Element Is Visible    xpath://*[@id="center_column"]/ul/li/div/div[2]/div[2]/a[1]/span
    Click Element    xpath://*[@id="center_column"]/ul/li/div/div[2]/div[2]/a[1]
    Wait Until Element Is Visible    id:layer_cart_product_title
    ${ProductName}    Get Text    id:layer_cart_product_title
    Click Element    xpath://*[@id="layer_cart"]/div[1]/div[1]/span
    Wait Until Element Is Visible    xpath://*[@id="center_column"]/ul/li[5]
    Scroll Element Into View    ${MyCart}
    Mouse Over    xpath://*[@id="header"]/div[3]/div/div/div[3]/div/a
    Take Screenshot
    [Teardown]
