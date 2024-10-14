*** Settings ***
Library           AppiumLibrary    timeout=10    run_on_failure=Capture Page Screenshot
Resource          ../keywords/Keywords.robot
Resource          ../locators/home-page.robot


*** Test Cases ***
DG1-4: User can access home as guest
    [Setup]      Set Up Application
    Allow Notification
    Wait Until Element Is Visible    ${LANDING_BUTTON_SKIP}
    Click Element                    ${LANDING_BUTTON_SKIP}
    # # Wait Until Element Is Visible    ${HOME_POPUP_BANNER}
    # # Click Element                    ${HOME_POPUP_BANNER_CLOSE}
    # Wait Until Element Is Visible    ${HOME_GREETING_LABEL}

DG1-5: User can see home's content as guest
    # Element Should Contain Text      ${HOME_GREETING_LABEL}    Hi, Gamers!
    Wait Until Element Is Visible    ${HOME_BUTTON_UPDATE} 

# DG1-6: User can see the main menu    
#     Wait Until Element Is Visible    ${HOME_MENU_MAIN}
#     Wait Until Element Is Visible    ${HOME_MENU_GAMES}
#     Wait Until Element Is Visible    ${HOME_MENU_PROFILE}
#     Wait Until Element Is Visible    ${HOME_MENU_CHAT}
#     Wait Until Element Is Visible    ${HOME_MENU_TOPUP}
    [Teardown]   Tear Down Application
