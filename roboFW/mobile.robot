*** Settings ***
Documentation    Android Test Run
Resource    asset.robot
Test Teardown    Close Application

*** Tasks ***
My first Android test
    Open test demo app
    Input search query    Hello World!
    Submit search
    Verify query    Hello World!