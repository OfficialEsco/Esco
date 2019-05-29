$GameShortname = 'MC'
$GameFullname = 'Minecraft'
$host.UI.RawUI.WindowTitle = "$GameFullname Server Menu"

# ================ Server Settings ================
$ServerName = "Escos Modded Server"
$ServerPassword = 'qwerty'
$RconPassword = 'qwerty'
$MaxPlayers = '1337'
$ServerIP = ''
$Port = '25565'
$WorldName = 'world'
$JarName = 'server.jar'

$Difficulty = 'Hard' # Normal, Medium, Hard
$Whitelist = 'False' # True or False

# Server Location
$ServerLoc = "D:\Servers\$GameFullname\$ServerName"
$BackupLoc = "$ServerLoc\Backup"

# Parmlines
$paramline = '-Xmx10G -Xms10G'
$parmaline2 = "-XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:+CMSIncrementalMode -XX:+CMSIncrementalPacing -XX:+CMSParallelRemarkEnabled -XX:MaxGCPauseMillis=50 -XX:+DisableExplicitGC -XX:+AggressiveOpts -XX:+UseFastAccessorMethods -XX:+UseBiasedLocking -XX:TargetSurvivorRatio=90"

function mainMenu {
    $mainMenu = 'X'
    while($mainMenu -ne ''){
        Clear-Host
        Write-Host "`n`t`t Server Menu`n"
        Write-Host -ForegroundColor Cyan "Main Menu"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "1"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Start"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "8"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Backup World"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "9"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Extra Settings"
        $mainMenu = Read-Host "`nSelection (leave blank to quit)"
        # Start Server
        if($mainMenu -eq 1){
            Start-Server

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
            Write-Host -ForegroundColor DarkCyan " Create server.properties"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "3"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Add to Task Scheduler (Requires Administrator)"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "4"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Remove from Task Scheduler (Requires Administrator)"
        $subMenu1 = Read-Host "`nSelection (leave blank to quit)"
        # Create one click server starter
        if($subMenu1 -eq 1){
            New-EasyStart
            
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Create Server Config
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
    if (Test-Path $ServerLoc\$JarName) {
        Clear-Host
        Write-Host '--------------------------------------------------------------------------------'
        Write-Host "Launching $GameFullname Server"
        Write-Host '--------------------------------------------------------------------------------'
        Write-Host 
        Write-Host 'Launching . . .'
        Write-Host 
        Start-Process -Filepath java -ArgumentList "-Xmx10G -Xms10G -jar $JarName nogui" -WorkingDirectory "$ServerLoc"  -Wait -NoNewWindow
     } else {
        Write-Host
        Write-Host "Minecraft Jar not found, Downloading Jar" -ForegroundColor Red

        if (!(Test-Path $ServerLoc)) {
            New-Item -ItemType Directory -Force -Path $ServerLoc
        }

        Invoke-WebRequest -Uri 'https://launcher.mojang.com/v1/objects/f1a0073671057f01aa843443fef34330281333ce/server.jar' -OutFile "$ServerLoc\$JarName"
        Update-EULA
        Start-Server
    }
}

function New-ServerConfig {
    if (Test-Path $ServerLoc\server.properties) {
        $ServerConfig = @( 
        "spawn-protection=16",
        "max-tick-time=60000",
        "query.port=$Port",
        "generator-settings=",
        "force-gamemode=false",
        "allow-nether=true",
        "enforce-whitelist=$Whitelist",
        "gamemode=survival",
        "broadcast-console-to-ops=true",
        "enable-query=false",
        "player-idle-timeout=0",
        "difficulty=$Difficulty",
        "broadcast-rcon-to-ops=true",
        "spawn-monsters=true",
        "op-permission-level=4",
        "pvp=true",
        "snooper-enabled=true",
        "level-type=default",
        "hardcore=false",
        "enable-command-block=true",
        "network-compression-threshold=256",
        "max-players=$MaxPlayers",
        "max-world-size=29999984",
        "resource-pack-sha1=",
        "rcon.port=25575",
        "server-port=$Port",
        "server-ip=$ServerIP",
        "spawn-npcs=true",
        "allow-flight=false",
        "level-name=$WorldName",
        "view-distance=10",
        "resource-pack=",
        "spawn-animals=true",
        "white-list=false",
        "rcon.password=$RconPassword",
        "generate-structures=true",
        "online-mode=true",
        "max-build-height=256",
        "level-seed=",
        "prevent-proxy-connections=false",
        "use-native-transport=true",
        "motd=$ServerName",
        "enable-rcon=false" 
        )
        Set-Content -Value $ServerConfig -Path "$ServerLoc\server.properties"
        Write-Host 
        Write-Host 'Server Properties created.' -ForegroundColor Green
     } else {
        Write-Host 
        Write-Host 'Config folder not found.' -ForegroundColor Red
    }
}

function Update-EULA {
    $GetTime = Get-Date
    $EulaAccept = @( 
        "#By changing the setting below to TRUE you are indicating your agreement to our EULA (https://account.mojang.com/documents/minecraft_eula).",
        "#$GetTime",
        "eula=true"
    )

    if (Test-Path $ServerLoc) {
        Set-Content -Value $EulaAccept -Path "$ServerLoc\eula.txt"
        Write-Host 'EULA Accepted' -ForegroundColor Green
     } else {
        Write-Host 
        Write-Host 'Server folder not found.' -ForegroundColor Red
    }
}

function New-EasyStart {
    if (Test-Path $ServerLoc) {
        $StartupConfig = @(
        "java -Xmx10G -Xms10G -jar $JarName nogui",
        "Pause" )
        
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
    Compress-Archive -Path "$ServerLoc\$WorldName\*" -DestinationPath "$BackupLoc\$GetDate-$WorldName.zip" -Force -CompressionLevel "Fastest"
    Write-Host "Backup of $WorldName Created" -ForegroundColor Green
}

mainMenu