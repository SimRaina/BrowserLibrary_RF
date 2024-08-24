*** Settings ***
Library       Browser
Test Setup    Open Browser in Chrome
Resource    ../../Resource.robot

*** Variables ***

*** Test Cases ***
SecondChromeTest
     Log To Console    SecondChromeTest

FourthChromeTest
     Log To Console    FourthChromeTest