*** Settings ***

*** Test Cases ***
Simple Addition
    [Template]    Addition Test
    2    3    5

Subtraction
    [Template]    Subtraction Test
    7    4    3

*** Keywords ***
Addition Test
    [Arguments]    ${a}    ${b}    ${expected}
    ${result}=    Evaluate    ${a} + ${b}
    Should Be Equal As Numbers    ${result}    ${expected}

Subtraction Test
    [Arguments]    ${a}    ${b}    ${expected}
    ${result}=    Evaluate    ${a} - ${b}
    Should Be Equal As Numbers    ${result}    ${expected}
