*** Settings ***
Library       Browser
Test Setup    Open Browser to Register Page
Resource    ../Resource.robot

*** Variables ***

*** Test Cases ***
MouseClickTest
       Click With Options    //div[6]/div[3]/div/div/div/div[1]/h1     clickCount=2   # Double Click
       Wait Sleep
       Click With Options    //div[6]/div[3]/div/div/div/div[1]/h1     button=right   # Right Click
       Wait Sleep



