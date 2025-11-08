@echo off
set /p "username=Enter network username: "
set /p "password=Enter network password: "
set /p "drive=Enter drive letter (e.g., Z): "
set /p "path=Enter network path (e.g., \\server\share): "

net use %drive%: %path% /user:%username% %password%

if %errorlevel%==0 (
    echo Network drive mapped successfully to %drive%:
) else (
    echo Failed to map network drive. Check credentials and path.
)
pause