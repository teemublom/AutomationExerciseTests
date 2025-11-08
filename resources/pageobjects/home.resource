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