*** Settings ***
Documentation     Automation script for exercise 1.
Library    RPA.Browser.Selenium    auto_close=${TRUE}

*** Variables ***
${BASE_URL}    https://www.ebay.com/
${CATEGORY_ELE}    id:gh-shop-a
${CATEGORY_DETAIL_ELE}    //table[@id="gh-sbc"]//ul/following-sibling::ul[1]/li/following-sibling::li[3]/a[@class="scnd"]
${LOAD_CATEGORY_ELE}    //span[text()='Cell Phones, Smart Watches & Accessories']
${SUB_CATEGORY_ELE}    //div[@id="leftnav"]//a[text()='Cell Phones & Smartphones']
${LOAD_SUB_CATEGORY_ELE}    //nav[@class="breadcrumbs"]//span[text()='Cell Phones & Smartphones']
${FILTER_DETAIL_ELE}    //span[text()='Network']
${FILTER_ALL_ELE}    //button[text()='see all']
${LOAD_MODAL_ELE}    id:x-overlay__form
${FILTER_SCREEN_SIZE_ELE}    //div[@data-aspecttitle="seller"]/preceding-sibling::div[20]
${FILTER_SCREEN_SIZE_TAG}    //div[@data-aspecttitle="seller"]/preceding-sibling::div[20]/span
${LOAD_SUB_PANEL_ELE}    class:x-overlay-sub-panel__aspect-fieldset
${CHECKBOX_SCREEN_SIZE_ELE}    //div[@class="x-refine__multi-select x-overlay-sub-panel__aspect-option"]/following-sibling::div[2]//input[@type="checkbox"]
${FILTER_PRICE_ELE}    //div[@data-aspecttitle="seller"]/preceding-sibling::div[5]
${FILTER_PRICE_TAG}    //div[@data-aspecttitle="seller"]/preceding-sibling::div[5]/span
${PRICE_FROM_TEXT}    //input[@class="x-textrange__input x-textrange__input--from"]
${PRICE_FROM}    5000000
${PRICE_TO_TEXT}    //input[@class="x-textrange__input x-textrange__input--to"]
${PRICE_TO}    10000000
${FILTER_ITEM_LOC_ELE}    //div[@data-aspecttitle="seller"]/preceding-sibling::div[3]
${FILTER_ITEM_LOC_TAG}    //div[@data-aspecttitle="seller"]/preceding-sibling::div[3]/span
${SELECT_ITEM_LOC}    //div[@class="x-refine__single-select x-overlay-sub-panel__aspect-option"]/following-sibling::div[4]//input[@type="radio"]
${APPLY_FILTER_BUTTON}    //div[@class="x-overlay-footer__apply"]/button[@type="button"]
${APPLIED_FILTER_ELE}    //li[@class="brm__item brm__item--applied"]
${EACH_FILTER_ELE}    //li[@class="brm__aspect-item brm__aspect-item--applied"]
${TOTAL_TAGS}    //div[@class="x-tray__breadcrumbs"]/span
${APPLIED_FILTER_SCREEN_SIZE}    //li[@class="brm__aspect-item brm__aspect-item--applied"]//span[@class="brm__item-label"]
${APPLIED_FILTER_PRICE}    //li[@class="brm__aspect-item brm__aspect-item--applied"]/following-sibling::li[1]//span
${APPLIED_FILTER_LOC}    //li[@class="brm__aspect-item brm__aspect-item--applied"]/following-sibling::li[2]//span

${SEARCH_BAR_ELE}    id:gh-ac
${CATEGORY_DROPDOWN_ELE}    id:gh-cat-box
${CATEGORY_SEARCH_DETAIL_ELE}    //option[@value="99"]/preceding-sibling::option[24]
${SEARCH_BUTTON}    id:gh-btn
${SEARCH_RESULT_ELE}    class:srp-controls__count-heading
${SEARCH_RESULT_TEXT}    id:gh-ac
${RESULT_TITLE}    //li[@class="s-item s-item__pl-on-bottom s-item--watch-at-corner"]//span

