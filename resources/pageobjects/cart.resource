*** Settings ***
Library     Browser


*** Keywords ***
Verify Single Product
    [Arguments]    ${expected_product_info}    ${expected_row_id}
    VAR    ${productpath}    //table[contains(@class, table-condensed)]/tbody/tr[${expected_row_id}]
    Get Text    ${productpath}/td[@class="cart_description"]/h4/a    equals    ${expected_product_info}[name]
    Get Text    ${productpath}/td[@class="cart_price"]/p    equals    ${expected_product_info}[price]
    Get Text    ${productpath}/td[@class="cart_quantity"]/button    equals    ${expected_product_info}[qty]

Verify Cart Page Is Visible
    Wait For Elements State    //div[@id="cart_info"]    visible

Click Proceed To Checkout
    Click    //a[contains(@class, "check_out")]

Click Modal RegisterLogin Link
    Click    //div[contains(@class, "modal-dialog")] >> //a[@href="/login"]
