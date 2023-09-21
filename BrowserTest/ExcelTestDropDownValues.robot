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







