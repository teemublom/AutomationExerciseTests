*** Settings ***
Library     Browser


*** Keywords ***
Verify Single Product
    [Arguments]    ${expected_product_info}    ${expected_row_id}
    VAR    ${productpath}    //table[@id="cart_info_table"]/tbody/tr[${expected_row_id}]
    Get Text    ${productpath}/td[@class="cart_description"]/h4/a    equals    ${expected_product_info}[name]
    Get Text    ${productpath}/td[@class="cart_price"]/p    equals    ${expected_product_info}[price]
    Get Text    ${productpath}/td[@class="cart_quantity"]/button    equals    ${expected_product_info}[qty]
