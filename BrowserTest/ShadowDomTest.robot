
*** Settings ***
Library    Browser

*** Test Cases ***
Click Shop Now Inside Shadow DOM
    New Browser    chromium  headless=false
    New Context
    New Page    https://shop.polymer-project.org/
    Click   shop-home >> shop-button >> a[aria-label="Men's Outerwear Shop Now"]
    Sleep    3s
    Close Browser
