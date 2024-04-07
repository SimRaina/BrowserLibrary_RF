*** Settings ***
Library       Browser
Library       ImageHorizonLibrary      reference_folder=${CURDIR}${/}Images
Test Setup    Open Maximized Browser   ${browser}
Resource       ../Resource.robot

*** Variables ***

## pip install robotframework-imagehorizonlibrary

${browser}          Chromium
${url}              https://the-internet.herokuapp.com/login
${password}         SuperSecretPassword!

*** Test Cases ***
Test1
    New Page       ${url}

    Click Image    Username
    Type           tomsmith
    Click Image    Password
    Type           ${password}
    Click Image    Login Button
    Pause





