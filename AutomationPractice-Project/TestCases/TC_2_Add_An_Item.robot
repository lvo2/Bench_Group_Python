*** Settings ***
Documentation     Add an item when you logged in the website successfully
Test Teardown     Close Browser
Resource          ../Resources/resources.robot

*** Test Cases ***
Senario: Add an item into cart
    Given the user want to login page
    When user want to add an item
    Then display my cart

*** Keywords ***
The user want to login page
    Login Page

User want to add an item
    Check Cart In Case Hover On Image
