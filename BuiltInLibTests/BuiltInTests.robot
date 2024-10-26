*** Settings ***

*** Variables ***
@{NAMES}    John    Alex    Skip    Maria
@{NUMBERS}    1    2    3    4    5

*** Test Cases ***
Call Method Test
    ${result} =  Call Method    Hello World   find    World   # calling find method
    Log    ${result}  # Logs: 6 (because 'World' starts at index 6)

Catenate Test
    ${str1} =	Catenate	Hello	world
    ${str2} =	Catenate	SEPARATOR=---	Hello	world
    Log Many     ${str1}    ${str2}
    Comment    This line is a comment and will be ignored

Convert Tests
    ${result} =	Convert To Binary	10			# Result is 1010
    Log  ${result}
    ${result} =	Convert To Number	42.512	1	# Result is 42.5  Precision = 1
    Log  ${result}

FailTest
   Fail	Test not ready			# Fails with the given message.

GetTime Tests
  ${time} =	Get Time
  ${secs} =	Get Time	epoch
  ${year} =	Get Time	return year
  ${yyyy}	${mm}	${dd} =	Get Time	year,month,day
  @{time} =	Get Time	year month day hour min sec
  ${y}	${s} =	Get Time	seconds and year

RepeatKeyword Test
   Repeat Keyword	5 times	PrintHello

RunKeyword Tests
   Run Keyword    Log    Hello, seniorQA!
   ${condition}=    Set Variable    True
   Run Keyword If    ${condition}    Log    Condition is True
   Run Keywords    Log    First message    AND    Log    Second message
   Run Keyword And Continue On Failure    Fail    This will not stop the test
   Log    Test execution continued despite failure

ContinueForLoop Test
  FOR    ${name}    IN    @{NAMES}
        Log    Checking ${name}
        Run Keyword If    '${name}' == 'Skip'    Continue For Loop
        Log    ${name} is processed  # skips in case of 'Skip'
  END
  FOR    ${num}    IN    @{NUMBERS}
        Log    Checking number ${num}
        Continue For Loop If    ${num} == 3
        Log    Number ${num} is valid
  END

*** Keywords ***
PrintHello
  ${var}      Set Variable     Hello
  Log To Console     ${var}


