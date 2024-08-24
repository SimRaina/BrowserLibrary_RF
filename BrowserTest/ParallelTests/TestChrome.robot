*** Settings ***
Library       Browser
Test Setup    Open Browser in Chrome
Resource    ../../Resource.robot

*** Variables ***

*** Test Cases ***
FirstChromeTest
     Log To Console    FirstChromeTest

ThirdChromeTest
     Log To Console    ThirdChromeTest
