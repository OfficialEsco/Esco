$GameShortname = 'KF2'
$GameFullname = 'Killing Floor 2'
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
$ConfigLoc = "$ServerLoc\KF2\cfg"
# Server AppID https://developer.valvesoftware.com/wiki/Dedicated_Servers_List
$appid = '232130'
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
$Map = 'bioticslab'


# Etc
$paramline = '-nographics'
$settings = "kf-$Map?adminpassword=$RconPassword"

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
    if (Test-Path $ServerLoc\Binaries\Win64\KFserver.exe) {
        Clear-Host
        Write-Host '--------------------------------------------------------------------------------'
        Write-Host "Launching $GameFullname Server"
        Write-Host '--------------------------------------------------------------------------------'
        Write-Host 
        Write-Host 'Launching . . .'
        Write-Host 
        Start-Process "$ServerLoc\Binaries\Win64\KFserver.exe" -ArgumentList "$paramline $settings $authkey $steamid" -NoNewWindow
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

function New-EasyStart {
    if (Test-Path $ServerLoc) {
        $StartupConfig = @(
        "Write-Host 'Updating Server'",
        "Start-Process $CMDLoc\steamcmd.exe -ArgumentList +login $SteamUsername $SteamPassword +force_install_dir $ServerLoc +app_update $appid $cmdparam +quit -Wait",
        "Write-Host 'Starting Server'",
        "Start-Process $ServerLoc\Binaries\Win64\KFserver.exe -ArgumentList $paramline $settings $authkey $steamid -NoNewWindow"
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