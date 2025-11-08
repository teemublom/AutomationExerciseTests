*** Settings ***
Library     Browser


*** Variables ***
${NAVBARLOCATOR}    //ul[@class="nav navbar-nav"]


*** Keywords ***
Click Signup Tab Link
    Click    ${NAVBARLOCATOR} >> //a[@href="/login"]

Click Modal Continue Shopping
    Click    text=Continue Shopping

Click Modal View Cart
    Click    //div[contains(@class, "modal-dialog")] >> //a[@href="/view_cart"]

Click Test Cases Tab Link
    Click    ${NAVBARLOCATOR} >> text="Test Cases"

Click Delete Account Button
    Click    //a[@href="/delete_account"]

Click Common Logout Button
    Click    //a[@href="/logout"]

Click Contact Us Tab Link
    Click    //a[@href="/contact_us"]

Click Cart Tab Link
    Click    ${NAVBARLOCATOR} >> text="Cart"

Click Products Tab Link
    Click    //a[@href="/products"]

Verify Logged In As Username Is Visible
    [Arguments]    ${username}
#    Get Text    text=/Logged in as \\s*<b>${username}/
    Get Text    text=Logged in as ${username}

Scroll To Footer
    Scroll To    id=footer

Verify Footer Subscription Text Is Visible
    Get Text    //footer >> text=Subscription

Fill Email Into Subscription Field
    [Arguments]    ${email}
    Fill Text    id=susbscribe_email    ${email}

Click Submit Subscription Button
    Click    id=susbscribe_email

Verify Successful Subscription Message Is Visible
    Get Text    text=You have been successfully subscribed!
