*** Settings ***
Library     Browser


*** Keywords ***
Click Consent Button
    Click    //p[@class="fc-button-label" and .="Consent"]

Verify Homepage Is Visible
    Get Text    //h2[.="Category"]

Verify Categories Are Visible
    Wait For Elements State    //div[@class="left-sidebar"] >> text=Category

Expand Category
    [Arguments]    ${category_name}
    Click    //div[@id="accordian"] >> text="${category_name}"

Click Subcategory
    [Arguments]    ${category_id}    ${subcategory_name}
    Click    //div[@id="accordian"] >> //div[@id="${category_id}"] >> text="${subcategory_name}"

Verify Category Title Is Visible
    [Arguments]    ${title}
    Wait For Elements State    text=${title}

Scroll To Recommended Items
    Scroll To Element    //div[@id="recommended-item-carousel"]

Click A Recommended Item
    Click    //div[@id="recommended-item-carousel"] >> //div[@class="item active"]/div[1] >> text=Add to cart

Click Up Arrow
    Click    //a[@id="scrollUp"]

Verify Intro Text Is Visible
    Wait For Elements State
    ...    //div[@id="slider-carousel"] >> //div[@class="item active"] >> text=Full-Fledged practice website for Automation Engineers
