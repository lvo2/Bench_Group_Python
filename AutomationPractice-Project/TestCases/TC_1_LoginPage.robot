*** Settings ***
Documentation     A test suite with a single Gherkin style test.
...
...               As user want \ to login to the site
Test Teardown     Close Browser
Resource          ../Resources/resources.robot

*** Test Cases ***
Valid Login
    Given browser is opened to login page
    When user logs in with password
    Then welcome page should be open

*** Keywords ***
Browser is opened to login page
    Open Browser To Home Page

User click to login button
    Login Button

User logs in with password
    Input username
    Input password
    Submit credentials
