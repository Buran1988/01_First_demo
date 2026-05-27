*** Settings ***
Library    Process
Library    SapGuiLibrary

*** Test Cases ***
Запустить SAP Logon
    Start Process    C:\\Program Files (x86)\\SAP\\FrontEnd\\SAPgui\\saplogon.exe
    Sleep    3s