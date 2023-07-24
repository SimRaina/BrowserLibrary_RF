*** Settings ***
Library   Browser

*** Keywords ***
Open Maximized Browser
    [Arguments]    ${browser}
    New Browser    browser=${browser}    headless=false   args=["--start-maximized"]
    New Context    viewport=${None}

Go to Site
    [Arguments]    ${url}
    New Page       ${url}

Valid OrangeHRM Login
    Type Text     xpath=//div[1]/div/div[2]/input       Admin
    Type Text   xpath=//div[2]/div/div[2]/input     admin123
    Click         css=button >> text=Login

Open Browser to Dashboard Page
    Open Maximized Browser        Chromium
    Go to Site                https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
    Valid OrangeHRM Login
    Wait Sleep

Wait Sleep
    Sleep           4

