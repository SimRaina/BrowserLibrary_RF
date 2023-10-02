*** Settings ***
Library       Browser
Test Setup    Open Browser to Register Page
Resource    ../Resource.robot

*** Variables ***

*** Test Cases ***
SelectDateFromExcelData
    # Read specific row from the excel
    ${day}         Read DropDown Data    ${CURDIR}${/}\\Data\\Data.xlsx    date         5       1
    ${month}         Read DropDown Data    ${CURDIR}${/}\\Data\\Data.xlsx    date       5       2
    ${year}         Read DropDown Data    ${CURDIR}${/}\\Data\\Data.xlsx    date        5       3

   # Convert to String as drop down values in the website are expecting String and not Number
   ${StringDay}      Convert To String    ${day}
   ${StringMonth}    Convert To String    ${month}
   ${StringYear}     Convert To String    ${year}

    # Fill data in the drop down
    Scroll To Element   id=Email
    Wait Sleep
    Select Options By    //div[4]/div/select[1]     text     ${StringDay}
    Wait Sleep
    Select Options By   //div[4]/div/select[2]       text     ${StringMonth}
    Wait Sleep
    Select Options By   //div[4]/div/select[3]       text     ${StringYear}
    Wait Sleep

WriteDataToExcel
     # Select date in the options first
     Scroll To Element   id=Email
    Wait Sleep
    Select Options By    //div[4]/div/select[1]     text     23
    Wait Sleep
    Select Options By   //div[4]/div/select[2]       text     September
    Wait Sleep
    Select Options By   //div[4]/div/select[3]       text     1995
    Wait Sleep
    ${day}             Get Selected Options    //div[4]/div/select[1]
    ${month}           Get Selected Options    //div[4]/div/select[2]
    ${year}            Get Selected Options    //div[4]/div/select[3]

    @{data}            Create List  ${day}   ${month}  ${year}
    Write DropDown Data   ${CURDIR}${/}\\Data\\Data.xlsx    date        14       @{data}
    Wait Sleep






