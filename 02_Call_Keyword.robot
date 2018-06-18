*** Settings ***
Documentation     Keyword Example
Suite Setup       Log To Console    Example Keyword
Test Timeout      10 seconds
Library           Selenium2Library
Library           Collections
Library           OperatingSystem
Library           DateTime
Library           String

*** Test Cases ***
EX Call Keyword
    [Documentation]    Call Keyword
    [Tags]    Call_Keyword
    Run Keyword    Sum_Int    10    7
    Log To Console    \n\t Sum_int Result = ${Result}
    Sum_Int    10    7
    Log To Console    \n\t Sum_int Result = ${Result}

*** Keywords ***
Sum_Int
    [Arguments]    ${a}    ${b}
    ${Result}    Evaluate    ${a} + ${b}
    Set Test Variable    ${Result}
