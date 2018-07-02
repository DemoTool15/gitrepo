*** Settings ***
Documentation     Eample Xpath
Suite Setup       Log To Console    Start Code Xpath Example
Test Timeout      2 minute
Library           Selenium2Library
Library           Collections
Library           OperatingSystem
Library           DateTime
Library           String
Resource          Keyword/General_Keyword.robot

*** Test Cases ***
MercuryTour Login
    [Documentation]    XPath WorkShop    Mercury Tour Login
    ...    Link : \ http://newtours.demoaut.com/
    [Timeout]    5 minutes
    Set Selenium Speed    3s
    Run Keyword    OpenWebURL    http://newtours.demoaut.com/
    Sleep    5s
    Page Should Contain Element    //td/input[@name="userName"]
    ${Get_Element}    Get Text    //font[contains(.,'Password:')]
    Log To Console    \n\t Get Element Label Password = ${Get_Element}
    ${Get_Element}    Get Text    //div[@class='footer']
    Log To Console    \n\t Get Element Footer = ${Get_Element}

    Input Text    //td/input[@name="userName"]    jojo01

    Input Text    //input[@name="userName"]    jojo02

    Input Text    userName    jojo03    # default Locater is NAME and ID (HTML)

    Input Text    name=userName    jojo05

    Input Text    //*[@name="userName"]    jojo06

    Input Text    //input[@*="userName"]    jojo07

    # Robot Continue next Step when this step fail or error
    Run Keyword And Continue On Failure    Input Text    id=userName    jojo08

    Run Keyword And Continue On Failure    Input Text    /html/body/div/table/tbody/tr/td[2]/table/tbody/tr[4]/td/table/tbody/tr/td[2]/table/tbody/tr[2]/td[3]/form/table/tbody/tr[4]/td/table/tbody/tr[2]/td[2]/input    jojo09

    # If No 'Run Keyword And Continue On Failure' Robot will stop this step in this test case
    Input Text    /html/body/div/table/tbody/tr/td[2]/table/tbody/tr[4]/td/table/tbody/tr/td[2]/table/tbody/tr[2]/td[3]/form/table/tbody/tr[4]/td/table/tbody/tr[2]/td[2]/input    jojo10

    Input Text    //input[@*="userName"]    jojo11
    #[Teardown]    Close All Browsers

WLS
    [Documentation]    XPath WorkShop    WeloveShopping
    Run Keyword    OpenWebURL    https://portal.weloveshopping.com/
    Sleep    3s
    Page Should Contain Element    //a[@title='เข้าสู่ระบบ']
    Page Should Contain    เข้าสู่ระบบ
    Click Link    //a[contains(.,'DEAL Zap')]
    #Click Element    //label[@class='label-input' and contains(.,'แฟชั่น')]
    Page Should Contain Element    //a[@title='เข้าสู่ระบบ']
    Execute Javascript    $(document).scrollTop(100)
    Sleep    2s
    #Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    #Select Checkbox    xpath=//label[@class='label-input' and contains(.,'แฟชั่น')]
    Click Element    //label[contains(.,'แฟชั่น')]/input
    Page Should Contain    Deal Zapp

    #Click Product in DealZap Category 'แฟชั่น'
    Focus    //a[@class='item-name' and contains(.,'บราผีเสื้อ บราปีกผีเสื้อ บราไร้สาย บรากาว')]
    Click Link    //a[@class='item-name' and contains(.,'บราผีเสื้อ บราปีกผีเสื้อ บราไร้สาย บรากาว')]
    #Click Link    //a[@class='item-name' and contains(.,'Mango Wallet')]

    Page Should Contain    ดูรายละเอียด
    Focus    //a[@class='cursor-pointer' and contains(.,'ดูรายละเอียด')]
    Click Link    //a[@class='cursor-pointer' and contains(.,'ดูรายละเอียด')]
    Page Should Contain    Wallet by truemoney
    Sleep    2s
    Click Link    //a[@target='_blank' and contains(.,'สมัครสมาชิก')]
    Sleep    2s
    Click Button    //button[@class='btn']
    Page Should Contain    support@weloveshopping.com
    ${Str_URL}    Execute Javascript    return window.location.href;
    Log To Console    \n\t \ ${Str_URL}
    Log    ${Str_URL}
    Focus    //button[@class='btn']

kingpower
    [Documentation]    XPath kingpower    WeloveShopping Login
    Open Browser    https://www.kingpower.com/    Chrome
    Maximize Browser Window
    Set Selenium Speed    2s
    Sleep    3s
    Input Text    header-input-text-search    perfume
    Click Element    header-search-box-button
    Wait Until Page Contains    perfume
    Sleep    3s
    Input Text    //*[@id="header-search-box-input-text"]    swatch
    Click Element    //*[@id="header-search-box-button"]
    Wait Until Page Contains    swatch
    Sleep    3s
    [Teardown]    Close Browser