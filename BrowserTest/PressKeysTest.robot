*** Settings ***
Library       Browser
Library    Dialogs
Test Setup    Open Browser to OrangeHRM Page
Resource    ../Resource.robot

*** Variables ***

*** Test Cases ***
Test1
  Press Keys         //input[@name='username']     a   d  m   i  n
  Press Keys         //input[@name='username']     Control+A   Control+C
  Press Keys         //input[@name='password']     Control+V    1  2   3
  Click              //button
  Click              //span[text()='Admin']
  Press Keys        //label[text()='Username']/parent::div/following-sibling::div/input       s  i  m
  Pause Execution
  Press Keys        //label[text()='Username']/parent::div/following-sibling::div/input       Control+A    Backspace
  Pause Execution
  Press Keys        //label[text()='Username']/parent::div/following-sibling::div/input       s  i  m     Tab
  Press Keys        //*[contains(text(),'Employee')]/parent::div/following-sibling::div//input   a
  Wait Sleep
  Press Keys        //*[contains(text(),'Employee')]/parent::div/following-sibling::div//input   ArrowDown   Enter