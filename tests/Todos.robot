*** Settings ***
Library           Browser
Suite Setup    New Browser   chromium  No

*** Test Cases ***
Simple Todo
    New Page    https://todomvc.com/examples/react/dist

    
    Fill Text    .new-todo    Do Something
    
    Press Keys   .new-todo   Enter
    Take Screenshot
    Close Page