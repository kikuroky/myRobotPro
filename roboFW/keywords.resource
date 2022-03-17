*** Settings ***
Library    AppiumLibrary

*** Variables ***
${ANDROID_AUTOMATION_NAME}    UIAutomator2
# ${ANDROID_APP}                ${CURDIR}/ApiDemos-debug.apk
${ANDROID_DEVICE_NAME}        %{ANDROID_DEVICE_NAME=Galaxy J5 Prime}
${ANDROID_PLATFORM_NAME}      Android
${ANDROID_PLATFORM_VERSION}   %{ANDROID_PLATFORM_VERSION=8.0.0}
${ANDROID_PACKAGE}            com.telkom.mwallet
${ANDROID_ACTIVITY_NAME}      com.linkaja.customer.MainActivity
${ANDROID_WAIT_FOR_ACTIVITY_NAME}    module.feature.splash.SplashActivity

*** Keywords ***
Open test demo app
    Open Application    http://127.0.0.1:4723/wd/hub    automationName=${ANDROID_AUTOMATION_NAME}
    ...    platformName=${ANDROID_PLATFORM_NAME}    platformVersion=${ANDROID_PLATFORM_VERSION}
    ...    deviceName=${ANDROID_DEVICE_NAME}    appPackage=${ANDROID_PACKAGE}    appActivity=${ANDROID_ACTIVITY_NAME}
    ...    noReset=${TRUE}    appWaitActivity=${ANDROID_WAIT_FOR_ACTIVITY_NAME}

Input search query
    [Arguments]    ${query}
    Input Text    txt_query_prefill    ${query}

Submit search
    Click Element    btn_start_search

Verify query
    [Arguments]    ${text}
    Wait Until Page Contains Element    android:id/search_src_text
    Element Text Should Be    android:id/search_src_text    ${text}

Allowing permissions
    Click Element    android:id/permission_allow_button
    Click Element    android:id/permission_allow_button
    Click Element    android:id/permission_allow_button

Input msisdn
    Wait Until Page Contains Element    com.telkom.mwallet:id/view_support_action_confirm_button    timeout=10 s
    Tap    com.telkom.mwallet:id/view_keyboard_numeric_8_textview
    Tap    com.telkom.mwallet:id/view_keyboard_numeric_1_textview
    Tap    com.telkom.mwallet:id/view_keyboard_numeric_3_textview
    Tap    com.telkom.mwallet:id/view_keyboard_numeric_8_textview
    Tap    com.telkom.mwallet:id/view_keyboard_numeric_2_textview
    Tap    com.telkom.mwallet:id/view_keyboard_numeric_4_textview
    Tap    com.telkom.mwallet:id/view_keyboard_numeric_7_textview
    Tap    com.telkom.mwallet:id/view_keyboard_numeric_7_textview
    Tap    com.telkom.mwallet:id/view_keyboard_numeric_5_textview
    Tap    com.telkom.mwallet:id/view_keyboard_numeric_1_textview
    Tap    com.telkom.mwallet:id/view_keyboard_numeric_8_textview

Login into app
    Tap    com.telkom.mwallet:id/view_support_action_confirm_button

Input pin
    Wait Until Page Contains Element    com.telkom.mwallet:id/pin_content    timeout=10 s
    Tap    com.telkom.mwallet:id/view_keyboard_numeric_0_textview
    Tap    com.telkom.mwallet:id/view_keyboard_numeric_9_textview
    Tap    com.telkom.mwallet:id/view_keyboard_numeric_0_textview
    Tap    com.telkom.mwallet:id/view_keyboard_numeric_7_textview
    Tap    com.telkom.mwallet:id/view_keyboard_numeric_9_textview
    Tap    com.telkom.mwallet:id/view_keyboard_numeric_2_textview

Verify homepage
    Wait Until Page Contains Element    com.telkom.mwallet:id/view_avatar    timeout=10 s
    Wait Until Element Is Visible    com.telkom.mwallet:id/view_avatar    timeout=10 s
    Capture Page Screenshot    filename=loginSucceed.png

Sign out of app
    Tap    com.telkom.mwallet:id/menu_item_profile
    Wait Until Page Contains Element    com.telkom.mwallet:id/view_avatar    timeout=10 s
    Swipe By Percent    50    50    50    10
    # Swipe    555    1150    555    600    3000
    # ${eleLoc}=    Get Element Location    com.telkom.mwallet:id/button_logout
    # Tap    ${eleLoc}
    # Scroll Up    com.telkom.mwallet:id/text_app_version
    # Wait Until Page Contains Element    com.telkom.mwallet:id/button_logout
    # Capture Page Screenshot    filename=logutButton.png
    Wait Until Page Contains Element    com.telkom.mwallet:id/text_app_version
    Capture Page Screenshot    swipeSucceed.png
    Click Element    com.telkom.mwallet:id/button_logout
    Wait Until Page Contains    Mulai
    Page Should Contain Element    com.telkom.mwallet:id/view_support_action_confirm_button
    Capture Page Screenshot    filename=logutSucceed.png