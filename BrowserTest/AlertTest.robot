*** Settings ***
Library       Browser
Test Setup    Open Browser to Alert Page
Resource    ../Resource.robot

*** Test Cases ***
AlertTest1
  # We use Wait For Alert keyword but it works with Promise To
  # which is another keyword mostly used with Wait keywords
  # Wait for Alert uses argument action=accept / or dismiss on the Alert
  # Interestingly, Wait for Alert comes first in the code and then we write
  #click on the element that opens the Alert.
   Promise To         Wait For Alert    action=accept
   Wait Sleep
   Click              id=alertButton

   # we can also pass text to some alert that has text box using
   # prompt_input argument of Wait for Alert
  #Promise To    Wait For Alert    action=accept    prompt_input="hello"
  #Wait Sleep
  # Click              id=promtButton
  # Wait Sleep

  #We can also use another keyword Handle Future Dialogs to do the same
  # This doesn't require Promise To Keyword
  #Handle Future Dialogs    action=accept     prompt_input="hello"
  #Click         id=promtButton
  #Wait Sleep

