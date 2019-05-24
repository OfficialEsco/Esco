@echo off
title Garry's Mod Server Starter

:: SteamCMD Settings ::
:: Steam Username (Or anonymous)
set username=anonymous
set password=
:: SteamCMD Location
set runcmd=D:\Servers\steamcmd
:: Server Location
set srcdsdir=D:\Servers\GarrysMod
:: Server AppID https://developer.valvesoftware.com/wiki/Dedicated_Servers_List
set appid=4020
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
set settings= -game garrysmod -port 27016 -tickrate 100 +maxplayers 12

:menu
cls
echo --------------------------------------------------------------------------------
echo Garry's Mod Server Starter
echo --------------------------------------------------------------------------------
echo.
echo Select Gamemode
echo.
echo [1] Sandbox
echo [2] Prop Hunt
echo [3] The Hidden
echo [4] The Stalker
echo [5] Hide And Seek
echo [6] Cops And Runners
echo [7] Melon Bomber
echo [8] Murder
echo [9] Trash Compactor
echo [10] TTT
echo [11] Guess Who
echo [update] Update Server
echo [exit] Exit
echo.
set /p op=Run:
if %op%==1 goto Sandbox
if %op%==2 goto PropHunt
if %op%==3 goto TheHidden
if %op%==4 goto TheStalker
if %op%==5 goto HideAndSeek
if %op%==6 goto CopsAndRunners
if %op%==7 goto MelonBomber
if %op%==8 goto Murder
if %op%==9 goto TrashCompactor
if %op%==10 goto TTT
if %op%==11 goto GuessWho
if %op%==update goto update
if %op%==exit goto exit
goto error

:Sandbox
cls
echo --------------------------------------------------------------------------------
echo Launching Garrys Mod Sandbox Server
echo --------------------------------------------------------------------------------
echo.
echo Launching . . .
echo.
cd %srcdsdir%
start /wait /b srcds.exe %paramline% %settings% +gamemode sandbox +map gm_flatgrass %authkey% %steamid%
cls
echo --------------------------------------------------------------------------------
echo Garrys Mod SandBox Server running!
echo --------------------------------------------------------------------------------
echo.
echo Have fun!
echo.
/k pause
goto exit

:PropHunt
cls
echo --------------------------------------------------------------------------------
echo Launching Garrys Mod Prop Hunt Server
echo --------------------------------------------------------------------------------
echo.
echo Launching . . .
echo.
cd %srcdsdir%
start /wait /b srcds.exe %paramline% %settings% +gamemode prop_hunt +map cs_office +host_workshop_collection 703905444 %authkey% %steamid%
cls
echo --------------------------------------------------------------------------------
echo Garrys Mod Prop Hunt Server running!
echo --------------------------------------------------------------------------------
echo.
echo Have fun!
echo.
/k pause
goto exit

:TheHidden
cls
echo --------------------------------------------------------------------------------
echo Launching Garrys Mod The Hidden Server
echo --------------------------------------------------------------------------------
echo.
echo Launching . . .
cd %srcdsdir%
start /wait /b srcds.exe %paramline% %settings% +gamemode thehidden +map hdn_kindergarten +host_workshop_collection 703905444 %authkey% %steamid%
cls
echo --------------------------------------------------------------------------------
echo Garrys Mod The Hidden Server running!
echo --------------------------------------------------------------------------------
echo.
echo Have fun!
/k pause
goto exit

:TheStalker
cls
echo --------------------------------------------------------------------------------
echo Launching The Stalker
echo --------------------------------------------------------------------------------
echo.
echo Launching . . .
echo.
cd %srcdsdir%
start /wait /b srcds.exe %paramline% %settings% +gamemode stalker +map ts_annex +host_workshop_collection 703905444 %authkey% %steamid%
cls
echo --------------------------------------------------------------------------------
echo Garrys Mod The Stalker Server running!
echo --------------------------------------------------------------------------------
echo.
echo Have fun!
echo.
/k pause
goto exit

