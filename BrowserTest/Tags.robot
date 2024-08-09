*** Settings ***
Force Tags    regression

*** Test Cases ***
My Smoke Test
    [Tags]    smoke
    Log To Console      This is smoke test

My DB Test
    [Tags]    db
    Log To Console     This is db test