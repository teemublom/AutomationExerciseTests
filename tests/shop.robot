*** Settings ***
Resource            ../resources/common.resource
Resource            ../resources/actions/products.resource

Test Setup          Shop Test Setup
Test Teardown       Common Test Teardown


*** Test Cases ***
Verify All Products Page And Product Detail Page
    Click First Products View Product And Verify Product Details Are Visible

Use Product Search
    Fill Search Term Into Product Search And Click Search Button    v-neck
    Verify Searched Products Text And All Products Related To Search Are Visible    Pure Cotton V-Neck T-Shirt

Add Products In Cart
    ${prod1}    Add Product To Cart    1
    Click Modal Continue Shopping
    ${prod2}    Add Product To Cart    2
    Click Modal View Cart
    @{expected_products}    Create List    ${prod1}    ${prod2}
    Verify Cart Contents    ${expected_products}

Add Quantity Of Product In Cart
    Add N Of A Product To Cart    4
    Click Modal View Cart
    VAR    &{product}    name=Blue Top    price=Rs. 500    qty=4
    VAR    @{expected_products}    ${product}
    Verify Cart Contents    ${expected_products}

*** Keywords ***
Shop Test Setup
    Open Automation Exercise Page
    Click Products Tab Link And Verify Products Page And List Are Visible
