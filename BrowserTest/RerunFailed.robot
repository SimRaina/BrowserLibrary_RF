*** Settings ***
Library       Browser
Test Setup    Open Browser to Frame Page
Resource    ../Resource.robot

*** Variables ***
${expected text}       Frames
${selector}               //*[@id="app"]/header/a

*** Test Cases ***
TestA
   Log To Console    This is TestA

TestB
    Log To Console    This is TestB

TestC
    ${attr_name}     Get Attribute Names    ${selector}
    Log To Console    ${attr_name}