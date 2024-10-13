*** Settings ***
Library     String

*** Variables ***
${MULTILINE}       This is the first line.\nThis is the second line.\nThis is the third and the last line.

*** Test Cases ***
Test1
      ${str1} =	Convert To Lower Case	ABC
      Log To Console     ${str1}
      ${str1} =	Convert To Upper Case	${str1}
      Log To Console     ${str1}
      ${str1} =	Convert To Title Case	hello, world!
      Log To Console     ${str1}

Test2
      ${str2}=  Fetch From Left    hello, world!      ,
      Log To Console    ${str2}
      ${str2}=  Fetch From Right    hello, world!     ,
      Log To Console    ${str2}

Test3
      ${all} =	Generate Random String	10	[LOWER][UPPER][LETTERS][NUMBERS]
      Log To Console    ${all}

Test4
      ${first} =	Get Line	${MULTILINE}	0
      Log To Console    ${first}
      ${count} =	Get Line Count	${MULTILINE}
      Log To Console    ${count}
      ${line} =	Get Lines Containing String	${MULTILINE}	second	 ignore_case=True
      Log To Console    ${line}

Test5
      ${sub} =	Get Substring	hello!   1  5    #2nd to 5th
      Log To Console    ${sub}
      ${lasttwo} =	Get Substring	hello!   -2
      Log To Console    ${lasttwo}

Test6
      ${str} =	Remove String	seniorqa	senior
      Log To Console    ${str}
      ${str} =	Replace String	Hello, seniorqa	   Hello	Hola
      Log To Console    ${str}
      @{words} =	Split String	This is the first line.
      Log To Console    ${words}
      @{characters} =	Split String To Characters	hello
      Log To Console    ${characters}
      ${stripped}=	Strip String	${SPACE}Hello${SPACE}World${SPACE}
      Log To Console    ${stripped}
