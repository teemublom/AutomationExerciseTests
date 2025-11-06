*** Settings ***
Resource            ../resources/common.resource
Resource            ../resources/pageobjects/common.resource
Resource            ../resources/actions/general.resource

Variables    ../resources/login_info.yaml

Test Setup          Open Automation Exercise Page
Test Teardown       Common Test Teardown


*** Test Cases ***
Verify Test Cases Page
    Click Test Cases Tab Link And Verify Test Cases Page Is Visible

Test Contact Us Form
    Click Contact Us Tab Link And Verify Contact Us Page Is Visible
    Fill Contact Us Form Details And Submit
    ...    name=Matti Meikalainen
    ...    email=${DEFAULT_EMAIL}
    ...    subject=Feedback
    ...    message=Hello I have some feedback
    ...    filename=README.md

Test Subscription Form On Home Page
    Fill Subscription Form And Click Subscription Button    ${DEFAULT_EMAIL}

Test Subscription Form On Cart Page
    Click Cart Tab Link
    Fill Subscription Form And Click Subscription Button    ${DEFAULT_EMAIL}

Test Yaml Variable File
    Log    ${DEFAULT_ACCOUNT_INFO}
