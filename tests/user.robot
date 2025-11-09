*** Settings ***
Resource            ../resources/common.resource
Resource            ../resources/actions/login.resource
Resource            ../resources/api.resource
Variables           ../resources/login_info.yaml

Test Teardown       Common Test Teardown


*** Test Cases ***
Register New User
    Signup Test Setup
    Enter All Account Information    ${DEFAULT_ACCOUNT_INFO}
    Click Create Account
    Click Continue Button
    Verify Login    ${DEFAULT_USERNAME}
    Delete Account With API    ${DEFAULT_LOGIN_INFO}

Register User With Existing Email
    Create Account With API    ${DEFAULT_ACCOUNT_INFO}
    Signup Test Setup
    Verify Error Email Address Already Exist Is Visible
    Delete Account With API    ${DEFAULT_LOGIN_INFO}

Login With Existing Account And Logout
    Create Account With API    ${DEFAULT_ACCOUNT_INFO}
    Login Test Setup
    Verify Login    ${DEFAULT_USERNAME}
    Click Logout Button
    Delete Account With API    ${DEFAULT_LOGIN_INFO}

Login With Existing Account And Delete Account
    Create Account With API    ${DEFAULT_ACCOUNT_INFO}
    Login Test Setup
    Verify Login    ${DEFAULT_USERNAME}
    Click Delete Account

Login With Incorrect Account Credentials
    Login Test Setup    wrong.email@test.com    67890
    Verify Error Your Email Or Password Is Incorrect Is Visible


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
