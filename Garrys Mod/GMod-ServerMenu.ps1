$GameShortname = 'GMod'
$GameFullname = 'Garrys Mod'
$host.UI.RawUI.WindowTitle = "$GameFullname Server Menu"
# ================ SteamCMD Settings ================
# Steam Username and Password (Or anonymous)
$SteamUsername = 'anonymous'
$SteamPassword = ''
# SteamCMD Location
$CMDLoc = 'D:\Servers\steamcmd'
# Server Location
$ServerLoc = "D:\Servers\$GameShortname"
# Game Config Folder Location
$ConfigLoc = "$ServerLoc\garrysmod\cfg"
# Server AppID https://developer.valvesoftware.com/wiki/Dedicated_Servers_List
$appid = '4020'
# Verify server files? (0 = no, 1 = yes)
$checkvalid = '0'
    if ( $checkvalid -eq '1' ) { $cmdparam = 'validate' }

# ================ Steam Settings ================
# Authkey http://steamcommunity.com/dev/apikey
$authkey = '-authkey '
# Steam ID http://steamcommunity.com/dev/managegameservers
$steamid = '+sv_setsteamaccount '

# ================ Server Settings ================
$ServerName = "Escos $GameFullname Server"
$ServerPassword = 'qwerty'
$RconPassword = 'qwerty'
$MaxPlayers = '12'
$Port = '27016'
$Tickrate = '100'
$Workshop_Collection = '+host_workshop_collection 703905444'
$Gamemode = '' # Sandbox, Prop_hunt, TheHidden, TheStalker, HideAndSeek, CopsAndRunners, MelonBomber, Murder, TrashComactor, terrortown, GuessWho
$Map = '' # cs_office

# Server Start Up Settings
if ( $Map -ne '' ) { $ForceMap = "+map $Map" } else { $ForceMap = '' }
if ( $Gamemode -ne '' ) { $ForceGamemode = "+gamemode $Gamemode" } else { $ForceGamemode = '' }
$Settings = @(
    "-port $Port"
    $Gamemode
    $ForceGameMode
    $ForceMap
    "-tickrate $Tickrate"
    "-maxplayers_override $MaxPlayers"
    "$Workshop_Collection"
)

# Parmaline Settings
$paramline = @(
    "-nographics"
    "-console"
    "-condebug"
    "-usercon"
    "-game garrysmod"
)

