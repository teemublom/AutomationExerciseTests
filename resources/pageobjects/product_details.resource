*** Settings ***
Library     Browser


*** Keywords ***
Verify Product Information Element Is Visible
    Get Element    //div[@class="product-information"]

Verify Product Name Is Visible
    Get Text    //div[@class="product-information"]/h2

Verify Product Category Is Visible
    Get Text    //div[@class="product-information"]/p[1]    matches    Category:.+

Verify Product Price Is Visible
    Get Text    //div[@class="product-information"]/span/span    matches    Rs. \\d+$

Verify Product Availability Is Visible
    Get Text    //div[@class="product-information"]/p[2]    matches    Availability:.+

Verify Product Condition Is Visible
    Get Text    //div[@class="product-information"]/p[3]    matches    Condition:.+

Verify Product Brand Is Visible
    Get Text    //div[@class="product-information"]/p[4]    matches    Brand:.+

Change Product Quantity
    [Arguments]    ${n}
    Fill Text    //input[@id="quantity"]    ${n}

Click Add To Cart
    Click    text=Add to cart
