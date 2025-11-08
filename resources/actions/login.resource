*** Settings ***
Library     Browser
Resource    ../pageobjects/home.resource
Resource    ../pageobjects/login.resource
Resource    ../pageobjects/signup.resource
Resource    ../pageobjects/account_created.resource
Resource    ../pageobjects/common.resource
Resource    ../pageobjects/delete_account.resource


*** Keywords ***
Click Signup Tab Link And Verify Login Page Is Visible
    Click Signup Tab Link
    Verify Login Is Visible
    Verify Signup Is Visible

Enter Signup Info And Click Signup
    [Arguments]    ${name}    ${email}
    Enter Signup Name    ${name}
    Enter Signup Email    ${email}
    Click Signup Button

Enter Login Info And Click Login
    [Arguments]    ${email}    ${password}
    Verify Login Is Visible
    Enter Login Email    ${email}
    Enter Login Password    ${password}
    Click Login Page Login Button

Enter All Account Information
    [Arguments]    ${acc_info}
    Verify Signup Page Is Visible And Enter Account Information
    ...    title=${acc_info}[title]
    ...    name=${acc_info}[name]
    ...    password=${acc_info}[password]
    ...    day=${acc_info}[birth_date]
    ...    month=${acc_info}[birth_month]
    ...    year=${acc_info}[birth_year]
    Enter Address Information
    ...    first_name=${acc_info}[firstname]
    ...    last_name=${acc_info}[lastname]
    ...    company=${acc_info}[company]
    ...    address1=${acc_info}[address1]
    ...    address2=${acc_info}[address2]
    ...    country=${acc_info}[country]
    ...    state=${acc_info}[state]
    ...    city=${acc_info}[city]
    ...    zipcode=${acc_info}[zipcode]
    ...    mobile_number=${acc_info}[mobile_number]

Verify Login
    [Arguments]    ${username}
    Verify Logged In As Username Is Visible    ${username}

Click Delete Account
    Click Delete Account Button
    Verify Account Deleted Text Is Visible

Click Logout Button
    Click Common Logout Button
    Verify Login Is Visible

Verify Signup Page Is Visible And Enter Account Information
    [Arguments]    ${title}    ${name}    ${password}    ${day}    ${month}    ${year}
    Verify Signup Page Is Visible
    Choose Title    ${title}
    Fill Name    ${name}
    Fill Password    ${password}
    Fill Date Of Birth    ${day}    ${month}    ${year}
    Check Newsletter Box
    Check Special Offers Box

Verify Error Your Email Or Password Is Incorrect Is Visible
    Verify Email Password Error Is Visible

Verify Error Email Address Already Exist Is Visible
    Verify Existing Email Address Error Is Visible

Enter Address Information
    [Arguments]
    ...    ${first_name}
    ...    ${last_name}
    ...    ${company}
    ...    ${address1}
    ...    ${address2}
    ...    ${country}
    ...    ${state}
    ...    ${city}
    ...    ${zipcode}
    ...    ${mobile_number}
    Fill First Name    first_name=${first_name}
    Fill Last Name    last_name=${last_name}
    Fill Company    company=${company}
    Fill Address    address1=${address1}
    Fill Address2    address2=${address2}
    Choose Country    country=${country}
    Fill State    state=${state}
    Fill City    city=${city}
    Fill Zipcode    zipcode=${zipcode}
    Fill Mobile Number    mobile_number=${mobile_number}

Common Signup Procedure
    [Arguments]    ${account_info}
    Enter Signup Info And Click Signup    ${account_info}[name]    ${account_info}[email]
    Enter All Account Information    ${account_info}
    Click Create Account
    Click Continue Button
    Verify Login    ${account_info}[name]

Click Create Account
    Click Create Account Button
    Verify Account Created Text Is Visible

Click Continue Button
    Click Account Created Continue Button
