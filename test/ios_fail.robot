*** Settings ***
Resource  base.robot
Resource  ios_keywords.robot
Test Setup  Open iOS Test App
Test Teardown  Close Application

*** Test Cases ***
Set monthly budget
  Agree To Terms
  Wait Until Element Is Visible     accessibility_id=add_first_emission.btn
  Click Element  accessibility_id=add_first_emission.btn

  Wait Until Page Contains  Add emission

  Scroll Down       accessibility_id=show_datepicker_btn
  Click Element     accessibility_id=show_datepicker_btn
  Wait Until Element Is Visible     nsp=value == "October"
  Swipe Up  nsp=type=="XCUIElementTypePicker"
  # Swipe Down  nsp=type=="XCUIElementTypePicker"
  Click Text    Confirm

  Wait Until Page Contains  November 2020
  # Wait Until Page Contains  September 2020

  Sleep   5
