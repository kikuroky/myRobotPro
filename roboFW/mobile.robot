*** Settings ***
Documentation    Android Test Run
Resource    keywords.resource
Resource    keywords.resource
Resource    keywords.resource
Resource    keywords.resource
Test Teardown    Close Application

*** Tasks ***
My first test
    [Tags]    myVeryFirst
    Open test demo app
    Input msisdn
    Login into app
    Input pin
    Verify homepage
    Sign out of app

# My first Android test
#     Open test demo app
#     Input search query    Hello World!
#     Submit search
#     Verify query    Hello World!