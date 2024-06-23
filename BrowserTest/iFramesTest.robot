*** Settings ***
Library       Browser
Test Setup    Open Browser to Frame Page
Resource    ../Resource.robot

*** Variables ***

*** Test Cases ***
TwoFramesTest
    Scroll To Element            id=frame1
    ${frame1_text}     Get Text   id=frame1 >>> id=sampleHeading
    Log               ${frame1_text}

    ${frame2_text}     Get Text   id=frame2 >>> id=sampleHeading
    Log               ${frame2_text}

