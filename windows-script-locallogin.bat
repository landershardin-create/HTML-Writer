@echo off
setlocal enabledelayedexpansion

set "username=admin"
set "password=secret123"

set /p "user=Enter username: "
set /p "pass=Enter password: "

if "!user!"=="%username%" if "!pass!"=="%password%" (
    echo Access granted.
) else (
    echo Access denied.
)
pause