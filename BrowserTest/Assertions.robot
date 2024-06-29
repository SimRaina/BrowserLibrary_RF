*** Settings ***
Library       Browser
Test Setup    Open Browser to Register Page
Resource    ../Resource.robot

*** Variables ***
${expected_text}            Register
${expected_title}           nopCommerce demo store. Register
${expected_url}             https://demo.nopcommerce.com/register
${expected_attrvalue}       FirstName
${expected_inner_text}      Your Personal Details

*** Test Cases ***
AssertionTest

    # get text
    # no need to save the value in actual variable as we are directly asserting
    # ${actual_text}        Get Text     //div[@class='page-title']/h1      ==      ${expected_text}
    Get Text     //div[@class='page-title']/h1      ==      ${expected_text}
    # Log      ${actual_text}   not required

    # get title
    Get Title    ==     ${expected_title}

    # get url
    Get Url        ==      ${expected_url}

    # get element count
    Get Element Count       //a             >     60

    # get element states
    Get Element States       //input[@id='gender-male']         contains      unchecked  visible   enabled    editable

    # get checkbox state
    Scroll To Element         //input[@id='Newsletter']
    Get Checkbox State      //input[@id='Newsletter']    ==      checked

    # get attribute
    Scroll To Element         //div[1]/div[2]/div[2]/input
    Get Attribute        //div[1]/div[2]/div[2]/input     name    ==  ${expected_attrvalue}

    # get attribute names
    Get Attribute Names          //div[1]/div[2]/div[2]/input     contains   id  name   type

    # get bounding box
    Get BoundingBox         //div[1]/div[2]/div[2]/input           width  ==  400

    # get property
    Get Property    //form/div[1]/div[1]/strong        innerText   ==     ${expected_inner_text}

