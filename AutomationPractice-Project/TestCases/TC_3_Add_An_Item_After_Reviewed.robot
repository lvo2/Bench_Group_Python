*** Settings ***
Test Teardown     Close Browser
Resource          ../Resources/resources.robot

*** Test Cases ***
Senario: Add an item into cart
    Given the user want to login page
    When user want to view infor and add it
    Then display my cart

*** Keywords ***
The user want to login page
    Login Page

User want to view infor and add it
    Check Cart In Case Action On Image