*** Tasks ***
Scenario 1
    Open a browser
    Search by category
    Look into cellphones and smartphones page
    Check more filters
    Select screen size
    Select price
    Select location
    Apply filters and verify tags
    Close a browser

Scenario 2
    Open a browser
    Search something

*** Keywords ***
Open a browser
    Open Available Browser  ${BASE_URL}    maximized=${TRUE}

Close a browser
    Close Browser

Search by category
    Click Element    ${CATEGORY_ELE}
    Click Element    ${CATEGORY_DETAIL_ELE}

Look into cellphones and smartphones page
    [Timeout]    10
    Click Element    ${SUB_CATEGORY_ELE}
    Wait Until Page Contains Element    ${LOAD_CATEGORY_ELE}

Check more filters
    [Timeout]    10
    Wait Until Page Contains Element    ${LOAD_SUB_CATEGORY_ELE}
    Click Element    ${FILTER_DETAIL_ELE}
    Click Element    ${FILTER_ALL_ELE}
    Wait Until Page Contains Element    ${LOAD_MODAL_ELE}

Select screen size
    Click Element    ${FILTER_SCREEN_SIZE_ELE}
    Wait Until Page Contains Element    ${LOAD_SUB_PANEL_ELE}
    Select Checkbox    ${CHECKBOX_SCREEN_SIZE_ELE}

Select price
    Click Element    ${FILTER_PRICE_ELE}
    Wait Until Page Contains Element    ${LOAD_SUB_PANEL_ELE}
    Input Text    ${PRICE_FROM_TEXT}    ${PRICE_FROM}
    Input Text    ${PRICE_TO_TEXT}    ${PRICE_TO}

Select location
    Click Element    ${FILTER_ITEM_LOC_ELE}
    Wait Until Page Contains Element    ${LOAD_SUB_PANEL_ELE}
    Click Element    ${SELECT_ITEM_LOC}

Apply filters and verify tags
    ${RES_TOTAL_ELE}    Get Element Count    ${TOTAL_TAGS}
    ${RES_TAG_SCREEN_SIZE}    Get Text    ${FILTER_SCREEN_SIZE_TAG}
    ${RES_TAG_PRICE}    Get Text    ${FILTER_PRICE_TAG}
    ${RES_TAG_LOC}    Get Text    ${FILTER_ITEM_LOC_TAG}
    Click Button    ${APPLY_FILTER_BUTTON}
    Wait Until Page Contains Element    ${APPLIED_FILTER_ELE}
    Click Element    ${APPLIED_FILTER_ELE}
    Element Should Contain    ${APPLIED_FILTER_SCREEN_SIZE}    ${RES_TAG_SCREEN_SIZE}    ignore_case=${TRUE}
    Element Should Contain    ${APPLIED_FILTER_PRICE}    ${RES_TAG_PRICE}    ignore_case=${TRUE}
    Element Should Contain    ${APPLIED_FILTER_LOC}    ${RES_TAG_LOC}    ignore_case=${TRUE}
    Page Should Contain Element    ${EACH_FILTER_ELE}    limit=${RES_TOTAL_ELE}

Search something
    Input Text    ${SEARCH_BAR_ELE}    iPad
    Click Element    ${CATEGORY_DROPDOWN_ELE}
    Click Element When Visible    ${CATEGORY_SEARCH_DETAIL_ELE}
    Click Button    ${SEARCH_BUTTON}
    ${RES_LOAD_PAGE}    Get Text    ${SEARCH_RESULT_ELE}
    Wait Until Page Contains    ${RES_LOAD_PAGE}
    Page Should Contain    ${RES_LOAD_PAGE}
    ${RES_RESULT_TITLE}    Get Value    ${SEARCH_RESULT_TEXT}
    Element Should Contain    ${RESULT_TITLE}    ${RES_RESULT_TITLE}    ignore_case=${TRUE}
