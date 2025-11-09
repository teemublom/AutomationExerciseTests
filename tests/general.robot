*** Settings ***
Resource            ../resources/common.resource
Resource            ../resources/actions/products.resource
Resource            ../resources/actions/general.resource
Variables           ../resources/login_info.yaml

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

View Category Products
    Verify Categories Are Visible
    Navigate To Subcategory    Women    Dress    Women - Dress Products
    Navigate To Subcategory    Men    Tshirts    Men - Tshirts Products

Add Recommended Item
    Scroll To Recommended Items
    ${product1}    Add Recommended Item To Cart    1
    VAR    @{expected_items}    ${product1}
    Click Modal View Cart
    Verify Cart Contents    ${expected_items}

Verify Up Arrow Functionality
    Scroll To    vertical=100%
    Verify Footer Subscription Text Is Visible
    Click Up Arrow
    Verify Intro Text Is Visible

Verify Scroll Up Functionality
    Scroll To    vertical=100%
    Verify Footer Subscription Text Is Visible
    Scroll To
    Verify Intro Text Is Visible
