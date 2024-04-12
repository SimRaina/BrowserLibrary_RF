*** Settings ***
Library       Browser
Library       ImageHorizonLibrary      reference_folder=${CURDIR}${/}Images
Test Setup    Open Maximized URL   ${browser}   ${url}
Resource       ../Resource.robot

*** Variables ***

## pip install robotframework-imagehorizonlibrary

${browser}          Chromium
${url}              https://the-internet.herokuapp.com/login
${password}         SuperSecretPassword!

*** Test Cases ***
Test1
    Click Image    Username
    Type           tomsmith
    Click Image    Password
    Type           ${password}
    Click Image    Login Button
    Pause





