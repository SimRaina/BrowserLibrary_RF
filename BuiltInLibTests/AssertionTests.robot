*** Settings ***

*** Test Cases ***
Test Condition Is True
    ${x} =    Set Variable    5
    Should Be True    ${x} > 0    Expected x to be greater than 0

Test Condition Is Not True
    ${y} =    Set Variable    0
    Should Not Be True    ${y} > 0    Expected y to not be greater than 0

Test Values Are Equal
    ${name} =    Set Variable    seniorQA
    Should Be Equal    ${name}    seniorQA    Expected name to be 'seniorQA'

Test Values Are Not Equal
    ${name} =    Set Variable    Automation
    Should Not Be Equal    ${name}    Robot    Expected name to be something other than 'Robot'

Test Numbers Are Equal
    ${num1} =    Set Variable    10
    ${num2} =    Set Variable    10.0
    Should Be Equal As Numbers    ${num1}    ${num2}    Expected numbers to be equal

Test Numbers Are Not Equal
    ${num1} =    Set Variable    5
    ${num2} =    Set Variable    10
    Should Not Be Equal As Numbers    ${num1}    ${num2}    Expected numbers to be different

Test Strings Are Equal
    ${str1} =    Set Variable    Hello
    ${str2} =    Set Variable    HELLO
    Should Be Equal As Strings    ${str1.lower()}    ${str2.lower()}    Strings should be equal when lowercase

Test Strings Are Not Equal
    ${str1} =    Set Variable    Hello
    ${str2} =    Set Variable    World
    Should Not Be Equal As Strings    ${str1}    ${str2}    Expected strings to be different

Test Value Is Empty
    ${empty_list} =    Create List
    Should Be Empty    ${empty_list}    Expected list to be empty

Test Value Is Not Empty
    ${non_empty_list} =    Create List    item1
    Should Not Be Empty    ${non_empty_list}    Expected list to not be empty

Test Item Contains Value
    ${text} =    Set Variable    Hello World
    Should Contain    ${text}    World    Expected 'World' to be in the text

Test Item Does Not Contain Value
    ${text} =    Set Variable    Hello Universe
    Should Not Contain    ${text}    World    Expected 'World' to not be in the text

Test String Matches Pattern
    ${filename} =    Set Variable    report-2023-10.pdf
    Should Match    ${filename}    report-*.pdf    Filename should match pattern

Test String Does Not Match Pattern
    ${filename} =    Set Variable    data.csv
    Should Not Match    ${filename}    *.pdf    Expected filename not to be PDF


