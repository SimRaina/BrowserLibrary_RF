*** Settings ***
Library     Collections

*** Test Cases ***
Append to List Example
    ${list} =  Create List    apple    banana
    Append To List    ${list}    cherry
    Log    ${list}   # Output: ['apple', 'banana', 'cherry']

Get From List Example
    ${list} =  Create List    red    green    blue
    ${color} =  Get From List    ${list}    1   # index
    Log    ${color}    # Output: green

Get Index From List Example
    ${list} =  Create List    red    green    blue
    ${color} =  Get Index From List    ${list}     blue
    Log   ${color}
 
Get Slice From List Example
    ${list} =  Create List    red    green    blue  pink  magenta    purple
    ${color} =  Get Slice From List    ${list}     2   5    # 5 index is exclusive
    Log   ${color}

Remove From List Example
    ${list} =  Create List    dog    cat    bird
    Remove From List    ${list}    1
    Log    ${list}   # Output: ['dog', 'bird']

Reverse List Example
    ${list} =  Create List    dog    cat    bird
    Reverse List    ${list}   # original list is changed
    Log    ${list}

Sort List Example
    ${list} =  Create List    dog    cat    bird  # alphabetically
    Sort List    ${list}
    Log    ${list}

List Should Contain Value Example
    ${list} =  Create List    apple    banana    cherry
    List Should Contain Value    ${list}    banana

Combine Lists Example
    ${list1} =  Create List    apple    banana
    ${list2} =  Create List    orange   cherry
    ${list3} =  Combine Lists   ${list1}     ${list2}

Count Values in List Example
    ${list1} =  Create List    apple    banana  apple  cherry  orange  tomato
    ${count} =  Count Values In List    ${list1}   apple
    Log    ${count}

Set to Dictionary Example
    ${dict} =  Create Dictionary    name=John    age=30   # key value pair
    Set To Dictionary    ${dict}    city    Paris       # new key value
    Log    ${dict}    # Output: {'name': 'John', 'age': 30, 'city': 'Paris'}

Get From Dictionary Example
    ${dict} =  Create Dictionary    name=Alice    age=25
    ${name} =  Get From Dictionary    ${dict}    name
    Log    ${name}   # Output: Alice

Get Dictionary Items Example
    ${dict} =  Create Dictionary    name=Alice    age=25
    ${name} =  Get Dictionary Items   ${dict}  # output in list form

Get Dictionary Keys Example
    ${dict} =  Create Dictionary    name=Alice    age=25
    ${keys} =  Get Dictionary Keys   ${dict}     # output in list form

Get Dictionary Values Example
    ${dict} =  Create Dictionary    name=Alice    age=25
    ${values} =  Get Dictionary Values   ${dict}    # output in list form

Remove From Dictionary Example
    ${dict} =  Create Dictionary    name=John    city=London
    Remove From Dictionary    ${dict}    city    # remove by key
    Log    ${dict}    # Output: {'name': 'John'}

Dictionary Should Contain Item Example
    ${dict} =  Create Dictionary    brand=Toyota    model=Corolla
    Dictionary Should Contain Item    ${dict}    brand    Toyota

Dictionary Should Contain Key Example
    ${dict} =  Create Dictionary    brand=Toyota    model=Corolla
    Dictionary Should Contain Key    ${dict}    brand

Dictionary Should Contain Value Example
    ${dict} =  Create Dictionary    name=Alice    city=Paris
    Dictionary Should Contain Value    ${dict}    Paris

Get Length Example
    ${list} =  Create List    apple    banana    cherry
    ${length} =  Get Length    ${list}
    Log    ${length}    # Output: 3
