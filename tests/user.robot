*** Settings ***
Resource            ../resources/common.resource
Resource            ../resources/actions/login.resource
Variables           ../resources/login_info.yaml

Test Setup          Create Account With API    ${DEFAULT_ACCOUNT_INFO}
Test Teardown       Common User Test Teardown    ${DEFAULT_LOGIN_INFO}


*** Test Cases ***
Register New User
    [Setup]    No Operation
    Signup Test Setup
    Enter All Account Information    ${DEFAULT_ACCOUNT_INFO}
    Click Create Account
    Click Continue Button
    Verify Login    ${DEFAULT_USERNAME}

Register User With Existing Email
    Signup Test Setup
    Verify Error Email Address Already Exist Is Visible

Login With Existing Account And Logout
    Login Test Setup
    Verify Login    ${DEFAULT_USERNAME}
    Click Logout Button

Login With Existing Account And Delete Account
    Login Test Setup
    Verify Login    ${DEFAULT_USERNAME}
    Click Delete Account

Login With Incorrect Account Credentials
    [Setup]    No Operation
    Login Test Setup    wrong.email@test.com    67890
    Verify Error Your Email Or Password Is Incorrect Is Visible
    [Teardown]    No Operation


*** Keywords ***
Signup Test Setup
    [Arguments]    ${name}=${DEFAULT_USERNAME}    ${email}=${DEFAULT_EMAIL}
    Open Automation Exercise Page
    Click Signup Tab Link And Verify Login Page Is Visible
    Enter Signup Info And Click Signup    ${name}    ${email}

Login Test Setup
    [Arguments]    ${email}=${DEFAULT_EMAIL}    ${password}=${DEFAULT_PASSWORD}
    Open Automation Exercise Page
    Click Signup Tab Link And Verify Login Page Is Visible
    Enter Login Info And Click Login    ${email}    ${password}
