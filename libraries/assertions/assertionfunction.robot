*** Settings ***
Library    JSONLibrary
Library    Browser


*** Variables ***
${txtFacility}    \#facility
${txtHospitalReadmission}    \#hospital_readmission
${txtProgram}    \#program
${txtVisitDate}    \#visit_date
${txtComment}    \#comment



*** Keywords ***
Validate the appointment details with ${appointmentDetail}
    ${tempData}    Browser.Get Text    ${txtFacility}
    Should Be Equal As Strings    ${tempData}    ${appointmentDetail}[Facility] 
    ${tempData}    Browser.Get Text    ${txtHospitalReadmission}
    IF    ${appointmentDetail}[Apply for hospital readmission]==True
        Should Be Equal As Strings    ${tempData}    Yes
    ELSE
        Should Be Equal As Strings    ${tempData}    No 
    END
    ${tempData}    Browser.Get Text    ${txtProgram}
    IF    '''${appointmentDetail}[Healthcare Program]'''=='''#radio_program_medicare'''
        Should Be Equal As Strings    ${tempData}    Medicare 
    ELSE IF    '''${appointmentDetail}[Healthcare Program]'''=='''#radio_program_medicaid'''
        Should Be Equal As Strings    ${tempData}    Medicaid 
    ELSE IF    '''${appointmentDetail}[Healthcare Program]'''=='''#radio_program_none'''
        Should Be Equal As Strings    ${tempData}    None    
    END
    ${tempData}    Browser.Get Text    ${txtVisitDate}
    Should Be Equal As Strings    ${tempData}    ${appointmentDetail}[Visit Date]
    ${tempData}    Browser.Get Text    ${txtComment}
    Should Be Equal As Strings    ${tempData}    ${appointmentDetail}[Comment]



