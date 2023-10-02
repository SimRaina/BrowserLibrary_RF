*** Settings ***
Library       Browser
Test Setup    Open Browser to Table Page
Resource    ../Resource.robot

*** Variables ***
${selector}     xpath=//*[@id="tablepress-demo"]

*** Test Cases ***
WebTableTest
    #Count only rows without header = 10
    ${number_of_rows}=        Get Element Count          xpath=//*[@id="tablepress-demo"]/tbody/tr
    Log To Console    ${number_of_rows}

     FOR    ${INDEX}    IN RANGE    2   ${number_of_rows+2}
      ${CellValue}=     Get Table Cell Element    ${selector}        1      ${INDEX}
      ${value}=     Get Text    ${CellValue}
      Log To Console    ${value}
     END

     ${colidx}=    Get Table Cell Index   ${selector} >> "Barry"
     Log To Console    ${colidx}

     ${rowidx}=    Get Table Row Index    ${selector} >> "Barry"
     Log To Console    ${rowidx}


     ${newValue}=     Get Table Cell Element      ${selector}         ${colidx}       ${rowidx}
      ${name}=        Get Text    ${newValue}
      Should Be Equal    ${name}    Barry