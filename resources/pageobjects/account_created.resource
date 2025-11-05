*** Settings ***
Library     Browser


*** Keywords ***
Verify Account Created Text Is Visible
    Get Text    "Account Created!"

Click Account Created Continue Button
    Click    //a[@data-qa="continue-button"]
