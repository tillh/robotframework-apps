*** Settings ***
Resource  base.robot
Test Setup  Open Android Test App
Test Teardown  Close Application


*** Variables ***
${DEFAULT_WAIT_TIME}    10000

*** Test Cases ***
Navigation Test
  Wait Until Element Is Visible     accessibility_id=agree_btn  ${DEFAULT_WAIT_TIME}
  Click Element   accessibility_id=agree_btn
  
  Wait Until Page Contains    Carbon Budget  ${DEFAULT_WAIT_TIME}
  Click Text  Act
  Sleep   5
  
  Wait Until Page Contains  Sustainable Guide   ${DEFAULT_WAIT_TIME}
  Click Text  Eating seasonal and local
  
  Wait Until Page Contains  Eating seasonal fruits and vegetables   ${DEFAULT_WAIT_TIME}
  Page Should Contain Text  We all love tomatoes.
  Sleep   5

