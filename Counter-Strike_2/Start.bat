@echo off
title Counter-Strike Global Offensive Server Starter

:: SteamCMD Settings ::
:: Steam Username (Or anonymous)
set username=anonymous
set password=
:: SteamCMD Location
set runcmd=D:\Servers\steamcmd
:: Server Location
set srcdsdir=D:\Servers\CSGO
:: Server AppID https://developer.valvesoftware.com/wiki/Dedicated_Servers_List
set appid=740
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
set paramline= -nographics -console -usercon -condebug
set settings= -game csgo -port 27016 +game_type 0 +game_mode 1 +mapgroup mg_bomb +map de_dust2 -tickrate 128

:menu
cls
echo --------------------------------------------------------------------------------
echo Counter-Strike Global Offensive Server Starter
echo --------------------------------------------------------------------------------
echo.
echo [1] Start
echo [2] Start with Anti-Crash
echo [update] Update Server
echo [exit] Exit
echo.
set /p op=Run:
if %op%==1 goto start
if %op%==2 goto update
if %op%==exit goto exit
goto error

:start
cls
echo --------------------------------------------------------------------------------
echo Launching Counter-Strike Global Offensive Server
echo --------------------------------------------------------------------------------
echo.
echo Launching . . .
echo.
cd %srcdsdir%
start /wait /b srcds.exe %paramline% %settings% %authkey% %steamid%
cls
echo --------------------------------------------------------------------------------
echo Counter-Strike Global Offensive Server running!
echo --------------------------------------------------------------------------------
echo.
echo Have fun!
echo.
/k pause
goto exit

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