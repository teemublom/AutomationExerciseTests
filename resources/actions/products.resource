*** Settings ***
Library     Collections
Library     Browser
Resource    ../pageobjects/common.resource
Resource    ../pageobjects/cart.resource
Resource    ../pageobjects/checkout.resource
Resource    ../pageobjects/products.resource
Resource    ../pageobjects/product_details.resource
Resource    ../pageobjects/payment.resource


*** Keywords ***
Click Products Tab Link And Verify Products Page And List Are Visible
    Click Products Tab Link
    Verify All Products Text Is Visible
    Verify Products List Is Visible

Click First Products View Product And Verify Product Details Are Visible
    Click First Products View Product Button
    Verify Product Information Element Is Visible
    Verify Product Name Is Visible
    Verify Product Category Is Visible
    Verify Product Price Is Visible
    Verify Product Availability Is Visible
    Verify Product Brand Is Visible

Fill Search Term Into Product Search And Click Search Button
    [Arguments]    ${search_term}
    Fill Search Term Into Product Search    ${search_term}
    Click Submit Search Button

Verify Searched Products Text And All Products Related To Search Are Visible
    [Arguments]    ${expected_product_name}
    Verify Searched Products Text Is Visible
    Verify Search Results Contain Product    ${expected_product_name}

Add Product To Cart
    [Documentation]    Adds the N:th product to cart.
    ...    Returns product name and price in a dictionary
    [Arguments]    ${Nth_product}
    VAR    ${product_path}    //div[@class="features_items"]/div[@class="col-sm-4"][${Nth_product}]/div/div/div
    ${product_name}    Get Text    ${product_path}/p
    ${product_price}    Get Text    ${product_path}/h2
    VAR    &{product_info}    name=${product_name}    price=${product_price}    qty=1
    Hover    ${product_path}/a
    Sleep    1
    Click    ${product_path}/a
    RETURN    ${product_info}

Add Products To Cart
    [Documentation]    Receives as argument a list of product indexes. Adds those products to cart and
    ...    returns a list of the added products' info.
    [Arguments]    @{args}
    VAR    ${product}
    VAR    @{product_list}
    FOR    ${Nth_product}    IN    @{args}
        ${product}    Add Product To Cart    ${Nth_product}
        Click Modal Continue Shopping
        Append To List    ${product_list}    ${product}
    END
    RETURN    ${product_list}
    

Add N Of A Product To Cart
    [Arguments]    ${n}
    Click First Products View Product Button
    Verify Product Information Element Is Visible
    Change Product Quantity    ${n}
    Click Add To Cart

Verify Cart Contents
    [Documentation]    Takes in a list of dicts where each entry in the list is the info of a product expected to be in the cart.
    ...    Currently expects products to be in the cart in the order they were added.
    [Arguments]    ${expected_cart_contents}
    VAR    ${index}    0
    FOR    ${item}    IN    @{expected_cart_contents}
        ${index}    Evaluate    ${index} + 1
        Verify Single Product    ${item}    ${index}
    END

Go To Cart
    Click Cart Tab Link
    Verify Cart Page Is Visible

Verify Checkout
    [Arguments]    ${acc_info}    ${expected_products}    ${comment}
    Verify Delivery Address    ${acc_info}
    Verify Cart Contents    ${expected_products}
    Enter Order Comment    ${comment}

Common Checkout Procedure
    [Arguments]    ${acc_info}    ${expected_products}    ${comment}    ${card_info}
    Click Proceed To Checkout
    Verify Checkout    ${acc_info}    ${expected_products}    ${comment}
    Click Place Order
    Enter Card Info    ${card_info}
    Click Pay And Confirm Order
    Verify Order Success Message
