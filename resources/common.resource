*** Settings ***
Resource    api.resource
Resource    pageobjects/home.resource
Resource    pageobjects/common.resource
Library     Browser


*** Variables ***
${BROWSER}      chromium
${HEADLESS}     false


*** Keywords ***
Open Automation Exercise Page
    New Browser    browser=${BROWSER}    headless=${HEADLESS}
    New Context    locale=en-GB
    New Page    https://automationexercise.com/
    Click Consent Button
    Verify Homepage Is Visible

Common Test Teardown
    Close Context
    Close Browser

Common User Test Teardown
    [Arguments]    ${login_info}
    Delete Account With API    ${login_info}
    Common Test Teardown
