*** Settings ***
Library    Browser
Library    Dialogs
Test Setup  Open Maximized Browser   ${browser}
Resource       ../Resource.robot

*** Variables ***
${browser}          Chromium
${url}              https://the-internet.herokuapp.com/login
${expected url}     https://the-internet.herokuapp.com/secure
${expected title}   Browser Library
${password}         SuperSecretPassword!

*** Test Cases ***
My First Test
    New Page       ${url}   
    Type Text    id=username      tomsmith
    Type Text   id=password     ${password}
    Click       xpath=//*[@id="login"]/button
    #Pause Execution
    ${current url}    Get Url      
    Should Be Equal    ${current url}     ${expected url}  
    
    # New Code as per YouTube Comment
    New Page      https://robotframework-browser.org/
    ${title}      Get Title  
    Should Be Equal    ${title}     ${expected title}   
    
   
