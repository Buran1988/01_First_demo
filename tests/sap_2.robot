*** Settings ***
Library    Process
Library    SapGuiLibrary

Suite Setup    Enable Screenshots On Error

*** Variables ***
${SAPSCREEN}    /app/con[0]/ses[0]/wnd[0]
${POPUP_SCREEN}    /app/con[0]/ses[0]/wnd[1]

${TABLE}   ${SAPSCREEN}/usr/tblEC_TUTORIAL_TCDTC1


*** Test Cases ***
Вход в SAP систему
    Connect To Session
    Open Connection    Sapland 003         # Имя сервера из SAPLogon
    Input Text         ${SAPSCREEN}/usr/txtRSYST-MANDT    100
    Input Text         ${SAPSCREEN}/usr/txtRSYST-BNAME    nkalutskiy
    Input Password     ${SAPSCREEN}/usr/pwdRSYST-BCODE    Init_12345678
    Input Text         ${SAPSCREEN}/usr/txtRSYST-LANGU    RU
    Click Element      ${SAPSCREEN}/mbar/menu[0]/menu[0]    
    # Click Element      ${POPUP_SCREEN}/tbar[0]/btn[0]


Открыть транзакцию EC_TUTORIAL_TCD
    Run Transaction    EC_TUTORIAL_TCD
    Input Text         ${SAPSCREEN}/usr/ctxtSDYN_CONN-CARRID   LH
    Input Text         ${SAPSCREEN}/usr/ctxtSDYN_CONN-CONNID   0400
    Click Element      ${SAPSCREEN}/usr/btnBUTTON1


Проверить значение ячейки в Classic ALV
    # Получить значение ячейки (строка 0, колонка по имени поля)
    # ${value}=    Get Cell Value    ${TABLE}    0    WA_FLIGHTTABLE-FLDATE
    # Should Be Equal    ${value}    EUR

    # Проверить количество строк
    ${count}=    Get Row Count    ${TABLE}
    Should Be True    ${count} > 0    
    