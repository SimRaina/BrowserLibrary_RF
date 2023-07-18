*** Settings ***
Library    Browser
#Library    Dialogs
Test Setup
Resource

*** Variables ***
${browser}          Chromium
${url}              https://demo.automationtesting.in/Windows.html
${expected url}     https://www.selenium.dev/


*** Test Cases ***
My First Test
    New Browser            browser=${browser}    headless=false 
    New Page               ${url}   
    Click                 xpath=//*[@id="Tabbed"]/a/button 
    Sleep                 4
    ${current_page}=      Get Page IDs    ACTIVE       ACTIVE       ACTIVE      # Stores only currently active page id
    Log                   Current page ID is: ${current_page}
    @{all_pages}=         Get Page IDs    ALL      ALL      ALL                 # Stores all the open pages' ids (Active and New Page)
    Log Many              New Page ID is:    ${all_pages}[0]                    # Index 0 contains New Page id, Index 1 contains Active Page id
    
    
    ${previous page}      Switch Page            ${all_pages}[0]             # Saving previous page id to swich back later/ Alternatively you can use ${current_page}
    ${current url}        Get Url 
    Sleep                 4
    Should Be Equal       ${current url}     ${expected url}                 # Verify Switched to New Page
    Switch Page           ${previous page}
    # Switch Page           ${current_page}
    ${current url}        Get Url 
    Sleep                 4
    Should Be Equal       ${current url}     ${url}                          # Verify Switched back to Parent Page
    
    
   
