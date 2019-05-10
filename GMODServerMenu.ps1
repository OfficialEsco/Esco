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
#$Select_Gamemode = "Sandbox"
#    if ( $Select_Gamemode -eq "Sandbox" )           { $Gamemode = '+gamemode sandbox +map gm_flatgrass' }
#    if ( $Select_Gamemode -eq "Prophunt" )          { $Gamemode = '+gamemode prop_hunt +map cs_office' }
#    if ( $Select_Gamemode -eq "TheHidden" )         { $Gamemode = '+gamemode thehidden +map hdn_kindergarten' }
#    if ( $Select_Gamemode -eq "TheStalker" )        { $Gamemode = '+gamemode stalker +map ts_annex' }
#    if ( $Select_Gamemode -eq "HideAndSeek" )       { $Gamemode = '+gamemode hideandseek +map cs_office' }
#    if ( $Select_Gamemode -eq "CopsAndRunners" )    { $Gamemode = '+gamemode copsandrunners +map cs_office' }
#    if ( $Select_Gamemode -eq "MelonBomber" )       { $Gamemode = '+gamemode melonbomber +map mb_melonbomber' }
#    if ( $Select_Gamemode -eq "Murder" )            { $Gamemode = '+gamemode murder +map cs_office' }
#    if ( $Select_Gamemode -eq "TrashCompactor" )    { $Gamemode = '+gamemode trashcompactor +map tc_canal' }
#    if ( $Select_Gamemode -eq "TTT" )               { $Gamemode = '+gamemode terrortown +map ttt_district_a4' }
#    if ( $Select_Gamemode -eq "GuessWho" )          { $Gamemode = '+gamemode guesswho +map cs_office' }


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
            modeMenu
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

function modeMenu {
    $modeMenu = 'X'
    while($modeMenu -ne ''){
        Clear-Host
        Write-Host "`n`t`t Server Menu`n"
        Write-Host -ForegroundColor Cyan "Game Mode Menu"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "1"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Sandbox"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "2"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Prophunt"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "3"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " The Hidden"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "4"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " The Stalker"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "5"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Hide And Seek"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "6"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Cops And Runners"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "7"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Melon Bomber"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "8"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Murder"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "9"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Trash Compactor"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "10"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Trouble in Terrorist Town"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "11"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Guess Who"
        $modeMenu = Read-Host "`nSelection (leave blank to quit)"
        # Start Sandbox
        if($modeMenu -eq 1){
            $Gamemode = '+gamemode sandbox +map gm_flatgrass'
            Start-Server
            
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Start Prop Hunt
        if($modeMenu -eq 2){
            $Gamemode = '+gamemode prop_hunt +map cs_office'
            Start-Server
            
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Start The Hidden
        if($modeMenu -eq 3){
            $Gamemode = '+gamemode thehidden +map hdn_kindergarten'
            Start-Server
            
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Start The Stalker
        if($modeMenu -eq 4){
            $Gamemode = '+gamemode stalker +map ts_annex'
            Start-Server
            
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Start Hide and Seek
        if($modeMenu -eq 5){
            $Gamemode = '+gamemode hideandseek +map cs_office'
            Start-Server
            
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Start Cops and Runners
        if($modeMenu -eq 6){
            $Gamemode = '+gamemode copsandrunners +map cs_office'
            Start-Server
            
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Start Mellon Bomber
        if($modeMenu -eq 7){
            $Gamemode = '+gamemode melonbomber +map mb_melonbomber'
            Start-Server
            
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Start Murder
        if($modeMenu -eq 8){
            $Gamemode = '+gamemode murder +map cs_office'
            Start-Server
            
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Start Trash Compactor
        if($modeMenu -eq 9){
            $Gamemode = '+gamemode trashcompactor +map tc_canal'
            Start-Server
            
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Start Trouble in Terrorist Town
        if($modeMenu -eq 10){
            $Gamemode = '+gamemode terrortown +map ttt_district_a4'
            Start-Server
            
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Start Guess Who
        if($modeMenu -eq 11){
            $Gamemode = '+gamemode guesswho +map cs_office'
            Start-Server
            
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
    }
}

function Start-Server {
    if (Test-Path $ServerLoc\srcds.exe) {
        $paramline = '-nographics -console -usercon -condebug -game garrysmod'
        $settings = "-port $Port $Gamemode -tickrate $Tickrate -maxplayers_override $MaxPlayers $Workshop_Collection"

        Clear-Host
        Write-Host '--------------------------------------------------------------------------------'
        Write-Host "Launching $GameFullname Server"
        Write-Host '--------------------------------------------------------------------------------'
        Write-Host 
        Write-Host 'Launching . . .'
        Write-Host 
        Start-Process "$ServerLoc\srcds.exe" -ArgumentList "$paramline $settings $authkey $steamid" -WorkingDirectory "$ServerLoc" -NoNewWindow
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

function Update-Server {
    if (Test-Path $CMDLoc\steamcmd.exe) {
        Clear-Host
        Write-Host '--------------------------------------------------------------------------------'
        Write-Host 'Searching for Server Update'
        Write-Host '--------------------------------------------------------------------------------'
        Write-Host 
        Start-Process "$CMDLoc\steamcmd.exe" -ArgumentList "+login $SteamUsername $SteamPassword +force_install_dir $ServerLoc +app_update $appid $cmdparam +quit" -Wait 
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
        $ServerConfig ="
        hostname           $ServerName
        sv_password        $ServerPassword
        rcon_password      $RconPassword

        logging          	'on'
        sv_region        	'3'
        sv_lan           	'0'

        sv_minrate       	'101000'
        sv_maxrate       	'101000'
        sv_minupdaterate 	'101'
        sv_maxupdaterate 	'101'
        sv_mincmdrate 		'100'
        sv_maxcmdrate 		'100'
        net_maxfilesize  	'100'

        mp_timelimit 		'0'
        sv_airaccelerate 	'100'
        sv_noclipspeed   	'5'
        sv_noclipaccelerate	'5'
        decalfrequency   	'10'
        sv_defaultgamemode 	'sandbox'

        sbox_allownpcs  	'1'
        sbox_godmode     	'0'
        sbox_plpldamage  	'0'
        sbox_playergod   	'0'
        sbox_noclip      	'1'
        sbox_maxprops    	'150'
        sbox_maxragdolls 	'5'
        sbox_maxnpcs     	'10'
        sbox_maxballoons 	'10'
        sbox_maxeffects  	'50'
        sbox_maxdynamite 	'10'
        sbox_maxlamps    	'20'
        sbox_maxthrusters	'30'
        sbox_maxwheels   	'20'
        sbox_maxhoverballs	'20'
        sbox_maxvehicles 	'6'
        sbox_maxbuttons  	'20'
        sbox_maxsents    	'20'
        sbox_maxemitters 	'5'
        sbox_maxspawners 	'3'
        sbox_maxturrets  	'2'

        sv_logbans       	'1'
        sv_logecho       	'1'
        sv_logfile       	'1'
        sv_log_onefile   	'0'
        "
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
        $StartupConfig ="
        Write-Host 'Updating Server'
        Start-Process $CMDLoc\steamcmd.exe -ArgumentList +login $SteamUsername $SteamPassword +force_install_dir $ServerLoc +app_update $appid $cmdparam +quit -Wait
        Write-Host 'Starting Server'
        Start-Process $ServerLoc\srcds.exe -ArgumentList $paramline $settings $authkey $steamid -NoNewWindow
        "
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