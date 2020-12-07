*** Settings ***
Test Teardown     Close Browser
Library           Selenium2Library
Library           String
Library           Screenshot

*** Variables ***
${Username}       vongoclien@gmail.com
${Password}       lienvo@123
${Browser}        Chrome
${SiteUrl}        http://automationpractice.com/index.php
${DashboardTitle}    LinkedIn: Log In or Sign Up
${DashboardTitleAfterLogin}    LinkedIn Login, Sign in | LinkedIn

*** Test Cases ***
Senario: Login Should Failed with Unregistered Mail Address
    Open LinkedinPage
    Check Title
    Enter User Name
    Enter Wrong Password
    Click Login
    Expected Message Error

*** Keywords ***
Open LinkedinPage
    open browser    ${SiteUrl}    ${Browser}
    Maximize Browser Window

Check Title
    Title Should be    ${DashboardTitle}

Enter User Name
    Input Text    id=session_key    ${Username}

Enter Wrong Password
    Input Text    id=session_password    ${Password}

Click Login
    Click Button    xpath: //*[@id="header"]/div[2]/div/div/nav/div[1]/a
    Wait Until Element Is Visible    id=error-for-password
    Take Screenshot

Expected Message Error
    ${getText}    Get Text    id=error-for-password
    Log Many    ${getText}
    Take Screenshot
    [Teardown]
