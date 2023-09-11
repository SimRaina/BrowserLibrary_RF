*** Settings ***
Library       Browser
Test Setup    Open Browser to Demo Page
Resource    ../Resource.robot

*** Variables ***

*** Test Cases ***
NavigationTest
     # Go to Register Page
     Click    li > .ico-register

     # Go Back to Main Demo Page
     Go Back
     Wait Sleep

     # Go Forward to Register Page
     Go Forward
     Wait Sleep
