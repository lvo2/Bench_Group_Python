*** Settings ***
Documentation     Add an item when you logged in the website successfully
Test Teardown     Close Browser
Resource          ../Resources/resources.robot

*** Test Cases ***
Senario: Delete an item from cart
    Given the user want to login page
    When user checks on cart
    Then Display My Cart

*** Keywords ***
The user want to login page
    Login Page

User checks on cart
    Check Cart If Existed An Item
