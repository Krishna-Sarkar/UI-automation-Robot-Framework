*** Settings ***
Library    JSONLibrary
Library    Collections
Resource   ../config/global.robot


*** Keywords ***
Read JSON and Return value
    [Arguments]    ${json_file_name}    ${json_path}
    ${json_obj}    JSONLibrary.Load Json From File    ${CURDIR}/../testdata/${TESTING_ENV}/${json_file_name}
    @{json_val}    JSONLibrary.Get Value From Json    ${json_obj}     ${json_path}
    RETURN       ${json_val}[0]

Read JSON and Return Array
    [Arguments]    ${json_file_name}    ${json_path}
    ${json_obj}    JSONLibrary.Load Json From File    ${CURDIR}/../testdata/${TESTING_ENV}/${json_file_name}
    @{json_val}    JSONLibrary.Get Value From Json    ${json_obj}     ${json_path}
    RETURN       ${json_val}[0]

Read JSON and Return Dictionary
    [Arguments]    ${json_file_name}    ${json_path}
    ${json_obj}    JSONLibrary.Load Json From File    ${CURDIR}/../testdata/${TESTING_ENV}/${json_file_name}
    @{json_val}    JSONLibrary.Get Value From Json    ${json_obj}     ${json_path}
    ${json_val1}    Convert Json To String    ${json_val}[0]
    &{dict}      Evaluate    json.loads(''' ${json_val1} ''')    json
    RETURN        &{dict}

    