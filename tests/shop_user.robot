*** Settings ***
Resource            ../resources/common.resource
Resource            ../resources/actions/products.resource
Resource            ../resources/actions/login.resource
Resource            ../resources/pageobjects/checkout.resource
Resource            ../resources/pageobjects/payment.resource
Variables            ../resources/login_info.yaml
Variables            ../resources/card_info.yaml

Test Setup          Open Automation Exercise Page
Test Teardown       Common Test Teardown

*** Variables ***
${ORDER_COMMENT}    Test comment


*** Test Cases ***
Place Order And Register While Checkout
    ${prod1}    Add Product To Cart    3
    Click Modal Continue Shopping
    ${prod2}    Add Product To Cart    4
    VAR    @{expected_products}    ${prod1}    ${prod2}
    Go To Cart
    Click Proceed To Checkout
    Click Modal RegisterLogin Link
    Enter Name And Email Address To Signup And Click Signup Button    ${DEFAULT_USERNAME}    ${DEFAULT_EMAIL}
    Enter All Account Information    ${DEFAULT_ACCOUNT_INFO}
    Click Create Account
    Click Continue Button
    Verify Login    ${DEFAULT_USERNAME}
    Click Cart Tab Link
    Click Proceed To Checkout
    Verify Delivery Address    ${DEFAULT_ACCOUNT_INFO}
    Verify Cart Contents    ${expected_products}
    Enter Order Comment    ${ORDER_COMMENT}
    Click Place Order
    Enter Card Info    ${CARD_INFO}
    Click Pay And Confirm Order
    Verify Order Success Message
    Click Delete Account
