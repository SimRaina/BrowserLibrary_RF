*** Variables ***
@{USER_CREDENTIALS}    user1    pass1    user2    pass2    user3    pass3

*** Test Cases ***
Login Test Cases
    [Template]       Login Test
    FOR    ${username}    ${password}    IN    @{USER_CREDENTIALS}
           ${username}        ${password}
    END

*** Keywords ***
Login Test
    [Arguments]          ${user}          ${pass}
    Log    Username: ${user}
    Log    Password: ${pass}
