@echo off
title Rust Server Launcher

:: SteamCMD Settings ::
:: Steam Username (Or anonymous)
set username=anonymous
set password=
:: SteamCMD Location
set runcmd=D:\Servers\steamcmd
:: Server Location
set srcdsdir=D:\Servers\Rust
:: Server AppID https://developer.valvesoftware.com/wiki/Dedicated_Servers_List
set appid=258550
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

set paramline= -batchmode -nographics

:: Server Settings ::
set sessionname="Esco's Rust Server"
set maxplayers=1337
:: Server Port
set port=28015
:: Query Port
set rconport=28016
:: Rcon Password
set rconpw=qwerty

set tickrate=100
set identity=build
set worldsize=4000
set decay=0

:: Server Config Location
set cfg="server\%identity%\cfg\server.cfg"

:menu
cls
echo --------------------------------------------------------------------------------
echo Rust Server Launcher
echo --------------------------------------------------------------------------------
echo.
echo [1] Start
echo [2] Update the Server
echo [Exit] Exit
echo.
set /p op=Run:
if %op%==1 goto start
if %op%==2 goto update
if %op%==exit goto exit
goto error

:start
cls
echo --------------------------------------------------------------------------------
echo Launching Rust Server
echo --------------------------------------------------------------------------------
echo.
echo Launching . . .
echo.
RustDedicated.exe %paramline% +server.hostname %sessionname% +server.maxplayers %maxplayers% +server.port %port% +rcon.port %rconport% +rcon.port %rconpw% +server.tickrate %tickrate% +server.identity %identity% +server.wolrdsize %worldsize% -cfg %cfg% %authkey% %steamid%
cls
echo --------------------------------------------------------------------------------
echo Rust Server running!
echo --------------------------------------------------------------------------------
echo.
echo Server successfully started!
echo A new window will open soon
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
echo Server updated
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