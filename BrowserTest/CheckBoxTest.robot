*** Settings ***
Library       Browser
Test Setup    Open Browser to Demo Page
Resource    ../Resource.robot

*** Test Cases ***
CheckBoxCheckTest
    Click    text="Register"
    Scroll To Element       id=Newsletter
    Wait Sleep
    ${checkboxvalue}        Get Checkbox State    id=Newsletter
    # Get Checkbox State will tell you the current status of id=Newsletter element
    # which in our case is checked already. So in our scenario we want to
    # Get this state and then if it is true we want to uncheck it
    # And finally check it using Browser Library Keywords
    IF    ${checkboxvalue}  # if it is true
        Log    "Already Checked"
        Uncheck Checkbox   id=Newsletter  # uncheck it
        Log    "Now Unchecked"
    END     # ending IF
    Wait Sleep
    Check Checkbox    id=Newsletter
    #This keyword will check the checkbox
    Wait Sleep