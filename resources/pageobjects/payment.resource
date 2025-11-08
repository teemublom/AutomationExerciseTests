*** Settings ***
Library     Browser


*** Keywords ***
Enter Card Info
    [Arguments]    ${card_info}
    Fill Text    //input[@data-qa="name-on-card"]    ${card_info}[firstname] ${card_info}[lastname]
    Fill Text    //input[@data-qa="card-number"]    ${card_info}[cardnumber]
    Fill Text    //input[@data-qa="cvc"]    ${card_info}[cvc]
    Fill Text    //input[@data-qa="expiry-month"]    ${card_info}[expiration_month]
    Fill Text    //input[@data-qa="expiry-year"]    ${card_info}[expiration_year]

Click Pay And Confirm Order
    Click    //button[@data-qa="pay-button"]

Verify Order Success Message
    Wait For Elements State    text=Your order has been confirmed!
