*** Settings ***
Library    Browser
Test Setup      Open Browser to Dashboard Page
Resource       ../Resource.robot

*** Test Cases ***

Scroll Test
    Scroll By      ${None}         300       0          smooth
    Sleep           4
    Scroll By      ${None}         -50       0          smooth
    Sleep           4
    Scroll To      ${None}         bottom     left      auto
    Sleep           4
    Scroll To Element   xpath=//div[5]/div/div[1]/div/p
    Sleep          4

