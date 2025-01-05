*** Settings ***
Library    SSHLibrary

*** Variables ***
# These must be provided via environment variables or command line arguments
${KALI_SSH_HOST}         ${EMPTY}
${KALI_SSH_USER}         ${EMPTY}
${KALI_SSH_PASSWORD}     ${EMPTY}

*** Keywords ***
Open SSH Connection
    [Documentation]    Opens SSH connection using credentials provided via environment variables or command line
    Should Not Be Empty    ${KALI_SSH_HOST}    msg=SSH host not provided. Set KALI_SSH_HOST environment variable or use -v KALI_SSH_HOST:your_host
    Should Not Be Empty    ${KALI_SSH_USER}    msg=SSH user not provided. Set KALI_SSH_USER environment variable or use -v KALI_SSH_USER:your_user
    Should Not Be Empty    ${KALI_SSH_PASSWORD}    msg=SSH password not provided. Set KALI_SSH_PASSWORD environment variable or use -v KALI_SSH_PASSWORD:your_password
    Open Connection    ${KALI_SSH_HOST}
    Login    ${KALI_SSH_USER}    ${KALI_SSH_PASSWORD}

Close SSH Connection
    Close All Connections

Execute Command And Return Output
    [Arguments]    ${command}
    ${output}=    Execute Command    ${command}
    RETURN    ${output}

Get System Memory Info
    ${memory_info}=    Execute Command    free -h
    RETURN    ${memory_info}

Get Disk Usage
    ${disk_usage}=    Execute Command    df -h
    RETURN    ${disk_usage}

Get System Uptime
    ${uptime}=    Execute Command    uptime
    RETURN    ${uptime}

Get CPU Info
    ${cpu_info}=    Execute Command    cat /proc/cpuinfo
    RETURN    ${cpu_info}

Get Network Interfaces
    ${interfaces}=    Execute Command    ip addr show
    RETURN    ${interfaces}

Get Running Processes
    ${processes}=    Execute Command    ps aux
    RETURN    ${processes}

Get System Temperature
    ${temp}=    Execute Command    vcgencmd measure_temp || echo "Temperature command not available"
    RETURN    ${temp} 