*** Settings ***
Library     Browser
Library     Dialogs
Library     String
Library     DateTime
Library    OperatingSystem
Library  TestAssignment/Configurations/Helper.py
Resource  TestAssignment/Configurations/webElement.resource


*** Variables ***
${username_inFile}=   TestAssignment/Keywords/username.txt


*** Keywords ***

# Opening browser in headless (False)
Open URL in the Browser
    [Arguments]  ${URL}
    New Browser  headless=False
    New Context  ignoreHTTPSErrors=True
    New page    ${URL}
    Log To Console   Opening browser in headless


Verify text
    [Arguments]  ${text}  ${selector}
    IF  "${selector}" != "${EMPTY}"
        Log To Console  => With Web Locators
        Scroll To Element   ${selector}
        Run Keyword And Continue On Failure  Wait For Elements State  ${selector}  visible  2s  #ensure element
        ${value}=  Get Text  ${selector}
        Should Contain   ${value}  ${text}   ignore_case=True
#        Run Keyword And Continue On Failure  Get Text  ${selector}  ==  ${text}  #ensure correct text is used
        Log To Console  Verify text = ${text}
    ELSE
        Log To Console  => Without Web Locators
        Run Keyword And Continue On Failure  Wait For Elements State  text=${text}  visible  2s
        Log To Console  Verified text = ${text}
    END

Store Username
    [Arguments]  ${username}
    make_file_empty      ${username_inFile}
    Create file      ${username_inFile}    ${username}


Opening Browser and Access the URL
    Open URL in the Browser  ${URL}
    Click  ${accept_Cookie}
    Click  ${login_link}
    Wait For Elements State    ${sign-up}   visible
    Verify Text  With your Rijksstudio account  ${EMPTY}

Perform Login
    ${StoredUsername}=   Get File   ${username_inFile}
    ${L-email}=  Set Variable   ${StoredUsername}@gmail.com
    ${L-pwd}=  Set Variable   ${StoredUsername}
    Type Text   ${loginEmail}    ${L-email}
    Type Text   ${loginPassword}    ${L-pwd}
    Click   ${sign-up-submit}


Split String into two parts
    [Arguments]  ${str}
    ${pre}	${post} =	Split String	${str}   =
    [Return]   ${pre}

Verify Result
    [Arguments]  ${exp_count}
    ${result}=  Get Text   //div[@class="item buttons-compact mobile-lg-1-1"]/a[1]
    Log To Console  ${result}
    ${pre}	${post} =	Split String	${result}
    Log To Console  ${pre}
    ${actual_imgCount}=  Get Element Count    //div[@id="infinite-scroll-page-results"]/figure
    ${actual_imgCount}=   Convert To String    ${actual_imgCount}
    Should Contain  ${exp_count}   ${actual_imgCount}  msg=Expected count of Image is 3 but actual:${actual_imgCount}