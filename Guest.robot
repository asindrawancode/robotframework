*** Settings ***
Library           AppiumLibrary
Resource          Keywords.robot

*** Variables ***
${LANDING_BUTTON_SKIP}          //android.widget.TextView[ends-with(@resource-id, ":id/text_intro_next_step")]
${HOME_POPUP_BANNER}            //android.widget.FrameLayout[ends-with(@resource-id, ":id/cardView")]
${HOME_POPUP_BANNER_CLOSE}      //android.widget.ImageButton[ends-with(@resource-id, ":id/btnPopUpClose")]
${HOME_GREETING_LABEL}          //android.widget.TextView[ends-with(@resource-id, ":id/tvWelcomeUser")]
${HOME_MENU_MAIN}               //android.widget.FrameLayout[ends-with(@content-desc, "Home")]
${HOME_MENU_GAMES}              //android.widget.FrameLayout[ends-with(@content-desc, "Games")]
${HOME_MENU_TOPUP}              //android.widget.FrameLayout[ends-with(@content-desc, "Top Up")]
${HOME_MENU_CHAT}               //android.widget.FrameLayout[ends-with(@content-desc, "Chat")]
${HOME_MENU_PROFILE}            //android.widget.FrameLayout[ends-with(@content-desc, "Profile")]


*** Test Cases ***
DG1-4: User can access home as guest
    [Setup]      Set Up Application
    Allow Notification
    Wait Until Element Is Visible    ${LANDING_BUTTON_SKIP}
    Click Element                    ${LANDING_BUTTON_SKIP}
    Wait Until Element Is Visible    ${HOME_POPUP_BANNER}
    Click Element                    ${HOME_POPUP_BANNER_CLOSE}
    Wait Until Element Is Visible    ${HOME_GREETING_LABEL}

DG1-5: User can see home's content as guest
    Element Should Contain Text      ${HOME_GREETING_LABEL}    Hi, Gamers!

DG1-6: User can see the main menu    
    Wait Until Element Is Visible    ${HOME_MENU_MAIN}
    Wait Until Element Is Visible    ${HOME_MENU_GAMES}
    Wait Until Element Is Visible    ${HOME_MENU_PROFILE}
    Wait Until Element Is Visible    ${HOME_MENU_CHAT}
    Wait Until Element Is Visible    ${HOME_MENU_TOPUP}
    [Teardown]   Tear Down Application

# robot --variable REMOTE_URL:http://localhost:4723 --variable DEVICE_NAME:emulator-5554 runTest.robot
