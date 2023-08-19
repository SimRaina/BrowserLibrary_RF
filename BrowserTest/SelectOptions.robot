*** Settings ***
Library       Browser
Test Setup    Open Browser to SelectOptions Page
Resource    ../Resource.robot

*** Test Cases ***
SelectOptionsTest
    Wait Sleep
    ${all_options}=    Get Select Options     id=products-pagesize
    Log       ${all_options}
    ${selected_option}=    Get Selected Options      id=products-pagesize
    Log       ${selected_option}
    Select Options By      id=products-pagesize       index     2
    Wait Sleep
    Deselect Options       id=products-pagesize
    Wait Sleep
