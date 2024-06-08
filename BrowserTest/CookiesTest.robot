*** Settings ***
Library       Browser
Test Setup    Open Browser to guru99 Page
Resource    ../Resource.robot

*** Test Cases ***
FirstTest

   Type Text        xpath=//input[@name="username"]             abc123
   Type Text        xpath=//input[@name="password"]             123xyz
   Click            xpath=//button[text()="Login"]

   # get cookies - each cookie consist of key value pairs
   @{cookies}          Get Cookies          # list of dictionaries
   Log             ${cookies}

   # How many cookies?
   ${number_of_cookies}    Get length    ${cookies}
   Log           ${number_of_cookies}

   # get one cookie by name
   ${name}       Get Cookie     gdpr-auditId  # value of the key: name
   # print cookie's values by value and domain keys
   Log             ${name.value}  # value and domain are other keys in the same cookie
   Log             ${name.domain}

   # add your own cookie - give mandatory keys and values
   Add Cookie      name=sim       value=seniorqa     domain=demo.guru99.com   path=/sim

   ${name}         Get Cookie       sim
   Log             ${name.value}

   @{new_cookies}      Get Cookies
   Log             ${new_cookies}

   ${new_size}=    Get length    ${new_cookies}
   Log            ${new_size}

   # delete all cookies - no option to delete specific cookie
   Delete All Cookies

   @{cookie_after_deletion}      Get Cookies

   ${deleted_size}=    Get length    ${cookie_after_deletion}
   Log    ${deleted_size}


