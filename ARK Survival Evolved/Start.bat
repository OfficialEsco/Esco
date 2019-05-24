@echo off
title ARK: Survival Evolved Server Launcher

:: SteamCMD Settings ::
:: Steam Username (Or anonymous)
set username=anonymous
set password=
:: SteamCMD Location
set runcmd=D:\Servers\steamcmd
:: Server Location
set srcdsdir=D:\Servers\ARK
:: Server AppID https://developer.valvesoftware.com/wiki/Dedicated_Servers_List
set appid=376030
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
set sessionname=Esco's ARK Server
set serverpw=qwerty
set maxplayers=100
set port=7777
:: Map Name (TheIsland / TheCenter)
set mapname=TheCenter
:: Query Port
set queryport=27015
set rconpw=qwerty
:: Mods Local Location
set mods=D:\Program Files\Steam\SteamApps\common\ARK\ShooterGame\Content\Mods
:: Force Respawn Dinos (Might crash the server)
set forcerespawndinos=0

if %forcerespawndinos%==0 (
set respawndinos=
) else (
set respawndinos=-ForceRespawnDinos
)

:menu
cls
echo --------------------------------------------------------------------------------
echo ARK: Survival Evolved Server Launcher
echo --------------------------------------------------------------------------------
echo.
echo [1] Start
echo [2] Backup the Server
echo [3] Copy Mods to Server
echo [4] Update the Server
echo [Exit] Exit
echo.
set /p op=Run:
if %op%==1 goto start
if %op%==2 goto backup
if %op%==3 goto mods
if %op%==4 goto update
if %op%==exit goto exit
goto error

:start
cls
echo --------------------------------------------------------------------------------
echo Backing up files
echo --------------------------------------------------------------------------------
echo.
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
set "fullstamp=%DD%-%MM%-%YYYY%_%HH%-%Min%"
if not exist "Backup\TheCenter" mkdir Backup\TheCenter
if not exist "Backup\TheIsland" mkdir Backup\TheIsland
copy "ShooterGame\Saved\SavedArks\%mapname%.ark" "Backup\%mapname%\%mapname%_%fullstamp%.ark"
cls
echo --------------------------------------------------------------------------------
echo Backup successfully created
echo --------------------------------------------------------------------------------
echo.
echo Backup created %fullstamp%
cls
echo --------------------------------------------------------------------------------
echo Copying Mods
echo --------------------------------------------------------------------------------
echo.
if not exist "ShooterGame\Content\Mods" mkdir ShooterGame\Content\Mods
xcopy /Y /E /D "%mods%" "ShooterGame\Content\Mods"
cls
echo --------------------------------------------------------------------------------
echo Mods successfully copyed
echo --------------------------------------------------------------------------------
echo.
echo Mods successfully copyed
cls
echo --------------------------------------------------------------------------------
echo Searching for Server Update
echo --------------------------------------------------------------------------------
echo.
echo Please wait . . .
cd %runcmd%
start /wait steamcmd +login %username% %password% +force_install_dir %srcdsdir% +app_update %appid% %cmdparam% +quit
cls
echo --------------------------------------------------------------------------------
echo Server successfully updated
echo --------------------------------------------------------------------------------
echo.
echo Server updated
echo.
cls
echo --------------------------------------------------------------------------------
echo Launching ARK: Survival Evolved Server
echo --------------------------------------------------------------------------------
echo.
echo Launching . . .
cd %srcdsdir%\ShooterGame\Binaries\Win64
start ShooterGameServer "%mapname%?SessionName=%sessionname%?MaxPlayers=%maxplayers%?Port=%port%?QueryPort=%queryport%?ServerPassword=%serverpw%?ServerAdminPassword=%rconpw%?AllowAnyoneBabyImprintCuddle=true?listen" %respawndinos% -UseBattlEye %authkey% %steamid%
cls
echo --------------------------------------------------------------------------------
echo ARK: Survival Evolved Server running!
echo --------------------------------------------------------------------------------
echo.
echo Server successfully started!
echo.
pause
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

:backup
cls
echo --------------------------------------------------------------------------------
echo Backing up files
echo --------------------------------------------------------------------------------
echo.
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
set "fullstamp=%DD%-%MM%-%YYYY%_%HH%-%Min%"
if not exist "Backup\TheCenter" mkdir Backup\TheCenter
if not exist "Backup\TheIsland" mkdir Backup\TheIsland
copy "ShooterGame\Saved\SavedArks\%mapname%.ark" "Backup\%mapname%\%mapname%_%fullstamp%.ark"
cls
echo --------------------------------------------------------------------------------
echo Backup successfully created
echo --------------------------------------------------------------------------------
echo.
echo Backup created %fullstamp%
echo.
pause
goto menu

:mods
cls
echo --------------------------------------------------------------------------------
echo Copying Mods
echo --------------------------------------------------------------------------------
echo.
if not exist "ShooterGame\Content\Mods" mkdir ShooterGame\Content\Mods
xcopy /Y /E /D "%mods%" "ShooterGame\Content\Mods"
cls
echo --------------------------------------------------------------------------------
echo Mods successfully copyed
echo --------------------------------------------------------------------------------
echo.
echo Mods successfully copyed
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