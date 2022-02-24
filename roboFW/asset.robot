*** Settings ***
Library    AppiumLibrary

*** Variables ***
${ANDROID_AUTOMATION_NAME}    UIAutomator2
${ANDROID_APP}                ${CURDIR}/ApiDemos-debug.apk
${ANDROID_PLATFORM_NAME}      Android
${ANDROID_PLATFORM_VERSION}   %{ANDROID_PLATFORM_VERSION=8.0}
${ANDROID_PACKAGE}            io.appium.android.apis
${ANDROID_ACTIVITY_NAME}      app.SearchInvoke

*** Keywords ***
Open test demo app
    Open Application    http://127.0.0.1:4723/wd/hub    automationName=${ANDROID_AUTOMATION_NAME}
    ...    platformName=${ANDROID_PLATFORM_NAME}    platformVersion=${ANDROID_PLATFORM_VERSION}
    ...    app=${ANDROID_APP}    appPackage=${ANDROID_PACKAGE}    appActivity=${ANDROID_ACTIVITY_NAME}

Input search query
    [Arguments]    ${query}
    Input Text    txt_query_prefill    ${query}

Submit search
    Click Element    btn_start_search

Verify query
    [Arguments]    ${text}
    Wait Until Page Contains Element    android:id/search_src_text
    Element Text Should Be    android:id/search_src_text    ${text}