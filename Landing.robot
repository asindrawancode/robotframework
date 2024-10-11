*** Settings ***
Library           AppiumLibrary
Library           Collections
Resource          Keywords.robot

*** Variables ***
${LANDING_ONBOARDING_TITLE}   //android.widget.TextView[ends-with(@resource-id, ":id/text_intro_title")]
${LANDING_BUTTON_SKIP}        //android.widget.TextView[ends-with(@resource-id, ":id/text_intro_next_step")]

*** Test Cases ***
KHA1-2: User can see the onboarding screen
    [Setup]      Set Up Application
    Allow Notification
    Wait Until Element Is Visible    ${LANDING_ONBOARDING_TITLE}    timeout=${WAITING}
    Wait Until Element Is Visible    ${LANDING_BUTTON_SKIP}
    [Teardown]   Tear Down Application