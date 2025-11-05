*** Settings ***
Library     Browser


*** Keywords ***
Verify Account Deleted Text Is Visible
    Get Text    "Account Deleted!"

Click Account Deleted Continue Button
    Click    //a[@data-qa="continue-button"]
