*** Settings ***
Resource    resources/ssh_keywords.robot
Suite Setup    Open SSH Connection
Suite Teardown    Close SSH Connection

*** Test Cases ***
Check System Memory
    ${memory_info}=    Get System Memory Info
    Log    \n${memory_info}    level=INFO
    Should Not Be Empty    ${memory_info}

Check Disk Usage
    ${disk_usage}=    Get Disk Usage
    Log    \n${disk_usage}    level=INFO
    Should Not Be Empty    ${disk_usage}

Check System Uptime
    ${uptime}=    Get System Uptime
    Log    \n${uptime}    level=INFO
    Should Not Be Empty    ${uptime}

Check CPU Information
    ${cpu_info}=    Get CPU Info
    Log    \n${cpu_info}    level=INFO
    Should Not Be Empty    ${cpu_info}

Check Network Interfaces
    ${interfaces}=    Get Network Interfaces
    Log    \n${interfaces}    level=INFO
    Should Not Be Empty    ${interfaces}

Check Running Processes
    ${processes}=    Get Running Processes
    Log    \n${processes}    level=INFO
    Should Not Be Empty    ${processes}

Check System Temperature
    ${temp}=    Get System Temperature
    Log    \n${temp}    level=INFO
    Should Not Be Empty    ${temp} 