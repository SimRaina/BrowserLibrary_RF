*** Settings ***
Library     Browser

*** Test Cases ***
Open Firefox Maximized
    New Browser    firefox    headless=False  args=["--start-maximized"]
    New Context    viewport=None
    New Page       https://example.com
    Close Browser