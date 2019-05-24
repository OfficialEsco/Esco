@echo off
title Counter-Strike Source Server Starter

:: SteamCMD Settings ::
:: Steam Username (Or anonymous)
set username=anonymous
set password=
:: SteamCMD Location
set runcmd=D:\Servers\steamcmd
:: Server Location
set srcdsdir=D:\Servers\CSS
:: Server AppID https://developer.valvesoftware.com/wiki/Dedicated_Servers_List
set appid=232330
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
set paramline=-game cstrike -console -usercon -port 27016 -condebug +map de_dust2 +sv_lan 0 +maxplayers 12

:menu
cls
echo --------------------------------------------------------------------------------
echo Counter-Strike Source Server Starter
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
echo Launching Counter-Strike Source Server
echo --------------------------------------------------------------------------------
echo.
echo Launching . . .
echo.
cd %srcdsdir%
start /wait /high srcds.exe %paramline% %authkey% %steamid%
cls
echo --------------------------------------------------------------------------------
echo Counter-Strike Source Server running!
echo --------------------------------------------------------------------------------
echo.
echo Have fun!
echo.
/k pause
goto exit

:2
cls
echo --------------------------------------------------------------------------------
echo Launching Counter-Strike Source Server with Anti-Crash
echo --------------------------------------------------------------------------------
echo.
echo Launching . . .
echo.
cd %srcdsdir%
start /wait /high srcds.exe %paramline% %authkey% %steamid%
cls
echo --------------------------------------------------------------------------------
echo Counter-Strike Source Server with Anit-Crash running!
echo --------------------------------------------------------------------------------
echo.
echo Leave this window open for the server to restart on crash!
echo.
cls
echo --------------------------------------------------------------------------------
echo Server Crashed!
echo -------------------------------------------------------------------------------- 
echo.
echo Restarting the server!
echo.
/t 10 goto 2

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
echo.
echo Command not recognized.
echo.
pause
cls
goto menu

:exit
exit