*** Settings ***
Library     Browser


*** Keywords ***
Verify All Products Text Is Visible
    Get Text    text=All Products

Verify Products List Is Visible
    Get Element    //div[@class="features_items"]

Click First Products View Product Button
    Click    //div[@class="features_items"]/div[2]/div/div/ul/li/a

Fill Search Term Into Product Search
    [Arguments]    ${search_term}
    Fill Text    id=search_product    ${search_term}

Verify Searched Products Text Is Visible
    Get Text    text=Searched Products

Click Submit Search Button
    Click    id=submit_search

Verify Search Results Contain Product
    [Arguments]    ${expected_product_name}
    Get Text    //div[@class="product-overlay"]/div[1]/p    equals    ${expected_product_name}

Verify Product Brands Are Visible
    Wait For Elements State    //div[@class="brands_products"]

Click Brand
    [Arguments]    ${brandname}
    Click    //div[@class="brands_products"] >> text="${brandname}"

Verify Brand Page Title Is Visible
    [Arguments]    ${title}
    Wait For Elements State    text="${title}"