function mainMenu {
    $mainMenu = 'X'
    while($mainMenu -ne ''){
        Clear-Host
        Write-Host "`n`t`t Server Menu`n"
        Write-Host -ForegroundColor Cyan "Main Menu"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "1"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Select Gamemode"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "2"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Update"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "9"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Extra Settings"
        $mainMenu = Read-Host "`nSelection (leave blank to quit)"
        # Start Server
        if($mainMenu -eq 1){
            Start-Server

            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Update Server
        if($mainMenu -eq 2){
            Update-Server

            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Opens the submenu
        if($mainMenu -eq 9){
            subMenu1
        }
    }
}

function subMenu1 {
    $subMenu1 = 'X'
    while($subMenu1 -ne ''){
        Clear-Host
        Write-Host "`n`t`t Server Menu`n"
        Write-Host -ForegroundColor Cyan "Extra Settings Menu"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "1"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Create one click server starter"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "2"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Create Server.cfg"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "3"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Add to Task Scheduler (Requires Administrator)"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "4"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Remove from Task Scheduler (Requires Administrator)"
        $subMenu1 = Read-Host "`nSelection (leave blank to quit)"
        # Start Server
        if($subMenu1 -eq 1){
            New-EasyStart
            
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Creater Server Config
        if($subMenu1 -eq 2){
            New-ServerConfig
            
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Register Server Task
        if($subMenu1 -eq 3){
            Register-ServerTask
            
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Unregister Server Task
        if($subMenu1 -eq 4){
            Unregister-ServerTask
            
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
    }
}

function Start-Server {

    if ($Gamemode -eq '') {
        Clear-Host
        Write-Host -ForegroundColor Cyan "Select Gamemode"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "1"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Sandbox"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "2"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Prophunt"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "3"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " TheHidden"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "4"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " TheStalker"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "5"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " HideAndSeek"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "6"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " CopsAndRunners"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "7"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " MelonBomber"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "8"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Murder"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "9"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " TrashCompactor"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "10"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " TTT"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "11"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " GuessWho"
        $GameModeSelect = Read-Host "`nSelect a Gamemode (leave blank to go back)"
        # Sandbox
        if($GameModeSelect -eq 1){
            $Gamemode = '+gamemode sandbox +map gm_flatgrass'
        }
        # Prophunt
        if($GameModeSelect -eq 2){
            $Gamemode = '+gamemode prop_hunt +map cs_office'
        }
        # TheHidden
        if($GameModeSelect -eq 3){
            $Gamemode = '+gamemode thehidden +map hdn_kindergarten'
        }
        # TheStalker
        if($GameModeSelect -eq 4){
            $Gamemode = '+gamemode stalker +map ts_annex'
        }
        # HideAndSeek
        if($GameModeSelect -eq 5){
            $Gamemode = '+gamemode hideandseek +map cs_office'
        }
        # CopsAndRunners
        if($GameModeSelect -eq 6){
            $Gamemode = '+gamemode copsandrunners +map cs_office'
        }
        # MelonBomber
        if($GameModeSelect -eq 7){
            $Gamemode = '+gamemode melonbomber +map mb_melonbomber'
        }
        # Murder
        if($GameModeSelect -eq 8){
            $Gamemode = '+gamemode murder +map cs_office'
        }
        # TrashCompactor
        if($GameModeSelect -eq 9){
            $Gamemode = '+gamemode trashcompactor +map tc_canal'
        }
        # TTT
        if($GameModeSelect -eq 10){
            $Gamemode = '+gamemode terrortown +map ttt_district_a4'
        }
        # GuessWho
        if($GameModeSelect -eq 11){
            $Gamemode = '+gamemode guesswho +map cs_office'
        }
    }


    if ($Gamemode -ne '') {
        if (Test-Path $ServerLoc\srcds.exe) {
            Clear-Host
            Write-Host '--------------------------------------------------------------------------------'
            Write-Host "Launching $GameFullname Server"
            Write-Host '--------------------------------------------------------------------------------'
            Write-Host 
            Write-Host 'Launching . . .'
            Write-Host 
            Start-Process "$ServerLoc\srcds.exe" -ArgumentList "$paramline $settings $authkey $steamid" -NoNewWindow
            Clear-Host
            Write-Host '--------------------------------------------------------------------------------'
            Write-Host "$GameFullname Server running!"
            Write-Host '--------------------------------------------------------------------------------'
            Write-Host 
            Write-Host 'Have fun!'
            Write-Host 
         } else {
            Write-Host
            Write-Host "Server executable not found, install server files or check server location." -ForegroundColor Red
        }
    }
}

function Update-Server {
    if (Test-Path $CMDLoc\steamcmd.exe) {
        Clear-Host
        Write-Host '--------------------------------------------------------------------------------'
        Write-Host 'Searching for Server Update'
        Write-Host '--------------------------------------------------------------------------------'
        Write-Host 
        Start-Process -FilePath 'steamcmd.exe' -WorkingDirectory "$CMDLoc" -ArgumentList "+login $SteamUsername $SteamPassword +force_install_dir $ServerLoc +app_update $appid $cmdparam +quit" -Wait 
        Clear-Host
        Write-Host '--------------------------------------------------------------------------------'
        Write-Host 'Server successfully updated'
        Write-Host '--------------------------------------------------------------------------------'
        Write-Host 
        Write-Host 'Server successfully updated!'
        Write-Host 
     } else {
        Write-Host "SteamCMD not found, downloading SteamCMD"
        if (!(Test-Path C:\Temp)) {
            New-Item -ItemType Directory -Force -Path "C:\Temp"
        }
        Invoke-WebRequest -Uri 'https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip' -OutFile "C:\Temp\SteamCMD.zip"

        if (!(Test-Path $CMDLoc)) {
            New-Item -ItemType Directory -Force -Path "$CMDLoc"
        }
        Expand-Archive 'C:\Temp\SteamCMD.zip' -DestinationPath "$CMDLoc"
        Remove-Item -Path 'C:\Temp\SteamCMD.zip'
        Update-Server
    }
}

function New-ServerConfig {
    if (Test-Path $ConfigLoc) {
        $ServerConfig = @(
        "hostname               $ServerName",
        "sv_password            $ServerPassword",
        "rcon_password          $RconPassword",

        "logging          	    on",
        "sv_region        	    3",
        "sv_lan           	    0",

        "sv_minrate       	    101000",
        "sv_maxrate       	    101000'",
        "sv_minupdaterate 	    101",
        "sv_maxupdaterate 	    101",
        "sv_mincmdrate 		    100",
        "sv_maxcmdrate 		    100",
        "net_maxfilesize  	    100",

        "mp_timelimit 		    0",
        "sv_airaccelerate 	    100",
        "sv_noclipspeed   	    5",
        "sv_noclipaccelerate	5",
        "decalfrequency   	    10",
        "sv_defaultgamemode 	sandbox",

        "sbox_allownpcs  	    1",
        "sbox_godmode     	    0",
        "sbox_plpldamage  	    0",
        "sbox_playergod   	    0",
        "sbox_noclip      	    1",
        "sbox_maxprops    	    150",
        "sbox_maxragdolls 	    5",
        "sbox_maxnpcs     	    10",
        "sbox_maxballoons 	    10",
        "sbox_maxeffects  	    50",
        "sbox_maxdynamite 	    10",
        "sbox_maxlamps    	    20",
        "sbox_maxthrusters	    30",
        "sbox_maxwheels   	    20",
        "sbox_maxhoverballs	    20",
        "sbox_maxvehicles 	    6",
        "sbox_maxbuttons  	    20",
        "sbox_maxsents    	    20",
        "sbox_maxemitters 	    5",
        "sbox_maxspawners 	    3",
        "sbox_maxturrets  	    2",

        "sv_logbans       	    1",
        "sv_logecho       	    1",
        "sv_logfile       	    1",
        "sv_log_onefile   	    0"
        )
        Set-Content -Value $ServerConfig -Path "$ConfigLoc\server.cfg"
        Write-Host 
        Write-Host "$GameShortname Server.cfg created." -ForegroundColor Green
     } else {
        Write-Host 
        Write-Host 'Config folder not found.' -ForegroundColor Red
    }
}

function New-EasyStart {
    if (Test-Path $ServerLoc) {
        $StartupConfig = @(
        "Write-Host 'Updating Server'",
        "Start-Process $CMDLoc\steamcmd.exe -ArgumentList +login $SteamUsername $SteamPassword +force_install_dir $ServerLoc +app_update $appid $cmdparam +quit -Wait",
        "Write-Host 'Starting Server'",
        "Start-Process $ServerLoc\srcds.exe -ArgumentList $paramline $settings $authkey $steamid -NoNewWindow"
        )
        Set-Content -Value $StartupConfig -Path "$ServerLoc\Start.ps1"
        Write-Host 
        Write-Host 'Easy Server Start.ps1 created.' -ForegroundColor Green
     } else {
        Write-Host 
        Write-Host 'Server folder not found.' -ForegroundColor Red
    }
}

function Register-ServerTask {
    if ( Get-ScheduledTaskInfo -TaskName "$GameShortname Server" -erroraction 'silentlycontinue') {
        Write-Host 
        Write-Host 'Task already exists.' -ForegroundColor Red
     } else {
        $action = New-ScheduledTaskAction -Execute 'Powershell.exe' -Argument "-ExecutionPolicy Bypass $ServerLoc\Start.ps1"
        $trigger =  New-ScheduledTaskTrigger -AtLogon

        Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "$GameShortname Server" -Description "$GameFullname Server"
        Write-Host 
        Write-Host "$GameShortname Server added to Task Scheduler" -ForegroundColor Green
    }
}

function Unregister-ServerTask {
    if ( Get-ScheduledTaskInfo -TaskName "$GameShortname Server" -erroraction 'silentlycontinue') {
        Unregister-ScheduledTask -TaskName "$GameShortname Server"
        Write-Host 
        Write-Host "$GameShortname Server removed from Task Scheduler" -ForegroundColor Green
     } else {
        Write-Host
        Write-Host 'Task not found.' -ForegroundColor Red
    }
}

mainMenu