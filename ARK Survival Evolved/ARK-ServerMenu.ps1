$GameShortname = 'ARK'
$GameFullname = 'ARK: Survival Evolved'
$host.UI.RawUI.WindowTitle = "$GameFullname Server Menu"
# ================ SteamCMD Settings ================
# Steam Username and Password (Or anonymous)
$SteamUsername = 'anonymous'
$SteamPassword = ''
# SteamCMD Location
$CMDLoc = 'D:\Servers\steamcmd'
# Server Location
$ServerLoc = "D:\Servers\$GameShortname"
# Server Location
$BackupLoc = "$ServerLoc\Backup"
# Game Config Folder Location
$ConfigLoc = "$ServerLoc\ShooterGame\Saved\Config\WindowsServer"
# Mods Folder
$ModsLoc = 'D:\Program Files\Steam\SteamApps\common\ARK\ShooterGame\Content\Mods'
# Server AppID https://developer.valvesoftware.com/wiki/Dedicated_Servers_List
$appid = '376030'
# Verify server files? (0 = no, 1 = yes)
$checkvalid = '0'
    if ( $checkvalid -eq '1' ) { $cmdparam = 'validate' }

# ================ Steam Settings ================
# Authkey http://steamcommunity.com/dev/apikey
$authkey = '-authkey '
# Steam ID http://steamcommunity.com/dev/managegameservers
$steamid = '+sv_setsteamaccount '

# ================ Server Settings ================
$ServerName = "Escos $GameShortname Server"
$ServerPassword = 'qwerty'
$RconPassword = 'qwerty'
$MaxPlayers = '100'
$Port = '7777'
$Queryport = '27015'
$Map = 'TheCenter' #(TheIsland / TheCenter / ScorchedEarth_P / Ragnarok / Aberration_P / Extinction / Valguero_P)
$ForceRespawnDinos = '0'
    if ( $ForceRespawnDinos -eq '1' ) { $RespawnDinos = '-ForceRespawnDinos' }

function mainMenu {
    $mainMenu = 'X'
    while($mainMenu -ne ''){
        Clear-Host
        Write-Host "`n`t`t Server Menu`n"
        Write-Host -ForegroundColor Cyan "Main Menu"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "1"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Start"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "2"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Update"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "8"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Backup Map"
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
        # Create a Backup
        if($mainMenu -eq 8){
            New-ServerBackup

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
            Write-Host -ForegroundColor DarkCyan " Copy Mods from Local to Server Folder"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "4"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Add to Task Scheduler (Requires Administrator)"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "5"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
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
        # Copy mods from Local to Server
        if($subMenu1 -eq 2){
            Copy-ModsFolder
            
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Register Server Task
        if($subMenu1 -eq 4){
            Register-ServerTask
            
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Unregister Server Task
        if($subMenu1 -eq 5){
            Unregister-ServerTask
            
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
    }
}

function Start-Server {
    if (Test-Path $ServerLoc\ShooterGame\Binaries\Win64\ShooterGameServer.exe) {
        $paramline = "-nographics -console -usercon -condebug -UseBattlEye $RespawnDinos"
        $settings = "$Map?SessionName=$ServerName?MaxPlayers=$MaxPlayers?Port=$Port?QueryPort=$Queryport?ServerPassword=$ServerPassword?ServerAdminPassword=$RconPassword?AllowAnyoneBabyImprintCuddle=true?listen" 

        Clear-Host
        Write-Host '--------------------------------------------------------------------------------'
        Write-Host "Launching $GameFullname Server"
        Write-Host '--------------------------------------------------------------------------------'
        Write-Host 
        Write-Host 'Launching . . .'
        Write-Host 
        Start-Process "$ServerLoc\ShooterGame\Binaries\Win64\ShooterGameServer.exe" -ArgumentList "$paramline $settings $authkey $steamid" -NoNewWindow
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

function Copy-ModsFolder {
    if (Test-Path $ModsLoc) {
        Copy-Item -Path "$ModsLoc" -Destination "$ServerLoc\ShooterGame\Content" -recurse -Force
        Write-Host 
        Write-Host 'Local Mods copied to Server folder.' -ForegroundColor Green
     } else {
        Write-Host 
        Write-Host 'Mods folder not found.' -ForegroundColor Red
    }
}

function New-ServerConfig {
    if (Test-Path $ConfigLoc) {
        $ServerConfig = @(
        "SessionName=$ServerName",
        "ServerPassword=$ServerPassword",
        "ServerAdminPassword=$RconPassword",
        "MaxPlayers=$MaxPlayers" 
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
        "Start-Process $ServerLoc\ShooterGame\Binaries\Win64\ShooterGameServer.exe -ArgumentList $paramline $settings $authkey $steamid -NoNewWindow"
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

function New-ServerBackup {
    if (!(Test-Path $BackupLoc)) { New-Item -ItemType Directory -Force -Path $BackupLoc }
    $GetDate = "$(Get-Date -UFormat "%d%m%y-%H%M")"
    Compress-Archive -Path "$ServerLoc\ShooterGame\Saved\SavedArks\$Map.ark" -DestinationPath "$BackupLoc\$GetDate-$Map.zip" -Force -CompressionLevel "Fastest"
    Write-Host "Backup of $Map Created" -ForegroundColor Green
}

mainMenu