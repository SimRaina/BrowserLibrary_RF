*** Settings ***
Library   Browser
Library   ExcelLibrary
Library   DateTime

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

Open Browser to TurkAir Page
    Open Maximized Browser        Chromium
    Go to Site                    https://www.turkishairlines.com/en-int/index.html
    Wait Sleep

Open Browser to Dashboard Page
    Open Maximized Browser        Chromium
    Go to Site                    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
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

Calculate Month Difference
    [Arguments]    ${desired_month_year}   ${current_month_year}
    ${current_month}    Evaluate    datetime.datetime.strptime('${current_month_year}', '%B %Y').month   # Take only number of Month e.g. 10
    ${current_year}     Evaluate     datetime.datetime.strptime('${current_month_year}', '%B %Y').year   # Take only 4 digit Year e.g. 2023
    ${desired_month}    Evaluate    datetime.datetime.strptime('${desired_month_year}', '%B %Y').month   # e.g. 8 for August
    ${desired_year}     Evaluate     datetime.datetime.strptime('${desired_month_year}', '%B %Y').year   # e.g. 2024
    ${months_difference}    Evaluate    (${desired_year} - ${current_year}) * 12 + (${desired_month} - ${current_month})
                                       #  (2024 - 2023) * 12 + (8-10) = 1 * 12 - 2 = 10
                                       # This difference will be equal to the clicks to go from current to desired month year in date picker
    [Return]    ${months_difference}
