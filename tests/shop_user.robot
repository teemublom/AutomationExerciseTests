*** Settings ***
Library             OperatingSystem
Resource            ../resources/common.resource
Resource            ../resources/actions/products.resource
Resource            ../resources/actions/login.resource
Resource            ../resources/api.resource
Variables           ../resources/login_info.yaml
Variables           ../resources/card_info.yaml

Test Setup          Open Automation Exercise Page
Test Teardown       Common User Test Teardown    ${DEFAULT_LOGIN_INFO}


*** Variables ***
${ORDER_COMMENT}    Test comment


*** Test Cases ***
Place Order: Register While Checkout
    ${expected_products}    Add Products To Cart    3    4
    Go To Cart Page
    Click Proceed To Checkout
    Click Modal RegisterLogin Link
    Common Signup Procedure    ${DEFAULT_ACCOUNT_INFO}
    Go To Cart Page
    Common Checkout Procedure    ${DEFAULT_ACCOUNT_INFO}    ${expected_products}    ${ORDER_COMMENT}    ${CARD_INFO}
    Click Delete Account

Place Order: Register Before Checkout
    Click Signup Tab Link And Verify Login Page Is Visible
    Common Signup Procedure    ${DEFAULT_ACCOUNT_INFO}
    ${expected_products}    Add Products To Cart    3    4
    Go To Cart Page
    Common Checkout Procedure    ${DEFAULT_ACCOUNT_INFO}    ${expected_products}    ${ORDER_COMMENT}    ${CARD_INFO}
    Click Delete Account

Place Order: Login Before Checkout
    Create Account With API    ${DEFAULT_ACCOUNT_INFO}
    Click Signup Tab Link And Verify Login Page Is Visible
    Enter Login Info And Click Login    ${DEFAULT_EMAIL}    ${DEFAULT_PASSWORD}
    Verify Logged In As Username Is Visible    ${DEFAULT_USERNAME}
    ${expected_products}    Add Products To Cart    1    2
    Go To Cart Page
    Common Checkout Procedure    ${DEFAULT_ACCOUNT_INFO}    ${expected_products}    ${ORDER_COMMENT}    ${CARD_INFO}
    Click Delete Account

Search Products And Verify Cart After Login
    Create Account With API    ${DEFAULT_ACCOUNT_INFO}
    Click Products Tab Link And Verify
    Fill Search Term Into Product Search And Click Search Button    v-neck
    Verify Searched Products Text And All Products Related To Search Are Visible    Pure Cotton V-Neck T-Shirt
    ${expected_products}    Add Products To Cart    1
    Go To Cart Page
    Verify Cart Contents    ${expected_products}
    Click Signup Tab Link And Verify Login Page Is Visible
    Enter Login Info And Click Login    ${DEFAULT_EMAIL}    ${DEFAULT_PASSWORD}
    Go To Cart Page
    Verify Cart Contents    ${expected_products}

Add Review On Product
    Click First Products View Product Button
    Verify Write Your Review Is Visible
    Enter Review Details    ${DEFAULT_ACCOUNT_INFO}[name]    ${DEFAULT_EMAIL}    Hello! I really like this product!
    Click Submit Review
    Verify Review Success Message
    [Teardown]    No Operation

Verify Both Addresses During Checkout
    Click Signup Tab Link And Verify Login Page Is Visible
    Common Signup Procedure    ${DEFAULT_ACCOUNT_INFO}
    Add Products To Cart    2    4
    Go To Cart Page
    Click Proceed To Checkout
    Verify Address    ${DEFAULT_ACCOUNT_INFO}    delivery
    Verify Address    ${DEFAULT_ACCOUNT_INFO}    invoice
    Click Delete Account

Download Invoice After Purchase Order
    [Setup]    Open Automation Exercise Page
    ${expected_products}    Add Products To Cart    1    3    4
    Go To Cart Page
    Click Proceed To Checkout
    Click Modal RegisterLogin Link
    Common Signup Procedure    ${DEFAULT_ACCOUNT_INFO}
    Go To Cart Page
    Common Checkout Procedure    ${DEFAULT_ACCOUNT_INFO}    ${expected_products}    ${ORDER_COMMENT}    ${CARD_INFO}
    ${dl_promise}    Promise To Wait For Download
    Click Download Invoice
    ${file_obj}    Wait For    ${dl_promise}
    File Should Exist    ${file_obj}[saveAs]
    Should Be True    ${{ bool('${file_obj.suggestedFilename}') }}
    checkout.Click Continue Button
    Click Delete Account
