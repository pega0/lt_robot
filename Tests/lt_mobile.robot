*** Settings ***
Library    SeleniumLibrary
Variables    ../Config/base.py
Library      ../Resources/Utils.py

Test Teardown  teardown test

*** Variables ***
${URL} =  http://cams.com
${BROWSER} =  chrome
${MAIN_WINDOW} =  mainwindow
${LOGIN_BUTTON} =  xpath://button[text() = 'Login']

*** Test Cases ***
Start local testing
    [Tags]    local
    initialize test
    builtin.sleep    5

Start remote android testing
    [Tags]    android
    Initialize Android Remote Test
    builtin.sleep    5

Start remote ios testing
    [Tags]    ios
    initialize ios remote test
    builtin.sleep    5

Test if element is visible
    [Tags]    js
    initialize android remote test
    wait until element is visible     ${LOGIN_BUTTON}
    wait until element is enabled     ${LOGIN_BUTTON}
    click element    ${LOGIN_BUTTON}
    builtin.sleep    5

*** Keywords ***
initialize test
    [Documentation]  Opens a new browser and maximizes the window.
    open browser  ${URL}  ${BROWSER}  ${MAIN_WINDOW}
    maximize browser window

initialize ios remote test
    ${options_mobile}=    get lambdatest options for mobile    ios
    open browser    ${URL}    browser=safari    remote_url=${LT_MOBILE_REMOTE_URL}    options=${options_mobile}
        ...    alias=${MAIN_WINDOW}

initialize android remote test
    ${options_mobile}=    get lambdatest options for mobile    android
    open browser    ${URL}    browser=chrome    remote_url=${LT_MOBILE_REMOTE_URL}    options=${options_mobile}
        ...    alias=${MAIN_WINDOW}

teardown test
    close all browsers
