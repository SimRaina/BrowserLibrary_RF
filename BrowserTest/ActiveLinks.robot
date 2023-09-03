*** Settings ***
Library       Browser
Test Setup    Open Browser to Demo Page
Resource    ../Resource.robot

*** Variables ***

*** Test Cases ***
OneLinkTest
    ${element} =    Get Element      li > .ico-register   # Get single Element and store in a variable
    Log     ${element}
    ${link} =    Get Property    ${element}    href     # Get href attribute value of the element (e.g. anchor tag)
    &{res}        Http    ${link}                       # use Http keyword to trigger that href url value
                                                        # store response in a dictionary
    Should Be Equal     ${res.status}     ${200}        # get the status value from the response and assert it to be 200 OK

MultiLinksTest
    @{elements} =   Get Elements   css=a                 # Get all elements with anchor tag and store in a list
    FOR    ${element}    IN    @{elements}               # Run for loop for each element
       ${link} =    Get Property    ${element}    href   # Get href url value for each element
       &{res}        Http    ${link}                     # Same as above
       Should Be Equal     ${res.status}     ${200}
    END             # For Loop Ends