*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary
Library           Screenshot

*** Variables ***
${Username}       vongoclien@gmail.com
${Password}       lienvo@123
${Browser}        Chrome
${Delay}          2s
${SiteUrl}        http://automationpractice.com/index.php
${CategoryWomen}    xpath://*[@id="block_top_menu"]/ul/li[1]/a
${CategoryType}    xpath://*[@id="categories_block_left"]/div/ul/li[2]/a
${Item}           xpath://*[@id="center_column"]/ul/li[5]
${MyCart}         xpath://*[@id="header"]/div[3]/div/div/div[3]/div/a

*** Keywords ***
Open Browser To Home Page
    Open Browser    ${SiteUrl}    ${Browser}
    Maximize Browser Window
    Set Selenium Speed    ${Delay}
    Open To Login Page

Open To Login Page
    Click Element    class:login

Input Username
    Input Text    id:email    ${Username}

Input Password
    Input Text    id:passwd    ${Password}

Submit Credentials
    Click Button    id:SubmitLogin

Welcome Page Should Be Open
    Wait Until Element Is Visible    xpath://*[@id="center_column"]/h1
    ${Text}    Get Text    xpath://*[@id="center_column"]/h1
    Log    ${Text}
    Take Screenshot

Login Page
    Open Browser    ${SiteUrl}    ${Browser}
    Maximize Browser Window
    Click Element    class:login
    Wait Until Element Is Visible    id:email
    Input Text    id:email    ${Username}
    Input Text    id:passwd    ${Password}
    Click Button    id:SubmitLogin
    Check Cart

Check Cart
    ${ItemUnit}    Get Text    xpath://*[@id="header"]//span[5]
    Run Keyword If    '${ItemUnit}' == '(empty)'    Add An Item

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

Display An Item Added
    Scroll Element Into View    ${MyCart}
    Mouse Over    xpath://*[@id="header"]/div[3]/div/div/div[3]/div/a
    Take Screenshot
