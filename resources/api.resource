*** Settings ***
Library     Collections
Library     RequestsLibrary


*** Keywords ***
Create Account With API
    [Arguments]    ${account_data}
#    [Arguments]    ${name}    {email}    {password}    {title}    {birth_date}    {birth_month}    {birth_year}    {firstname}    {lastname}    {company}    {address1}    {address2}    {country}    {zipcode}    {state}    {city}    {mobile_number}
    ${response}    POST    url=https://automationexercise.com/api/createAccount    data=${account_data}
    Should Be Equal As Numbers    ${response.json()}[responseCode]    201

Delete Account With API
    [Arguments]    ${login_info}
    ${response}    DELETE    url=https://automationexercise.com/api/deleteAccount    data=${login_info}
    Status Should Be    200
