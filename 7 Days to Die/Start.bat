@echo off
title 7 Days To Die Server Starter

:: SteamCMD Settings ::
:: Steam Username
set username=
set password=
:: SteamCMD Location
set runcmd=D:\Servers\steamcmd
:: Server Location
set srcdsdir=D:\Servers\7DaysToDie
:: Server AppID https://developer.valvesoftware.com/wiki/Dedicated_Servers_List
set appid=294420
:: Verify server files? (0 = no, 1 = yes)
set checkvalid=0

if %checkvalid%==0 (
set cmdparam=
) else (
set cmdparam=validate
)

:: Steam Settings ::
:: Authkey http://steamcommunity.com/dev/apikey
set authkey=-authkey 
:: Steam ID http://steamcommunity.com/dev/managegameservers
set steamid=+sv_setsteamaccount 

:: Server Settings ::
set paramline=-logfile 7DaysToDieServer_Data\output_log%LOGTIMESTAMP%.txt -batchmode -nographics -configfile=serverconfig.xml -dedicated %authkey% %steamid%

:menu
cls
echo.
echo --------------------------------------------------------------------------------
echo 7 Days To Die Server Starter
echo --------------------------------------------------------------------------------
echo.
echo [1] Start
echo [2] Update Server
echo [3] Update Server to Beta
echo [exit] Exit
echo.
set /p op=Run:
if %op%==1 goto 1
if %op%==2 goto 2
if %op%==3 goto 3
if %op%==exit goto exit
goto error

:1
cls
echo.
echo --------------------------------------------------------------------------------
echo Launching 7 Days To Die Server
echo --------------------------------------------------------------------------------
echo.
echo Launching . . .
echo.
cd %srcdsdir%
set LOGTIMESTAMP=


:: --------------------------------------------
:: REMOVE OLD LOGS (only keep latest 20)

for /f "tokens=* skip=19" %%F in ('dir 7DaysToDieServer_Data\output_log*.txt /o-d /tc /b') do del 7DaysToDieServer_Data\%%F



:: --------------------------------------------
:: BUILDING TIMESTAMP FOR LOGFILE

:: Check WMIC is available
WMIC.EXE Alias /? >NUL 2>&1 || GOTO s_start

:: Use WMIC to retrieve date and time
FOR /F "skip=1 tokens=1-6" %%G IN ('WMIC Path Win32_LocalTime Get Day^,Hour^,Minute^,Month^,Second^,Year /Format:table') DO (
	IF "%%~L"=="" goto s_done
	Set _yyyy=%%L
	Set _mm=00%%J
	Set _dd=00%%G
	Set _hour=00%%H
	Set _minute=00%%I
	Set _second=00%%K
)
:s_done

:: Pad digits with leading zeros
Set _mm=%_mm:~-2%
Set _dd=%_dd:~-2%
Set _hour=%_hour:~-2%
Set _minute=%_minute:~-2%
Set _second=%_second:~-2%

Set LOGTIMESTAMP=__%_yyyy%-%_mm%-%_dd%__%_hour%-%_minute%-%_second%

echo|set /p="251570" > steam_appid.txt

cls
echo.
echo --------------------------------------------------------------------------------
echo 7 Days To Die running!
echo --------------------------------------------------------------------------------
echo.
echo Have fun!
echo Go to localhost:8081 to shutdown the server correctly
echo.

:s_start
start /wait /b 7daystodieserver.exe %paramline%
cls
echo.
echo --------------------------------------------------------------------------------
echo Server Shutdown
echo --------------------------------------------------------------------------------
echo.
echo Server successfully Shutdown!
echo.
pause
goto exit

:2
cls
echo.
echo --------------------------------------------------------------------------------
echo Searching for Server Update
echo --------------------------------------------------------------------------------
echo.
echo Looking for Update... Please wait.
echo. 
cd %runcmd%
start /wait steamcmd +login %username% %password% +force_install_dir %srcdsdir% +app_update %appid% %cmdparam% +quit
cls
echo.
echo --------------------------------------------------------------------------------
echo Server successfully updated
echo --------------------------------------------------------------------------------
echo.
echo Server successfully updated!
echo.
pause
goto menu

:3
cls
echo.
echo --------------------------------------------------------------------------------
echo Searching for Beta Update
echo --------------------------------------------------------------------------------
echo.
echo Looking for Beta Update... Please wait. 
echo. 
cd %runcmd%
start /wait steamcmd +login %username% %password% +force_install_dir %srcdsdir% +app_update %appid% %cmdparam% -beta latest_experimental +quit
cls
echo.
echo --------------------------------------------------------------------------------
echo Server successfully updated
echo --------------------------------------------------------------------------------
echo.
echo Server successfully updated!
echo.
pause
goto menu

:error
echo.
echo Command not recognized.
echo.
pause
cls
goto menu

:exit
exit
