*** Settings ***
Library   Browser
Library   ExcelLibrary

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
    Go to Site                 https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
    Valid OrangeHRM Login
    Wait Sleep

Open Browser to Table Page
    Open Maximized Browser    Chromium
    Go to Site                https://tablepress.org/demo/
    Wait Sleep

Open Browser to Demo Page
    Open Maximized Browser     Chromium
    Go to Site                 https://demo.nopcommerce.com/
    Wait Sleep

Open Browser to Register Page
    Open Maximized Browser     Chromium
    Go to Site                 https://demo.nopcommerce.com/register
    Wait Sleep

Open Browser to Alert Page
    Open Maximized Browser     Chromium
    Go to Site                 https://demoqa.com/alerts
    
Open Browser to Frame Page
     Open Maximized Browser    Chromium
     Go to Site                https://demoqa.com/frames

Open Browser to SelectOptions Page
     Open Maximized Browser    Chromium
     Go to Site                https://demo.nopcommerce.com/digital-downloads

Wait Sleep
    Sleep           2

Read DropDown Data
    [Arguments]    ${filepath}       ${sheetname}        ${rownum}     ${colnum}
    Open Excel Document        ${filepath}        1
    Get Sheet    ${sheetname}
    ${data}        Read Excel Cell                          ${rownum}               ${colnum}
    [Return]    ${data}
    Close Current Excel Document

Write DropDown Data
  [Arguments]    ${filepath}       ${sheetname}        ${rownum}      @{data}
    Open Excel Document        ${filepath}        2
    Get Sheet        ${sheetname}
    #FOR    ${a}    IN RANGE    0     2
    Write Excel Row              ${rownum}        ${data}[0]        1    ${sheetname}
   # END
    Close Current Excel Document