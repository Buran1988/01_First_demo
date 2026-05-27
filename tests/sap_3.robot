*** Settings ***
Library    RoboSAPiens

*** Test Cases ***
Вход через RoboSAPiens
    Open SAP             C:${/}Program Files (x86)${/}SAP${/}FrontEnd${/}SAPgui${/}saplogon.exe
    Connect to Server    Sapland 003
    Fill Text Field      User              nkalutskiy
    Fill Text Field      Password          Init_12345678
    Fill Text Field      Logon Language          EN
    Push Button          Enter


Запуск EC_TUTORIAL_TCD
    # Connect to Running SAP

    Execute Transaction    /nEC_TUTORIAL_TCD
    Fill Text Field      Airline              LH
    Fill Text Field      Flight Number              0400
    Save Screenshot   LOG
    Push Button    Displ. Flights
    Select Table Row    3
    
    Push Button    Create Booking
    
    Select Text Field  Customer Number
    
    Press Key Combination  F4
    
    ${rows}    Get Row Count
    Log  ${rows}
    Select Cell    Adam Montero   Customer name
    
    Push Button  Apply
    Select Tab    Passengers

    Fill Cell    1    Passenger Name   Nikita
    Fill Cell    1    Title           Mr.
    Fill Cell    1    DOB of Passenger   01.01.1990
    Push Button  Save
    Save Screenshot   LOG
    ${statusbar}   Read Statusbar
    Should Contain    ${statusbar}[status]    Success




# Запуск nEC_TUTORIAL_SAPGUI
#     Connect to Running SAP

#     Execute Transaction    /nEC_TUTORIAL_SAPGUI
#     Expand Tree Folder    Flights/Alitalia
#     Expand Tree Folder    ROME -> FRANKFURT
#     # ...    /ROME -> FRANKFURT
#     Save Screenshot   LOG