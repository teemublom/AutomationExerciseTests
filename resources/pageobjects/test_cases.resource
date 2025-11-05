*** Settings ***
Library     Browser


*** Keywords ***
Verify Test Cases Header Is Visible
    Get Text    //h2[.="Test Cases"]