:HideAndSeek
cls
echo --------------------------------------------------------------------------------
echo Launching Hide And Seek
echo --------------------------------------------------------------------------------
echo.
echo Launching . . .
echo.
cd %srcdsdir%
start /wait /b srcds.exe %paramline% %settings% +gamemode hideandseek +map cs_office +host_workshop_collection 703905444 %authkey% %steamid%
cls
echo --------------------------------------------------------------------------------
echo Garrys Mod Hide And Seek Server running!
echo --------------------------------------------------------------------------------
echo.
echo Have fun!
echo.
/k pause
goto exit

:CopsAndRunners
cls
echo --------------------------------------------------------------------------------
echo Launching Cops And Runners
echo --------------------------------------------------------------------------------
echo.
echo Launching . . .
echo.
cd %srcdsdir%
start /wait /b srcds.exe %paramline% %settings% +gamemode copsandrunners +map cs_office +host_workshop_collection 703905444 %authkey% %steamid%
cls
echo --------------------------------------------------------------------------------
echo Garrys Mod Cops And Runners Server running!
echo --------------------------------------------------------------------------------
echo.
echo Have fun!
echo.
/k pause
goto exit

:MelonBomber
cls
echo --------------------------------------------------------------------------------
echo Launching Melon Bomber
echo --------------------------------------------------------------------------------
echo.
echo Launching . . .
echo.
cd %srcdsdir%
start /wait /b srcds.exe %paramline% %settings% +gamemode melonbomber +map mb_melonbomber +host_workshop_collection 703905444 %authkey% %steamid%
cls
echo --------------------------------------------------------------------------------
echo Garrys Mod Melon Bomber Server running!
echo --------------------------------------------------------------------------------
echo.
echo Have fun!
echo.
/k pause
goto exit

:Murder
cls
echo --------------------------------------------------------------------------------
echo Launching Murder
echo --------------------------------------------------------------------------------
echo.
echo Launching . . .
echo.
cd %srcdsdir%
start /wait /b srcds.exe %paramline% %settings% +gamemode murder +map cs_office +host_workshop_collection 703905444 %authkey% %steamid%
cls
echo --------------------------------------------------------------------------------
echo Garrys Mod Murder Server running!
echo --------------------------------------------------------------------------------
echo.
echo Have fun!
echo.
/k pause
goto exit

:TrashCompactor
cls
echo --------------------------------------------------------------------------------
echo Launching Trash Compactor
echo --------------------------------------------------------------------------------
echo.
echo Launching . . .
echo.
cd %srcdsdir%
start /wait /b srcds.exe %paramline% %settings% +gamemode trashcompactor +map tc_canal +host_workshop_collection 703905444 %authkey% %steamid%
echo.
cls
echo --------------------------------------------------------------------------------
echo Garrys Mod Trash Compactor Server running!
echo --------------------------------------------------------------------------------
echo.
echo Have fun!
echo.
/k pause
goto exit

:TTT
cls
echo --------------------------------------------------------------------------------
echo Launching TTT
echo --------------------------------------------------------------------------------
echo.
echo Launching . . .
echo.
cd %srcdsdir%
start /wait /b srcds.exe %paramline% %settings% +gamemode terrortown +map ttt_district_a4 %authkey% %steamid%
echo.
cls
echo --------------------------------------------------------------------------------
echo Garrys Mod TTT Server running!
echo --------------------------------------------------------------------------------
echo.
echo Have fun!
echo.
/k pause
goto exit

:GuessWho
cls
echo --------------------------------------------------------------------------------
echo Launching Guess Who
echo --------------------------------------------------------------------------------
echo.
echo Launching . . .
echo.
cd %srcdsdir%
start /wait /b srcds.exe %paramline% %settings% +gamemode guesswho +map cs_office +host_workshop_collection 703905444 %authkey% %steamid%
cls
echo --------------------------------------------------------------------------------
echo Garrys Mod Guess Who Server running!
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