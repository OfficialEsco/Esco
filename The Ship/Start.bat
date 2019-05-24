@echo off
title The Ship Server Starter

:: Please enter your login below to Steam
set username=
:: Your Steam password (for the anonymous login, leave the password blank)
set password=
:: SteamCMD path
set runcmd=D:\Servers\steamcmd
:: Server path
set srcdsdir=D:\Servers\TheShip
:: Server AppID https://developer.valvesoftware.com/wiki/Dedicated_Servers_List
set appid=2403
:: Verify the integrity of files on the server when you run? (0 = no, 1 = yes)
set checkvalid=0
::Authkey http://steamcommunity.com/dev/apikey
set authkey=-authkey 
::Steam ID http://steamcommunity.com/dev/managegameservers
set steamid=+sv_setsteamaccount 

if %checkvalid%==0 (
set cmdparam=
) else (
set cmdparam=validate
)

:menu
cls
echo --------------------------------------------------------------------------------
echo The Ship Server Starter
echo --------------------------------------------------------------------------------
echo.
echo [1] Start
echo [2] Start with Anti-Crash
echo [update] Update Server
echo [exit] Exit
echo.
set /p op=Run:
if %op%==1 goto 1
if %op%==2 goto 2
if %op%==update goto update
if %op%==exit goto exit
goto error

:1
cls
echo --------------------------------------------------------------------------------
echo Launching The Ship Server
echo --------------------------------------------------------------------------------
echo.
echo Launching...
set paramline=-game ship -console -usercon -hostport 27016 -condebug +map cotopaxi +sv_lan 0 +maxplayers 12
cls
echo --------------------------------------------------------------------------------
echo The Ship Server running!
echo --------------------------------------------------------------------------------
echo.
echo Have fun!
cd %srcdsdir%
start /wait /high srcds.exe %paramline% %authkey% %steamid%
pause
goto exit

:2
cls
echo --------------------------------------------------------------------------------
echo Launching The Ship Server with Anti-Crash
echo --------------------------------------------------------------------------------
echo.
echo Launching...
set paramline=-game ship -console -usercon -hostport 27016 -condebug +map cotopaxi +sv_lan 0 +maxplayers 12
goto start
cls
echo --------------------------------------------------------------------------------
echo The Shipp Server with Anit-Crash running!
echo --------------------------------------------------------------------------------
echo.
echo Leave this window open for the server to restart on crash!
cd %srcdsdir%
start /wait /high srcds.exe %paramline% %authkey% %steamid%
cls
echo --------------------------------------------------------------------------------
echo Server Crashed!
echo -------------------------------------------------------------------------------- 
echo.
echo Restarting the server!
goto 2

:update
cls
echo --------------------------------------------------------------------------------
echo Searching for Server Update
echo --------------------------------------------------------------------------------
echo.
cd %runcmd%
start /wait steamcmd +login %username% %password% +force_install_dir %srcdsdir% +app_update %appid% %cmdparam% +quit
cls
echo --------------------------------------------------------------------------------
echo Server successfully updated
echo --------------------------------------------------------------------------------
echo.
echo Server successfully updated!
echo.
pause
goto menu

:error
echo Command not recognized.
goto menu

:exit
exit