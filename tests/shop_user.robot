*** Settings ***
Resource            ../resources/common.resource
Resource            ../resources/actions/products.resource
Resource            ../resources/actions/login.resource
Resource            ../resources/api.resource
Variables           ../resources/login_info.yaml
Variables           ../resources/card_info.yaml

Test Setup          Open Automation Exercise Page
Test Teardown       Common Test Teardown


*** Variables ***
${ORDER_COMMENT}    Test comment


*** Test Cases ***
Place Order: Register While Checkout
    ${expected_products}    Add Products To Cart    3    4
    Go To Cart
    Click Proceed To Checkout
    Click Modal RegisterLogin Link
    Common Signup Procedure    ${DEFAULT_ACCOUNT_INFO}
    Go To Cart
    Common Checkout Procedure    ${DEFAULT_ACCOUNT_INFO}    ${expected_products}    ${ORDER_COMMENT}    ${CARD_INFO}
    Click Delete Account

Place Order: Register Before Checkout
    Click Signup Tab Link And Verify Login Page Is Visible
    Common Signup Procedure    ${DEFAULT_ACCOUNT_INFO}
    ${expected_products}    Add Products To Cart    3    4
    Go To Cart
    Common Checkout Procedure    ${DEFAULT_ACCOUNT_INFO}    ${expected_products}    ${ORDER_COMMENT}    ${CARD_INFO}
    Click Delete Account

Place Order: Login Before Checkout
    Create Account With API    ${DEFAULT_ACCOUNT_INFO}
    Click Signup Tab Link And Verify Login Page Is Visible
    Enter Login Info And Click Login    ${DEFAULT_EMAIL}    ${DEFAULT_PASSWORD}
    Verify Logged In As Username Is Visible    ${DEFAULT_USERNAME}
    ${expected_products}    Add Products To Cart    1    2
    Go To Cart
    Common Checkout Procedure    ${DEFAULT_ACCOUNT_INFO}    ${expected_products}    ${ORDER_COMMENT}    ${CARD_INFO}
    Click Delete Account
