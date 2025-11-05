*** Settings ***
Library     Browser


*** Keywords ***
Verify Get In Touch Text Is Visible
    Get Text    text=GET IN TOUCH

Fill Contact Form Name
    [Arguments]    ${name}
    Fill Text    //input[@data-qa="name"]    ${name}

Fill Contact Form Email
    [Arguments]    ${email}
    Fill Text    //input[@data-qa="email"]    ${email}

Fill Contact Form Subject
    [Arguments]    ${subject}
    Fill Text    //input[@data-qa="subject"]    ${subject}

Fill Contact Form Message
    [Arguments]    ${message}
    Fill Text    //textarea[@data-qa="message"]    ${message}

Upload File In Contact Form
    [Arguments]    ${filename}
    Upload File By Selector    //input[@type="file"]    ${filename}

Click Submit Button
    Click    //input[@data-qa="submit-button"]
