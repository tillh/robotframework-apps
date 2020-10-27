*** Settings ***
Resource  base.robot
Resource  ios_keywords.robot
Test Setup  Open iOS Test App
Test Teardown  Close Application

*** Test Cases ***
Set monthly budget
  Agree To Terms
  Create Simple Emission

  Wait Until Page Contains  Set monthly budget
  Click Element     accessibility_id=Set monthly budget
  Wait Until Page Contains  Monthly Budget

  Swipe    82    148    200    148
  # Swipe Right  nsp=value == "17%"

  Click Text    Save

  Wait Until Page Contains  Carbon Budget
  Page Should Contain Text  Budget for october : 533 kg

  Sleep   5
