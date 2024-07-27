*** Settings ***
Library     Browser
Library     RPA.Excel.Files
Test Setup  Open Browser to OrangeHRM Page
Resource    ../Resource.robot

*** Variables ***
${EXCEL_FILE}     ${CURDIR}${/}\\Data\\LoginData.xlsx

*** Test Cases ***
ReadSheetAsTable
    Open Workbook    ${EXCEL FILE}
    ${data}=          Read Worksheet As Table    header=True
    FOR      ${row}    IN        @{data}
      Try Login      ${row['Username']}       ${row['Password']}
    END
    Close Workbook

InvalidLogin
     Open Workbook    ${EXCEL FILE}
     Read Worksheet      login
     ${Username}   Get cell value    2   A
     ${Password}   Get cell value    2   B
     ${error}       LoginError        ${Username}       ${Password}
     Set cell value    2    C    ${error}
     Save Workbook
     Close Workbook

*** Keywords ***
Try Login
    [Arguments]    ${username}    ${password}
    Fill Text    //form/div[1]/div/div[2]/input     ${username}
    Fill Text    //form/div[2]/div/div[2]/input     ${password}
    Click        //form/div[3]/button

LoginError
    [Arguments]    ${username}    ${password}
    Try Login      ${username}    ${password}
    ${error}       Get Text    //div[1]/p
    RETURN        ${error}

