*** Settings ***
Library     Browser


*** Keywords ***
Verify Address
    [Documentation]    Verify billing or delivery address depending on the second argument
    [Arguments]    ${login_info}    ${delivery_or_invoice}
    VAR    ${prefix}    //ul[@id="address_${delivery_or_invoice}"]
    Get Text    ${prefix}/li[@class="address_firstname address_lastname"]
    ...    equals    ${login_info}[title]. ${login_info}[firstname] ${login_info}[lastname]
    Get Text    ${prefix}/li[@class="address_address1 address_address2"][1]
    ...    equals    ${login_info}[company]
    Get Text    ${prefix}/li[@class="address_address1 address_address2"][2]
    ...    equals    ${login_info}[address1]
    Get Text    ${prefix}/li[@class="address_address1 address_address2"][3]
    ...    equals    ${login_info}[address2]
    Get Text    ${prefix}/li[contains(@class, "address_city")]
    ...    equals    ${login_info}[city] ${login_info}[state] ${login_info}[zipcode]
    Get Text    ${prefix}/li[@class="address_country_name"]
    ...    equals    ${login_info}[country]
    Get Text    ${prefix}/li[@class="address_phone"]
    ...    equals    ${login_info}[mobile_number]

Enter Order Comment
    [Arguments]    ${comment}
    Fill Text    //textarea[@class="form-control"]    ${comment}

Click Place Order
    Click    //a[@href="/payment"]

Click Continue Button
    Click    //a[@data-qa="continue-button"]

Click Download Invoice
    Click    text=Download Invoice
