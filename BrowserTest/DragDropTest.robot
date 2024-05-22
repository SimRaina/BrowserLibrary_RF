*** Settings ***
Library       Browser
Library       Dialogs   # using Pause Execution
Library       Collections     # Using list and Dictionary
Test Setup    Open Browser to Droppable Page
Resource    ../Resource.robot

*** Variables ***

*** Test Cases ***
DragDropTest1
    Wait For Elements State    //div[@id='draggable']    visible
    Wait For Elements State    //div[1]/div/div[@id='droppable']    visible
    Scroll To Element          //div[@id='draggable']
    Drag And Drop              //div[@id='draggable']    //div[1]/div/div[@id='droppable']
    Pause Execution

DragDropTest2
   # for Drag And Drop By Coordinates we need x, y coordinates of both drag and drop element
   @{list}        Calculate Drag And Drop Coordinates
   Scroll To Element          //div[@id='draggable']
   Drag And Drop By Coordinates    from_x=${list}[0]  from_y=${list}[1]  to_x=${list}[2]   to_y=${list}[3]
   Pause Execution
