*** Settings ***
Library     Browser


*** Keywords ***
Click Consent Button
    Click    //p[@class="fc-button-label" and .="Consent"]

Verify Homepage Is Visible
    Get Text    //h2[.="Category"]
