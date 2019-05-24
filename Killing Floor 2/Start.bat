@echo off
title Killing Floor 2 Server Starter

:: SteamCMD Settings ::
:: Steam Username (Or anonymous)
set username=anonymous
set password=
:: SteamCMD Location
set runcmd=D:\Servers\steamcmd
:: Server Location
set srcdsdir="D:\Servers\Killing Floor 2"
:: Server AppID https://developer.valvesoftware.com/wiki/Dedicated_Servers_List
set appid=232130
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
set steamid=

:: Server Settings ::
set paramline= -nographics
set settings= kf-bioticslab?adminpassword=ohui71QQ

:menu
cls
echo --------------------------------------------------------------------------------
echo Killing Floor 2 Server Starter
echo --------------------------------------------------------------------------------
echo.
echo [1] Start
echo [2] Update Server
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
echo Launching Killing Floor 2 Server
echo --------------------------------------------------------------------------------
echo.
echo Launching . . .
echo.
cd %srcdsdir%\Binaries\Win64
start /wait /b KFserver.exe %paramline% %settings% %authkey% %steamid%
cls
echo --------------------------------------------------------------------------------
echo Killing Floor 2 Server running!
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