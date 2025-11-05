*** Settings ***
Library     Browser


*** Keywords ***
Verify Signup Is Visible
    Get Text    text=New User Signup!

Verify Login Is Visible
    Get Text    text=Login to your account

Verify Email Password Error Is Visible
    Get Text    text=Your email or password is incorrect!

Verify Existing Email Address Error Is Visible
    Get Text    text=Email Address already exist!

Enter Login Email
    [Arguments]    ${email}
    Fill Text    //input[@data-qa="login-email"]    ${email}

Enter Login Password
    [Arguments]    ${password}
    Fill Text    //input[@data-qa="login-password"]    ${password}

Click Login Page Login Button
    Click    //button[.="Login"]

Enter Signup Name
    [Arguments]    ${name}
    Fill Text    //input[@data-qa="signup-name"]    ${name}

Enter Signup Email
    [Arguments]    ${email}
    Fill Text    //input[@data-qa="signup-email"]    ${email}

Click Signup Button
    Click    //button[.="Signup"]
