*** Settings ***
Library       Browser
Library       JSONLibrary
Library       Collections
Library       String
Resource    ../Resource.robot

*** Variables ***
${TESTDATA}    testdata.json

*** Test Cases ***
ReadData
    # Load JSON data from file
    ${json_data}    Load JSON From File    ${CURDIR}${/}\\Data\\${TESTDATA}

    # Log JSON data
    Log To Console       ${json_data}

     # Accessing json values
    ${url}          Get Value From JSON    ${json_data}         url
    ${username}     Get Value From JSON    ${json_data}         username
    ${password}     Get Value From JSON    ${json_data}         password
    ${details}         Get Value From JSON    ${json_data}         details
    ${firstname}    Get Value From Json   ${json_data}          details.firstname
    ${lastname}    Get Value From Json   ${json_data}           details.lastname

    ${url_string}         Convert JSON To String        ${url}[0]
    ${plain_url}          Remove String        ${url_string}   ,    "
    ${username_string}    Convert JSON To String     ${username}[0]
    ${plain_username}     Remove String     ${username_string}   ,    "
    ${password_string}    Convert JSON To String     ${password}[0]
    ${plain_password}     Remove String     ${password_string}   ,    "

    Open Maximized Browser     Chromium
    Go to Site                 ${plain_url}
    Wait Sleep

    Fill Text    //form/div[1]/div/div[2]/input     ${plain_username}
    Fill Text    //form/div[2]/div/div[2]/input     ${plain_password}
    Click        //form/div[3]/button

AddUpdateJsonObject

   # Load JSON data from file
   ${json_data}    Load JSON From File    ${CURDIR}${/}\\Data\\${TESTDATA}
   ${dict}=	Create Dictionary	channelName=seniorqa
   ${json}=	Add Object To Json	${json_data}	details   ${dict}
   Log      ${json}
   Should Have Value In Json    ${json}    details.channelName
   ${new_json_data}=  Update Value To Json    ${json}    details.firstname    Simran
   Log   ${new_json_data}
   ${updated_json}=	Delete Object From Json	  ${new_json_data}	 details.channelName
   Log      ${updated_json}
   Should Not Have Value In Json    ${updated_json}    details.channelName
