*** Settings ***
Library  AppiumLibrary
Library  BuiltIn

***Keywords***
Agree To Terms
  Wait Until Element Is Visible     accessibility_id=agree_btn
  Click Element  accessibility_id=agree_btn


Create Simple Emission
  Wait Until Element Is Visible     accessibility_id=add_first_emission.btn
  Click Element  accessibility_id=add_first_emission.btn

  Wait Until Page Contains  Add emission

  Scroll Down   accessibility_id=Add this emission
  Click Text  Add this emission

  Wait Until Page Contains  Carbon Budget


Swipe Up
  [Arguments]    ${locator}
  ${element_size}=    Get Element Size    ${locator}
  ${element_location}=    Get Element Location    ${locator}
  ${start_x}=         Evaluate      ${element_location['x']} + (${element_size['width']} * 0)
  ${start_y}=         Evaluate      ${element_location['y']} + (${element_size['height']} * 0.5)
  ${end_x}=           Evaluate      ${element_location['x']} + (${element_size['width']} * 0)
  ${end_y}=           Evaluate      ${element_location['y']} + (${element_size['height']} * 0.3)
  Swipe               ${start_x}    ${start_y}  ${end_x}  ${end_y}  500
  Sleep  1

Swipe Down
  [Arguments]    ${locator}
  ${element_size}=    Get Element Size    ${locator}
  ${element_location}=    Get Element Location    ${locator}
  ${start_x}=         Evaluate      ${element_location['x']} + (${element_size['width']} * 0)
  ${start_y}=         Evaluate      ${element_location['y']} + (${element_size['height']} * 0.3)
  ${end_x}=           Evaluate      ${element_location['x']} + (${element_size['width']} * 0)
  ${end_y}=           Evaluate      ${element_location['y']} + (${element_size['height']} * 0.5)
  Swipe               ${start_x}    ${start_y}  ${end_x}  ${end_y}  500
  Sleep  1


Swipe Right
  [Arguments]    ${locator}
  ${element_size}=    Get Element Size    ${locator}
  ${element_location}=    Get Element Location    ${locator}
  ${start_x}=         Evaluate      ${element_location['x']} + (${element_size['width']} * 0.3)
  ${start_y}=         Evaluate      ${element_location['y']} + (${element_size['height']} * 0)
  ${end_x}=           Evaluate      ${element_location['x']} + (${element_size['width']} * 0.538)
  ${end_y}=           Evaluate      ${element_location['y']} + (${element_size['height']} * 0)
  Swipe               ${start_x}    ${start_y}  ${end_x}  ${end_y}  500
  Sleep  1