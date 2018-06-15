*** Settings ***
Documentation     Example String & Variable
Suite Setup       Log To Console    \n\t    Start Code String and Variable
Test Timeout      30 seconds
Library           Selenium2Library
Library           Collections
Library           OperatingSystem
Library           DateTime
Library           String

*** Variables ***
${StrLine}        \n\n----------------------------------------------------------\n\n
${a}              10
${b}              5
@{Array}          2    1    C    A
&{Dict}           Fname=Robot    Lname=UFT    Int1=3    Int2=5

*** Test Cases ***
TC01_Plus
    [Documentation]    Check Variable Plus Variable
    [Tags]    TC01
    ${Result}    Evaluate    ${a} + ${b}
    Log To Console    ${a} + ${b} = ${Result}

TC02_Minus
    [Tags]    TC02
    ${Result}    Evaluate    ${a} - ${b}
    Log To Console    ${a} - ${b} = ${Result}

TC04_Array
    [Tags]    TC04    Array
    ${Result}    Evaluate    @{Array}[0] + @{Array}[2]
    Log To Console    @{Array}[0] + @{Array}[1] = ${Result}

TC05_DataDictionary
    ${Result}    Evaluate    &{Dict}[Int1] + &{Dict}[Int2]
    Log To Console    &{Dict}[Int1] + &{Dict}[Int2] = ${Result}

Set Variable
    ${c}    Set Variable    Hello World
    Set Test Variable    ${d}    RobotFramework_is_Easy
    Log To Console    ${c}
    Log To Console    ${d}

Create_Array
    [Documentation]    Create Variable Array
    [Tags]    Create_Array    StringAndVariable
    @{Ary_Input}    Create List
    : FOR    ${Index}    IN RANGE    0    20
    \    @{Ary_Input}    Create List    @{Ary_Input}    ${Index}
    Log To Console    \nLog To Console Array\n${Ary_Input}
    Log List    ${Ary_Input}

String Example
    [Documentation]    String Example
    [Tags]    String
    ${str}=    Set Variable    ID Card 99999
    Log To Console    \n\t str=${str}

    # Replace String with RegEx
    ${str}    Replace String Using Regexp    ${str}    ([0-9]{5})    Hidden ID Card from RegEX
    Log To Console    \n\t string replace =${str}
    Log To Console    ${StrLine}
    Log To Console    String Variable = '${Str}'

    # String Convert Uppercase & Lowercase
    ${str}=    Set Variable    Robot Framework is Easy
    ${strEX_UpperCase}    Convert To Uppercase    ${str}
    Log To Console    \n\t String [${str}] Convert To UpperCase = [${strEX_UpperCase}]

    ${strEX_LowerCase}    Convert To Lowercase    ${str}
    Log To Console    \n\t String [${str}] Convert To LowerCase = [${strEX_LowerCase}]

    # Sub String
    ${strEX_SubString}    Get Substring    ${str}    4    10
    Log To Console    \n\t String [${str}] Sub String 4 - 10 = [${strEX_SubString}]

    ${strEX_SubString}    Get Substring    ${str}    5
    Log To Console    \n\t String [${str}] Sub String 5 = [${strEX_SubString}]

    ${strEX_SubString}    Get Substring    ${str}    -2
    Log To Console    \n\t String [${str}] Sub String -2 = [${strEX_SubString}]

    # Remove String
    ${strEx_Remove}    Remove String    ${str}    Easy
    Log To Console    \n\t String [${str}] String Remove [Easy] = ${strEx_Remove}

    # Replace String
    ${strEX_Replace}    Replace String    ${str}    Easy    Hard
    Log To Console    \n\t String [${str}] String Replace [Easy - Hard] = ${strEX_Replace}

    # Split String
    ${strEx_Split}    Split String    ${str}    ${space}
    Log To Console    \n\t String [${str}] String Split [Space]= ${strEx_Split}

    # Strip String    ${space} = " "
    ${strTrim}    Set Variable    ${space}${space}ABC DEF GH${space}${space}
    Log To Console    \n\t Before Trim = '${strTrim}'
    ${strTrim}    Strip String    ${strTrim}
    Log To Console    \n\t After Trimx = '${strTrim}'

    # Check Point Compare Value
    Should Be Equal    ${strTrim}    ABC DEF GH
    Log To Console    ${StrLine}
