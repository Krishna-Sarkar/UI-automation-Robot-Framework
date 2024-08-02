*** Settings ***
Library    Browser    
Library    String

*** Variables ***
${btnHamburger}    \#menu-toggle
${btnLoginTab}    //a[normalize-space()='Login']
${txtUsername}    \#txt-username
${txtPassword}    \#txt-password
${btnLogin}       \#btn-login 



*** Keywords ***

Click on the hamburger button
    Browser.Click    ${btnHamburger}


Click on Login tab
    Browser.Click    ${btnLoginTab}

Enter UserName
    [Arguments]    ${username}
    Browser.Fill Text    ${txtUsername}    ${username}

Enter Password
    [Arguments]    ${password}
    Browser.Fill Text    ${txtPassword}    ${password}

Click on Login
    Browser.Click    ${btnLogin}
