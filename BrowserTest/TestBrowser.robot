*** Settings ***
Library    Browser
Library    Dialogs

*** Variables ***
${browser}          Chromium
${url}              https://the-internet.herokuapp.com/login
${expected url}     https://the-internet.herokuapp.com/secure
${expected title}   Browser Library


*** Test Cases ***
My First Test
    New Browser    browser=${browser}    headless=false 
    New Page       ${url}   
    Type Text    id=username      tomsmith
    Type Secret   id=password     SuperSecretPassword!
    Click         css=button >> text=Login   
    Pause Execution 
    ${current url}    Get Url      
    Should Be Equal    ${current url}     ${expected url}  
    
    # New Code as per YouTube Comment
    New Page      https://robotframework-browser.org/
    ${title}      Get Title  
    Should Be Equal    ${title}     ${expected title}   
    
   
