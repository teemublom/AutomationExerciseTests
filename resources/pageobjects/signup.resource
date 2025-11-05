*** Settings ***
Library     Browser


*** Keywords ***
Verify Signup Page Is Visible
    Get Text    text=Enter Account Information

Choose Title
    [Arguments]    ${title}
    Check Checkbox    //input[@value="${title}"]

Fill Name
    [Arguments]    ${name}
    Fill Text    id=name    ${name}

Fill Email
    [Arguments]    ${email}
    Fill Text    id=email    ${email}

Fill Password
    [Arguments]    ${password}
    Fill Text    id=password    ${password}

Fill Date Of Birth
    [Arguments]    ${day}    ${month}    ${year}
    Select Options By    id=days    text    ${day}
    Select Options By    id=months    text    ${month}
    Select Options By    id=years    text    ${year}

Fill First Name
    [Arguments]    ${first_name}
    Fill Text    id=first_name    ${first_name}

Fill Last Name
    [Arguments]    ${last_name}
    Fill Text    id=last_name    ${last_name}

Fill Company
    [Arguments]    ${company}
    Fill Text    id=company    ${company}

Fill Address
    [Arguments]    ${address1}
    Fill Text    id=address1    ${address1}

Fill Address2
    [Arguments]    ${address2}
    Fill Text    id=address2    ${address2}

Choose Country
    [Arguments]    ${country}
    Select Options By    id=country    text    ${country}

Fill State
    [Arguments]    ${state}
    Fill Text    id=state    ${state}

Fill City
    [Arguments]    ${city}
    Fill Text    id=city    ${city}

Fill Zipcode
    [Arguments]    ${zipcode}
    Fill Text    id=zipcode    ${zipcode}

Fill Mobile Number
    [Arguments]    ${mobile_number}
    Fill Text    id=mobile_number    ${mobile_number}

Check Newsletter Box
    Check Checkbox    id=newsletter

Check Special Offers Box
    Check Checkbox    id=optin

Click Create Account Button
    Click    //button[@data-qa="create-account"]
