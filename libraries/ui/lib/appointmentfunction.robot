*** Settings ***
Resource    ../../../libraries/ui/pom/appointmentpage.robot

*** Keywords ***
Make a new appointment with ${appointmentDetail}
    appointmentpage.Select the facility    ${appointmentDetail}[Facility]
    IF    ${appointmentDetail}[Apply for hospital readmission]==True
        appointmentpage.Click on hospital readmission
    END
    appointmentpage.Select Healthcare Program    ${appointmentDetail}[Healthcare Program]
    appointmentpage.Select Visit Date    ${appointmentDetail}[Visit Date]
    appointmentpage.Fill Comment    ${appointmentDetail}[Comment]
    appointmentpage.Click on Book Appointment