*** Settings ***
Library    Browser
Test Setup       Open Browser to Demo Page
Resource       ../Resource.robot

*** Test Cases ***
LocatorTextTest
     #Text
     #Click    text="Register"
     #Click     "Register"
     #Click      css=li > a.ico-register  # . is to denote class attribute
     # li is parent and a is the child of li with class as ico-register
     # Above line of code can also be written as below
     Click    li > .ico-register
     Wait Sleep
     #Type Text    id=FirstName    sim
     #Type Text    css=div > input#FirstName    txt   #  \# denotes id attribute and \ is escape
     # character. div is parent and input is child of div with id as FirstName

     # There is another way to write above by using  double >> sign but there is a slight
     # difference compared to single > sign

     Type Text    css=div >> id=FirstName    txt  # here we use id attribute directly
     # and not the html element like input that we used previously with > sign
     # Also understand that > and >> are used with reference with the left side css parent
     # input or id is at child level from div css
     
     # Lastly xpath is used normally how we use it everywhere else like in Selenium
     Type Text    xpath=//*[@id="LastName"]    raina
     # we can also use it withut xpath=
     #Type Text    //*[@id="LastName"]         raina


