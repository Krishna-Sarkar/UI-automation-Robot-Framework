*** Settings ***
Library     JSONLibrary
Resource    ../config/global.robot
Resource    ../utils/jsonreader.robot
Resource    ../libraries/ui/lib/loginfunction.robot
Resource    ../libraries/ui/lib/appointmentfunction.robot
Resource    ../libraries/assertions/assertionfunction.robot


*** Test Cases ***
Verify Login and Appointment Creation
    [Documentation]    Verify that the user can logina and make an appointment
    [Tags]    regression
    &{loginDetail}    jsonreader.Read JSON and Return Dictionary    loginDetail.json    $.Admin
    global.UI Open Browser and Navigate to URL    ${Website_URL}
    loginfunction.Redirect and login with ${loginDetail}
    &{appointmentDetail}    jsonreader.Read JSON and Return Dictionary    appointmentDetail.json    $
    appointmentfunction.Make a new appointment with ${appointmentDetail}
    assertionfunction.Validate the appointment details with ${appointmentDetail}
    global.UI Quit Browser
