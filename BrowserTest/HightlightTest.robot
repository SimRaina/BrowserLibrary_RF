*** Settings ***
Library       Browser
Test Setup    Open Browser to Alert Page
Resource    ../Resource.robot

*** Test Cases ***
HightLightTest1
    Wait Sleep
    Highlight Elements     id=alertButton      duration=2000ms   width=5px    style=solid   color=\#FF0000
    # Highlight Elements is a keyword to highlight any elmeent. You have to supply the selector
    # duration of highlighting, width of this highlighter, style = solid line or dotted line,
    # and color= for example Red in this case
    Wait Sleep