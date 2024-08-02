*** Settings ***
Library    Browser    run_on_failure=Take Screenshot \ fintech-failure-sshot-{index} \ fullPage=True

*** Variables ***
${Website_URL}        https://katalon-demo-cura.herokuapp.com/
${TESTING_ENV}        integration
${BROWSER}            chromium
${HEADLESS}           False
${TIMEOUT}            2min
${SCREEN}             {"height": 768,"width": 1366}

*** Keywords ***
UI Open Browser and Navigate to URL
    [Arguments]    ${widget_url}
    Browser.New Persistent Context    browser=${BROWSER}    headless=${HEADLESS}    url=${widget_url}    viewport=${SCREEN}
    Browser.Set Browser Timeout       timeout=${TIMEOUT}

UI Quit Browser
    Close Browser    CURRENT

Capture Screenshot
    Browser.Take Screenshot    fullPage=true