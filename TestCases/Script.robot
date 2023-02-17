*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/Keywords.robot
#Test Setup    Login




*** Variables ***
${URL}    https://www.ebay.com/
${BROWSER}    chrome


*** Test Cases ***
Scenario A
    Cas A
Scenario B
    Cas B
Scenario C
    Cas C
Sscenario D
    Cas D
