*** Settings ***
Library       Browser
Test Setup    Open Browser to Demo Page
Resource    ../Resource.robot

*** Variables ***
${locator}      small-searchterms   # id value

*** Test Cases ***
FillTextTest
     Fill Text    id=${locator}     test        #direct filling of text

     Clear Text    id=${locator}

     Wait Sleep
     Type Text     id=${locator}     test        delay=2000ms          clear=False  # By default clear is True
     #character by character filling of text (key down, press, key up)
     Wait Sleep
