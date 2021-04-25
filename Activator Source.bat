@ECHO off
ECHO Kanji's Windows 10 Activator
ECHO Discord: Kanji#1111
timeout /t 3 /nobreak >nul
goto checkPrivileges

:checkPrivileges
ECHO.
ECHO.
ECHO Checking admin permissions..
timeout /t 3 /nobreak >nul
setlocal DisableDelayedExpansion
set "batchPath=%~0"
for %%k in (%0) do set batchName=%%~nk
set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
setlocal EnableDelayedExpansion
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )

:getPrivileges
ECHO No admin privileges, escalating now..
timeout /t 3 /nobreak >nul
if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)
ECHO.
ECHO.
ECHO Invoking UAC for Privilege Escalation
timeout /t 3 /nobreak >nul
ECHO Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivileges%"
ECHO args = "ELEV " >> "%vbsGetPrivileges%"
ECHO For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
ECHO args = args ^& strArg ^& " "  >> "%vbsGetPrivileges%"
ECHO Next >> "%vbsGetPrivileges%"
ECHO UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
"%SystemRoot%\System32\WScript.exe" "%vbsGetPrivileges%" %*
exit /B

:gotPrivileges
ECHO Admin privileges are granted.
setlocal & pushd .
cd /d %~dp0
if '%1'=='ELEV' (del "%vbsGetPrivileges%" 1>nul 2>nul  &  shift /1)
goto startacti

:startacti
ECHO.
ECHO.
ECHO Getting system information....
systeminfo | findstr /B /C:"OS Name"
timeout /t 3 /nobreak >nul
slmgr.vbs /upk
timeout /t 3 /nobreak >nul
SET "OS="
FOR /F "skip=1 tokens=*" %%a IN ('WMIC OS GET CAPTION') DO IF NOT DEFINED OS SET OS=%%a
SET OS=%OS: =%
IF "%OS%"=="MicrosoftWindows10Pro" GOTO W10Pro
IF "%OS%"=="MicrosoftWindows10ProN" GOTO W10ProN
IF "%OS%"=="MicrosoftWindows10Home" GOTO W10Home
IF "%OS%"=="MicrosoftWindows10HomeN" GOTO W10HomeN
IF "%OS%"=="MicrosoftWindows10Enterprise" GOTO W10Enterprise
IF "%OS%"=="MicrosoftWindows10EnterpriseN" GOTO W10EnterpriseN
IF "%OS%"=="MicrosoftWindows10Education" GOTO W10Education
IF "%OS%"=="MicrosoftWindows10EducationN" GOTO W10EducationN

:W10Pro
ECHO.
ECHO.
ECHO Activating Windows 10 Pro...
ECHO Please wait...
slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
GOTO Thanks

:W10ProN
ECHO.
ECHO.
ECHO Activating Windows 10 Pro N...
ECHO Please wait...
slmgr /ipk MH37W-N47XK-V7XM9-C7227-GCQG9
GOTO Thanks

:W10Home
ECHO.
ECHO.
ECHO Activating Windows 10 Home...
ECHO Please wait...
slmgr /ipk TX9XD-98N7V-6WMQ6-BX7FG-H8Q99
GOTO Thanks

:W10HomeN
ECHO.
ECHO.
ECHO Activating Windows 10 Home N...
ECHO Please wait...
slmgr /ipk 3KHY7-WNT83-DGQKR-F7HPR-844BM
GOTO Thanks

:W10Enterprise
ECHO.
ECHO.
ECHO Activating Windows 10 Enterprise...
ECHO Please wait...
slmgr /ipk NPPR9-FWDCX-D2C8J-H872K-2YT43
GOTO Thanks

:W10EnterpriseN
ECHO.
ECHO.
ECHO Activating Windows 10 Enterprise N...
ECHO Please wait...
slmgr /ipk DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4
GOTO Thanks

:W10Education
ECHO.
ECHO.
ECHO Activating Windows 10 Education...
ECHO Please wait...
slmgr /ipk NW6C2-QMPVW-D7KKK-3GKT6-VCFB2
GOTO Thanks

:W10EducationN
ECHO.
ECHO.
ECHO Activating Windows 10 Education N...
ECHO Please wait...
slmgr /ipk 2WH4N-8QGBV-H22JP-CT43Q-MDWWJ
GOTO Thanks

:Thanks
ECHO.
ECHO.
slmgr /skms kms8.msguides.com
slmgr /ato
ECHO Activated "%OS%" on your system.
ECHO Thank you for using Kanji's Windows 10 Activator.
timeout /t 3 /nobreak >nul
ECHO.
ECHO.
ECHO Exitting...
timeout /t 2 /nobreak >nul
exit 0