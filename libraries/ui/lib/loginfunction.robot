*** Settings ***
Resource    ../../../libraries/ui/pom/loginPage.robot

*** Keywords ***
Redirect and login with ${loginDetail}
    loginPage.Click on the hamburger button
    loginPage.Click on Login tab
    loginPage.Enter UserName    ${loginDetail}[UserName]
    loginPage.Enter Password    ${loginDetail}[Password]
    loginPage.Click on Login