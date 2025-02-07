*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URLWEB}    https://www.demoblaze.com/
${BROWSER}           Chrome
${ChromeDriverPath}    C:\Users\jelly.perwita\OneDrive - PT IDX Solusi Teknologi Informasi\Documents\Jelly\Robotframework_Demoblaze\WebDrivers\chrome

*** Keywords ***
Go To Home Page
    Go To    ${URLWEB}

Start Test Case
    ${OS}=    Evaluate    platform.system()    platform
    Log    "running on ${OS}-${BROWSER}"
    @{Browser_id}=    Get Browser Ids
    Run Keyword if    @{Browser_id}==[]    Start Test

Start Test
    Log To Console    "Running on Windows - Chrome"
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].${BROWSER}Options()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --disable-extensions
    Call Method    ${options}    add_argument    --disable-gpu
    Call Method    ${options}    add_argument    window-size\=1920,1080
    ${options.prefs}=    Create Dictionary    profile.default_content_setting_values.geolocation=1
    Call Method    ${options}    add_experimental_option    prefs    ${options.prefs}
    Create WebDriver    ${BROWSER}    options=${options}
    Go To    ${URLWEB}
