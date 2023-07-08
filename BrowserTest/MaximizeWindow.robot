*** Settings ***
Library    Browser
Library    Dialogs

*** Variables ***
${browser}          Chromium
${url}              https://opensource-demo.orangehrmlive.com/web/index.php/auth/login



*** Test Cases ***
My First Test
    New Browser    browser=${browser}    headless=false    args=["--start-maximized"]
    New Context    viewport=${None}
    New Page       ${url}   
    Type Text     xpath=//div[1]/div/div[2]/input       Admin
    Type Secret   xpath=//div[2]/div/div[2]/input     admin123
    Click         css=button >> text=Login   
    #Pause Execution  
    Sleep           4
    Scroll By          ${None}           300         0           smooth
    Sleep           4
    Scroll To        ${None}             bottom       left        smooth
    Sleep         4