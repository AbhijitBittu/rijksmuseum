*** Settings ***
Library     Browser
Library     Dialogs
Library     String
Resource  TestAssignment/Configurations/webElement.resource
Resource  TestAssignment/Keywords/common.resource


*** Variables ***
${URL}=  https://www.rijksmuseum.nl/en




*** Test Cases ***
Perform sign-In
    Open URL in the Browser  ${URL}
    Click  ${accept_Cookie}
    Click  ${login_link}
    Wait For Elements State    ${sign-up}   visible
    Verify Text  With your Rijksstudio account  ${EMPTY}
    Click  ${sign-up}
    ${ret} =	Generate Random String    5
    ${emailID}=  Set Variable   ${ret}@gmail.com
    Log To Console  text- ${ret}/${emailID}
    Wait For Elements State    ${username}   visible
    Type Text    ${username}        ${ret}    delay=10 ms
    Type Text    ${email}           ${emailID}    delay=10 ms
    Type Secret  ${password1}       ${ret}    delay=10 ms
    Type Secret    ${password2}       ${ret}    delay=10 ms
    Click   ${sign-up-submit}
    Store Username  ${ret}

Verify Login
    Opening Browser and Access the URL
    Perform Login
    ${value}=  Get Text  ${login_link}
    Run Keyword And Continue On Failure   Should Not Contain  ${value}   Login
    Log To Console  verification Complete


Verify the picture is being added in the collection list
    Opening Browser and Access the URL
    Perform Login
    Click  ${rijksstudioButton}
    Wait For Elements State    ${image_Johannes}   visible
    Click  ${image_Johannes}
    ${img_url}=  Get Attribute   ${imgURL1}   data-src
    ${img_url}=  Split String Into Two Parts   ${img_url}
    Click  ${collection_heart1}  force=true
    Scroll To Element   ${addMyCollection}
    Click  ${addMyCollection}
    Sleep  1s
    Wait For Elements State    ${closePopUp}   visible
    Click  ${closePopUp}
    Click  ${navigateToCollection}
    Sleep  2s
    Wait For Elements State    ${getStarted}   visible
    Click  ${getStarted}
    Wait For Elements State    ${imgURL2}   visible
    ${img_url_added}=  Get Attribute   ${imgURL2}   data-src
    ${img_url_added}=  Split String Into Two Parts   ${img_url_added}
    Run Keyword And Continue On Failure   Should Contain  ${img_url}   ${img_url_added}
    Log To Console  Verification Completed


Perform and Verify Advanced Search
    Opening Browser and Access the URL
    Perform Login
    Click  ${rijksstudioButton}
    Wait For Elements State    ${image_Johannes}   visible
    Click  ${searchButton}
    Click  ${advancedSearch}
    Type Text  ${searchFor}  Utagawa Kuniyoshi  delay=10 ms
    Type Text  ${SearchTitle}    Bloemen   delay=10 ms
    Check Checkbox   ${onlyWithImage}
    Type Text  ${SearchStartDate}   1847   delay=10 ms
    Type Text  ${SearchEndDate}    1850   delay=10 ms
    Scroll To Element  ${submit}
    Click  ${submit}
    Sleep  2s
    Verify Result  3
    Pause Execution




