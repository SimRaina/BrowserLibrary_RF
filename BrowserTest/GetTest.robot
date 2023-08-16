*** Settings ***
Library       Browser
Test Setup    Open Browser to Frame Page
Resource    ../Resource.robot

*** Variables ***
${expected text}       Frames
${selector}            //*[@id="app"]/div/div/div[1]/div

*** Test Cases ***
GetAttrNameTest
   Wait Sleep
   ${attr_name}     Get Attribute Names    ${selector}
   Log   ${attr_name}

GetAttrTest
    Wait Sleep
    ${attr}    Get Attribute    ${selector}    class
    Log    ${attr}


GetTextTest
    Wait Sleep
    ${text}    Get Text    xpath=//div[@class='main-header']
    Should Be Equal    ${text}     ${expected text}
    Wait Sleep




