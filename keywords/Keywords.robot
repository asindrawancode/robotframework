*** Settings ***
Library           AppiumLibrary

*** Variables ***
${REMOTE_URL}                 ${REMOTE_URL}
${PLATFORM_NAME}              Android
${UDID}                       ${UDID}
${APP_PACKAGE}                id.co.duniagames
${APP_ACTIVITY}               id.co.duniagames.page.main.activity.SplashScreenActivity
${ALLOW_NOTIFICATION}         //android.widget.Button[@resource-id="com.android.permissioncontroller:id/permission_allow_button"]
${WAITING}                    10

*** Keywords ***
Allow Notification
    Wait Until Element Is Visible    ${ALLOW_NOTIFICATION}         timeout=${WAITING}
    Click Element                    ${ALLOW_NOTIFICATION}

Set Up Application
    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME}    udid=${UDID}    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}    automationName=UIAutomator2

Tear Down Application
    Close Application

