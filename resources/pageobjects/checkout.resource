*** Settings ***
Library     Browser


*** Keywords ***
Verify Delivery Address
    [Arguments]    ${login_info}
    Get Text    //ul[@id="address_delivery"]/li[@class="address_firstname address_lastname"]
    ...    equals    ${login_info}[title]. ${login_info}[firstname] ${login_info}[lastname]
    Get Text    //ul[@id="address_delivery"]/li[@class="address_address1 address_address2"][1]
    ...    equals    ${login_info}[company]
    Get Text    //ul[@id="address_delivery"]/li[@class="address_address1 address_address2"][2]
    ...    equals    ${login_info}[address1]
    Get Text    //ul[@id="address_delivery"]/li[@class="address_address1 address_address2"][3]
    ...    equals    ${login_info}[address2]
    Get Text    //ul[@id="address_delivery"]/li[contains(@class, "address_city")]
    ...    equals    ${login_info}[city] ${login_info}[state] ${login_info}[zipcode]
    Get Text    //ul[@id="address_delivery"]/li[@class="address_country_name"]
    ...    equals    ${login_info}[country]
    Get Text    //ul[@id="address_delivery"]/li[@class="address_phone"]
    ...    equals    ${login_info}[mobile_number]

Enter Order Comment
    [Arguments]    ${comment}
    Fill Text    //textarea[@class="form-control"]    ${comment}

Click Place Order
    Click    //a[@href="/payment"]
