*** Settings ***
Library           AppiumLibrary
Resource          ../keywords/Keywords.robot
Resource          ../locators/landing-page.robot

*** Test Cases ***
KHA1-2: User can see the onboarding screen
    [Setup]      Set Up Application
    Allow Notification
    Wait Until Element Is Visible    ${LANDING_ONBOARDING_TITLE}    timeout=${WAITING}
    Wait Until Element Is Visible    ${LANDING_BUTTON_SKIP}
    [Teardown]   Tear Down Application