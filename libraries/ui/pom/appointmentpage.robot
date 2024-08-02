*** Settings ***
Library    Browser    
Library    String

*** Variables ***
${ddFacility}    \#combo_facility
${chkHospitalReadmission}    \#chk_hospotal_readmission
${txtCommentBox}    \#txt_comment
${btnBookAppointment}    \#btn-book-appointment



*** Keywords ***

Select the facility
    [Arguments]    ${facility}
    Browser.Select Options By    ${ddFacility}    value    ${facility}


Click on hospital readmission
    Browser.Click    ${chkHospitalReadmission}


Select Healthcare Program
    [Arguments]    ${radHealthcareProg}
    Browser.Click    ${radHealthcareProg}


Select Visit Date
    [Arguments]    ${visitDate}
    Evaluate JavaScript    ${None}    \$('#txt_visit_date').val('${visitDate}')

Fill Comment
    [Arguments]    ${comments}
    Browser.Fill Text    ${txtCommentBox}    ${comments}

Click on Book Appointment
    Browser.Click    ${btnBookAppointment}

