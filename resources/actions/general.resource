*** Settings ***
Library     Browser
Resource    ../pageobjects/test_cases.resource
Resource    ../pageobjects/common.resource
Resource    ../pageobjects/contact_us.resource
Resource    ../pageobjects/home.resource


*** Keywords ***
Click Test Cases Tab Link And Verify Test Cases Page Is Visible
    Click Test Cases Tab Link
    Verify Test Cases Header Is Visible

Click Contact Us Tab Link And Verify Contact Us Page Is Visible
    Click Contact Us Tab Link
    Verify Get In Touch Text Is Visible

Fill Contact Us Form Details And Submit
    [Arguments]    ${name}    ${email}    ${subject}    ${message}    ${filename}
    Fill Contact Form Name    ${name}
    Fill Contact Form Email    ${email}
    Fill Contact Form Subject    ${subject}
    Fill Contact Form Message    ${message}
    Upload File In Contact Form    ${filename}
    Click Submit Button

Fill Subscription Form And Click Subscription Button
    [Arguments]    ${email}
    Scroll To Footer
    Verify Footer Subscription Text Is Visible
    Fill Email Into Subscription Field    ${email}
    Click Submit Subscription Button
    Verify Successful Subscription Message Is Visible

Navigate To Subcategory
    [Arguments]    ${category_name}    ${subcategory_name}    ${category_title}
    Expand Category    ${category_name}
    Click Subcategory    ${category_name}    ${subcategory_name}
    Verify Category Title Is Visible    ${category_title}