*** Settings ***
Library  AppiumLibrary
Library  BuiltIn


*** Variables ***
${ANDROID_AUTOMATION_NAME}    UIAutomator2
${ANDROID_APP}                ../../artifacts/not-my-fault-earth-917a2b5a909047f998a6bf22b75cc499-signed.apk
${ANDROID_PLATFORM_NAME}      Android
${ANDROID_PLATFORM_VERSION}   %{ANDROID_PLATFORM_VERSION=11}
${ANDROID_APP_PACKAGE}        nmf.earth

${IOS_AUTOMATION_NAME}        XCUITest
${IOS_APP}                    ../../artifacts/not-my-fault-earth.zip
${IOS_PLATFORM_NAME}          iOS
${IOS_PLATFORM_VERSION}       %{IOS_PLATFORM_VERSION=13.5}
${IOS_DEVICE_NAME}            %{IOS_DEVICE_NAME=iPhone 8}


*** Keywords ***
Open Android Test App
  [Arguments]    ${appActivity}=${EMPTY}
  open application  http://127.0.0.1:4723/wd/hub  automationName=${ANDROID_AUTOMATION_NAME}
  ...  app=${ANDROID_APP}  platformName=${ANDROID_PLATFORM_NAME}  platformVersion=${ANDROID_PLATFORM_VERSION}
  ...  appPackage=${ANDROID_APP_PACKAGE}  appActivity=${appActivity}


Open iOS Test App
  open application  http://127.0.0.1:4723/wd/hub  automationName=XCUITest
  ...  app=${IOS_APP}  platformName=iOS  platformVersion=13.5
  ...  deviceName=iPhone 8
