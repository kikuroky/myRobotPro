*** Settings ***
Documentation    Android Test Run
Resource    keywords.resource
Resource    keywords.resource
Test Teardown    Close Application

*** Tasks ***
My first test
    Allowing permissions

# My first Android test
#     Open test demo app
#     Input search query    Hello World!
#     Submit search
#     Verify query    Hello World!