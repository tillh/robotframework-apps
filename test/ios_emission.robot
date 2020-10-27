*** Settings ***
Resource  base.robot
Test Setup  Open iOS Test App
Test Teardown  Close Application

*** Test Cases ***
Create Emission
  Wait Until Element Is Visible     accessibility_id=agree_btn
  Click Element  accessibility_id=agree_btn

  Wait Until Element Is Visible     accessibility_id=add_first_emission.btn
  Click Element  accessibility_id=add_first_emission.btn

  Wait Until Element Is Visible   accessibility_id=add_emission_label
  Click Element     accessibility_id=add_emission_label
  Wait Until Element Is Visible   accessibility_id=add_emission_input

  Sleep   5

  Input Text    accessibility_id=add_emission_input  My First Emission
  Hide Keyboard

  Scroll Down   accessibility_id=Add this emission
  Click Text  Add this emission

  Wait Until Page Contains  Carbon Budget
  Sleep   5
