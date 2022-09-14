*** Settings ***
Library    RPA.Browser.Selenium

*** Variables ***
${Etunimi}=     Pekka

*** Keywords ***
Avaa taitotalon sivu
    Open Available Browser    https://www.taitotalo.fi/
Hyväksy evästeet
    Click Button    class:coi-banner__accept
Hae haku lomakkeella
    [Arguments]    ${Hakusana}
    Input Text    hakusanat    ${Hakusana}
    Click Button    edit-submit-search-results
Hae ensimmäistä koulutusta
    Click Element    xpath://ul[@class='ael-liftup row search-results__list']/li[1]//a[contains(@class, 'button-register')]
Täytä lomakkeen tiedot
    Input Text  edit-field-contact-person-first-name-0-value    ${Etunimi}
    Select From List By Value   field_contact_person_national   004
Ota kuvankaappaus
    Screenshot  filename=test.png
Sulje selain
    Close Browser

*** Test Cases ***
Testaa taitotalon haku ja ilmottautuminen
    Avaa taitotalon sivu
    Hyväksy evästeet
    Hae haku lomakkeella    Python
    Hae ensimmäistä koulutusta
    Täytä lomakkeen tiedot
    Ota kuvankaappaus
    Sulje selain