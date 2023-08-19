*** Settings ***
Library       Browser
Test Setup    Open Browser to Demo Page
Resource    ../Resource.robot

*** Test Cases ***
HoverTest
    Wait Sleep
    Hover       //div[6]/div[2]/ul[1]/li[1]/a
    Wait Sleep
    Hover       //div[6]/div[2]/ul[1]/li[5]/a
    Wait Sleep

