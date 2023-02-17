*** Settings ***
Library    SeleniumLibrary
Variables    ../Resources/localisateurs.py

*** Variables ***
${URL}     https://www.ebay.com/   
${BROWSER}    chrome
@{vMot_rechercher}    Iphone 11    toy Cars     soap
@{mum_repère}    1000    100    50
${num_results}        0
${lnk_rechercheAvancer}    //a[@id='gh-as-a']
${txt_recherch}    //input[@id='gh-ac']
${btn_recherchersimple}    //input[@id='gh-btn']
${btn_Allgetegorie}    //select[@id='gh-cat']
#${btn_Baby}    //select[@id='gh-cat']//option[text()='Baby']
${btn_Baby}               //select[@id='gh-cat']//option[@value='2984']

*** Keywords ***
Cas A
    [Documentation]    Scénario A lien de recherche avancée    
    Open Browser    ${URL}    ${BROWSER}   
    Maximize Browser Window
    Get Selenium Implicit Wait
    Click Element    ${lnk_rechercheAvancer} 
    Page Should Contain    Find items    
    Close Browser
Cas B
   [Documentation]    nombre d’éléments de recherche
    Open Browser    ${URL}    ${BROWSER}   
    Maximize Browser Window
    Get Selenium Implicit Wait   
    Input Text    ${txt_recherch}    ${vMot_rechercher}[0]
    Click Element    ${btn_recherchersimple}
    Wait Until Page Contains Element    css=.srp-controls__count-heading
    ${num_results}=    Get Text    //h1[contains(text(), 'results for')]/span
    Page Should Contain     results for ${vMot_rechercher}[0]   
    Should Be True    ${num_results} >= ${mum_repère}[0]
    Close Browser
Cas C
    [Documentation]    nombre d’éléments de recherche II
    Open Browser    ${URL}    ${BROWSER}   
    Maximize Browser Window
    Get Selenium Implicit Wait   
    Input Text    ${txt_recherch}    ${vMot_rechercher}[1]
    Click Element    //input[@id='gh-btn']
    Wait Until Page Contains Element    css=.srp-controls__count-heading
    ${num_results}=    Get Text    //h1[contains(text(), 'results for')]/span
    Page Should Contain     results for ${vMot_rechercher}[1]   
    Should Be True    ${num_results} >= ${mum_repère}[1]
    Close Browser
Cas D
    [Documentation]    Rechercher un article dans la catégorie 
    Open Browser    ${URL}    ${BROWSER}   
    Maximize Browser Window
    Get Selenium Implicit Wait   
    Input Text    ${txt_recherch}    ${vMot_rechercher}[2]
    Click Element    ${btn_Allgetegorie}
    Wait Until Element Is Visible    ${btn_Baby}
    Click Element    ${btn_Baby}
    Click Element    ${btn_recherchersimple}
    Wait Until Page Contains Element    css=.srp-controls__count-heading
    ${num_results}=    Get Text    //h1[contains(text(), 'results for')]/span
    Page Should Contain     results for ${vMot_rechercher}[2]   
    Should Be True    ${num_results} >= ${mum_repère}[2]
    Close Browser




       