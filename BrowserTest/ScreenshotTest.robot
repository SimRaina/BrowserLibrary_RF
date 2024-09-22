*** Settings ***
Library       Browser
Test Setup    Open Browser to OrangeHRM Page
Resource    ../Resource.robot

*** Variables ***

*** Test Cases ***
Test1
  Take Screenshot     screenshot-{index}  # index 1
  Take Screenshot     screenshot-{index}  # index 2
  Take Screenshot     fullPage=True    fileType=jpeg    quality=50
  Take Screenshot     EMBED        # Screenshot is embedded to the log.html