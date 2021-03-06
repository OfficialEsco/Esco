$GameShortname = 'ARK'
$GameFullname = 'ARK: Survival Evolved'
$host.UI.RawUI.WindowTitle = "$GameFullname Server Menu"

# ================ SteamCMD Settings ================
# Steam Username and Password (Or anonymous)
$SteamUsername = 'anonymous'
$SteamPassword = ''
# SteamCMD Location
$CMDLoc = 'D:\Servers\steamcmd'
# Server AppID https://developer.valvesoftware.com/wiki/Dedicated_Servers_List
$appid = '376030'
# Server Location
$ServerLoc = "D:\Servers\$GameShortname"

$checkvalid = '0' # Verify server files? (0 = no, 1 = yes)
    if ( $checkvalid -eq '1' ) { $cmdparam = 'validate' }

# ================ Steam Settings ================
# Authkey http://steamcommunity.com/dev/apikey 
$authkey = '-authkey ' #Required
# Steam ID http://steamcommunity.com/dev/managegameservers
$steamid = '+sv_setsteamaccount ' #Required

# ================ Other Settings ================
# Server Location
$BackupLoc = "$ServerLoc\Backup"
# Game Config Folder Location
$ConfigLoc = "$ServerLoc\ShooterGame\Saved\Config\WindowsServer"
# Local Mods Folder Location
$ModsLoc = 'D:\Program Files\Steam\SteamApps\common\ARK\ShooterGame\Content\Mods'

# ================ Global Settings ================
$Map = '' #(TheIsland / TheCenter / ScorchedEarth_P / Ragnarok / Aberration_P / Extinction / Valguero_P)
$SessionName = "Escos $GameShortname Server"
$ServerPassword = 'qwerty'
$RconPassword = 'qwerty'
$MaxPlayers = '100'
$Port = '7777'
$Queryport = '27015'
$Banlist = 'http://arkdedicated.com/banlist.txt'
$AutoSavePeriodMinutes = '10'
$ServerAutoForceRespawnWildDinosInterval = '86400' # Default 86400 = 1 day
$MessageOfTheDay = 'Ayyylmao'

# ================ Server Settings ================
$ActiveMods = '' # Active Mods xxx,xxx,xxx
$DifficultyOffset = '1.00000'
$OverrideOfficialDifficulty = '10.0'

# Player Settings
$allowThirdPersonPlayer = '1'
$ServerCrosshair = '1'
$ShowMapPlayerLocation = '1'

# Farming
$XPMultiplier = '10.00000'
$HarvestAmountMultiplier = '2.00000'
$TamingSpeedMultiplier = '3.00000'
$ResourcesRespawnPeriodMultiplier = '3.00000'
$ItemStackSizeMultiplier = '5.00000'

# Decay
$DisableStructureDecayPvE = '1'
$PvPStructureDecay = '0'

# Download from other servers
$noTributeDownloads = '0'
$PreventDownloadSurvivors = '0'
$PreventDownloadItems = '0'
$PreventDownloadDinos = '0'

#Force Respawn Dinos on Server Startup
$ForceRespawnDinos = '0'

# Server Start Up Settings
if ( $ForceRespawnDinos -eq '1' ) { $RespawnDinos = '-ForceRespawnDinos' } else { $RespawnDinos = '' }
$StartupSettings = @(
    "?listen"
    "?SessionName=$SessionName"
    "?MaxPlayers=$MaxPlayers"
    "?Port=$Port"
    "?QueryPort=$Queryport"
    "?ServerPassword=$ServerPassword"
    "?ServerAdminPassword=$RconPassword"
    "-ForceAllowCaveFlyers"
    "$RespawnDinos"
)

# Parmaline Settings
$paramline = @(
    "-nographics"
    "-console"
    "-condebug"
    "-UseBattlEye"
    "-Server"
    "-automanagedmods"
)

# GameUserSettings.ini
$ServerConfig = @(
    "[ServerSettings]",
    "ActiveMods=$ActiveMods"
    "allowThirdPersonPlayer=$allowThirdPersonPlayer",
    "AllowCaveBuildingPvE=1",
    "alwaysNotifyPlayerJoined=0",
    "alwaysNotifyPlayerLeft=0",
    "bAllowFlyerCarryPvE=1",
    "bDisableStructureDecayPvE=$DisableStructureDecayPvE",
    "DayCycleSpeedScale=1.00000",
    "DayTimeSpeedScale=1.00000",
    "NightTimeSpeedScale=1.00000",
    "DinoCharacterFoodDrainMultiplier=3.00000",
    "DinoCharacterHealthRecoveryMultiplier=1.00000",
    "DinoCharacterStaminaDrainMultiplier=1.00000",
    "DinoCountMultiplier=1.00000",
    "DinoDamageMultiplier=1.00000",
    "DinoResistanceMultiplier=1.00000",
    "globalVoiceChat=0",
    "HarvestAmountMultiplier=$HarvestAmountMultiplier",
    "HarvestHealthMultiplier=1.00000",
    "MaxStructuresInRange=6700",
    "noTributeDownloads=$noTributeDownloads",
    "PreventDownloadSurvivors=$PreventDownloadSurvivors",
    "PreventDownloadItems=$PreventDownloadItems",
    "PreventDownloadDinos=$PreventDownloadDinos",
    "PlayerCharacterFoodDrainMultiplier=1.00000",
    "PlayerCharacterHealthRecoveryMultiplier=1.00000",
    "PlayerCharacterStaminaDrainMultiplier=1.00000",
    "PlayerCharacterWaterDrainMultiplier=1.00000",
    "PlayerDamageMultiplier=1.00000",
    "PlayerResistanceMultiplier=1.00000",
    "proximityChat=0",
    "ResourceNoReplenishRadiusPlayers=1.00000",
    "ResourceNoReplenishRadiusStructures=1.00000",
    "ResourcesRespawnPeriodMultiplier=$ResourcesRespawnPeriodMultiplier",
    "ServerAdminPassword=$RconPassword",
    "ServerCrosshair=$ServerCrosshair",
    "serverForceNoHud=0",
    "serverHardcore=0",
    "ServerPassword=$ServerPassword",
    "serverPVE=0",
    "ShowMapPlayerLocation=$ShowMapPlayerLocation",
    "StructureDamageMultiplier=1.00000",
    "StructureResistanceMultiplier=1.00000",
    "TamedDinoDamageMultiplier=1.00000",
    "TamedDinoResistanceMultiplier=1.00000",
    "TamingSpeedMultiplier=$TamingSpeedMultiplier",
    "XPMultiplier=$XPMultiplier",
    "EnablePVPGamma=0",
    "EnablePVEGamma=0",
    "SpectatorPassword=",
    "DifficultyOffset=$DifficultyOffset",
    "PvEStructureDecayPeriodMultiplier=1.00000",
    "PvEStructureDecayDestructionPeriod=1.00000",
    "Banlist=$Banlist",
    "PvPStructureDecay=$PvPStructureDecay",
    "DisableDinoDecayPvE=0",
    "PvEDinoDecayPeriodMultiplier=1.00000",
    "AdminLogging=0",
    "MaxTamedDinos=8000",
    "MaxNumbersofPlayersInTribe=2",
    "BattleNumOfTribestoStartGame=2",
    "TimeToCollapseROD=100",
    "BattleAutoStartGameInterval=100",
    "BattleSuddenDeathInterval=300",
    "KickIdlePlayersPeriod=1800",
    "PerPlatformMaxStructuresMultiplier=1.00000",
    "StructureDamageRepairCooldown=180",
    "bForceAllStructureLocking=1",
    "AutoDestroyOldStructuresMultiplier=0.00000",
    "bUseVSync=0",
    "MaxPlatformSaddleStructureLimit=100",
    "bPassiveDefensesDamageRiderlessDinos=1",
    "RCONPort=27020",
    "AutoSavePeriodMinutes=$AutoSavePeriodMinutes",
    "RCONServerGameLogBuffer=600",
    "OverrideStructurePlatformPrevention=0",
    "PreventOfflinePvPInterval=60.0",
    "bPvPDinoDecay=1",
    "bPvPStructureDecay=1",
    "DisableImprintDinoBuff=1",
    "AllowAnyoneBabyImprintCuddle=1",
    "EnableExtraStructurePreventionVolumes=1",
    "ShowFloatingDamageText=1",
    "DestroyUnconnectedWaterPipes=0",
    "OverrideOfficialDifficulty=$OverrideOfficialDifficulty",
    "TheMaxStructuresInRange=10500",
    "MinimumDinoReuploadInterval=0",
    "PvEAllowStructuresAtSupplyDrops=0",
    "NPCNetworkStasisRangeScalePlayerCountStart=70",
    "NPCNetworkStasisRangeScalePlayerCountEnd=120",
    "NPCNetworkStasisRangeScalePercentEnd=0.50",
    "MaxPersonalTamedDinos=500",
    "AutoDestroyDecayedDinos=1",
    "ClampItemSpoilingTimes=0",
    "UseOptimizedHarvestingHealth=1",
    "AllowCrateSpawnsOnTopOfStructures=1",
    "ForceFlyerExplosives=0",
    "PreventOfflinePvP=1",
    "AllowFlyingStaminaRecovery=1",
    "AllowMultipleAttachedC4=1",
    "OxygenSwimSpeedStatMultiplier=1.00",
    "bPvEDisableFriendlyFire=1",
    "ServerAutoForceRespawnWildDinosInterval=$ServerAutoForceRespawnWildDinosInterval",
    "DisableWeatherFog=0",
    "RandomSupplyCratePoints=0",
    "CrossARKAllowForeignDinoDownloads=0",
    "PersonalTamedDinosSaddleStructureCost=19",
    "ItemStackSizeMultiplier=$ItemStackSizeMultiplier"
    "",
    "[/script/engine.gamesession]",
    "MaxPlayers=$MaxPlayers",
    "",
    "[SessionSettings]",
    "SessionName=$SessionName",
    "",
    "[MessageOfTheDay]",
    "Duration=30",
    "Message=$MessageOfTheDay"            
)

# Game.ini
$GameConfig = @(
    "[/script/shootergame.shootergamemode]",
    "MaxTribeLogs=100",
    "bDisableFriendlyFire=False",
    "bPvEDisableFriendlyFire=False",
    "bDisableLootCrates=False",
    "MaxNumberOfPlayersInTribe=70",
    "bIncreasePvPRespawnInterval=False",
    "bAutoPvETimer=False",
    "bPvEAllowTribeWar=True",
    "bPvEAllowTribeWarCancel=False",
    "bAllowCustomRecipes=True",
    "CustomRecipeEffectivenessMultiplier=1.000000",
    "CustomRecipeSkillMultiplier=1.000000",
    "bUseCorpseLocator=True",
    "bAllowUnlimitedRespecs=False",
    "bAllowPlatformSaddleMultiFloors=False",
    "SupplyCrateLootQualityMultiplier=1.000000",
    "FishingLootQualityMultiplier=1.000000",
    "UseCorpseLifeSpanMultiplier=1.000000",
    "GlobalPoweredBatteryDurabilityDecreasePerSecond=4.000000",
    "RandomSupplyCratePoints=False",
    "OverrideMaxExperiencePointsPlayer=53373537",
    "PlayerHarvestingDamageMultiplier=1.000000",
    "CraftingSkillBonusMultiplier=1.000000",
    "OverrideMaxExperiencePointsDino=3550001",
    "DinoHarvestingDamageMultiplier=3.000000",
    "DinoTurretDamageMultiplier=1.000000",
    "MatingIntervalMultiplier=3.000000",
    "EggHatchSpeedMultiplier=3.000000",
    "BabyMatureSpeedMultiplier=3.000000",
    "BabyFoodConsumptionSpeedMultiplier=1.000000",
    "BabyImprintingStatScaleMultiplier=1.000000",
    "BabyCuddleIntervalMultiplier=3.000000",
    "BabyCuddleGracePeriodMultiplier=1.000000",
    "BabyCuddleLoseImprintQualitySpeedMultiplier=1.000000",
    "WildDinoCharacterFoodDrainMultiplier=1.000000",
    "TamedDinoCharacterFoodDrainMultiplier=1.000000",
    "WildDinoTorporDrainMultiplier=1.000000",
    "TamedDinoTorporDrainMultiplier=1.000000",
    "PassiveTameIntervalMultiplier=1.000000",
    "ResourceNoReplenishRadiusPlayers=1.000000",
    "ResourceNoReplenishRadiusStructures=1.000000",
    "BaseTemperatureMultiplier=1.000000",
    "GlobalSpoilingTimeMultiplier=1.000000",
    "GlobalItemDecompositionTimeMultiplier=1.000000",
    "GlobalCorpseDecompositionTimeMultiplier=1.000000",
    "CropDecaySpeedMultiplier=1.000000",
    "CropGrowthSpeedMultiplier=3.000000",
    "LayEggIntervalMultiplier=3.000000",
    "PoopIntervalMultiplier=1.000000",
    "HairGrowthSpeedMultiplier=1.000000",
    "CraftXPMultiplier=$XPMultiplier",
    "GenericXPMultiplier=$XPMultiplier",
    "HarvestXPMultiplier=$XPMultiplier",
    "KillXPMultiplier=$XPMultiplier",
    "SpecialXPMultiplier=$XPMultiplier",
    "StructureDamageRepairCooldown=180",
    "PvPZoneStructureDamageMultiplier=6.000000",
    "bFlyerPlatformAllowUnalignedDinoBasing=False",
    "bPassiveDefensesDamageRiderlessDinos=False",
    "bDisableStructurePlacementCollision=False",
    "bLimitTurretsInRange=False",
    "bHardLimitTurretsInRange=False"
)

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
            Write-Host -ForegroundColor DarkCyan " Create GameUserSettings.ini"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "3"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Create Game.ini"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "4"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Copy Mods from Local to Server Folder"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "5"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Add to Task Scheduler (Requires Administrator)"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "6"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Remove from Task Scheduler (Requires Administrator)"
        $subMenu1 = Read-Host "`nSelection (leave blank to go back)"
        # Start Server
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
        # Create Game Config
        if($subMenu1 -eq 3){
            New-GameConfig
            
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Copy mods from Local to Server
        if($subMenu1 -eq 4){
            Copy-ModsFolder
            
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Register Server Task
        if($subMenu1 -eq 5){
            Register-ServerTask
            
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
        # Unregister Server Task
        if($subMenu1 -eq 6){
            Unregister-ServerTask
            
            Write-Host "`nPress any key to return to the previous menu"
            [void][System.Console]::ReadKey($true)
        }
    }
}

function Start-Server {

    if ($Map -eq '') {
        Clear-Host
        Write-Host -ForegroundColor Cyan "Select a Map"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "1"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " TheIsland"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "2"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " TheCenter"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "3"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " ScorchedEarth"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "4"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Ragnarok"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "5"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Aberration"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "6"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Extinction"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "7"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Valguero"
        $MapSelect = Read-Host "`nSelect a Map (leave blank to go back)"
        # TheIsland
        if($MapSelect -eq 1){
            $Map = 'TheIsland'
        }
        # TheCenter
        if($MapSelect -eq 2){
            $Map = 'TheCenter'
        }
        # ScorchedEarth
        if($MapSelect -eq 3){
            $Map = 'ScorchedEarth_P'
        }
        # Ragnarok
        if($MapSelect -eq 4){
            $Map = 'Ragnarok'
        }
        # Aberration
        if($MapSelect -eq 5){
            $Map = 'Aberration_P'
        }
        # Extinction
        if($MapSelect -eq 6){
            $Map = 'Extinction'
        }
        # Valguero
        if($MapSelect -eq 7){
            $Map = 'Valguero_P'
        }
    }

    if ($Map -ne '') {
        if (Test-Path $ServerLoc\ShooterGame\Binaries\Win64\ShooterGameServer.exe) { 
            Clear-Host
            Write-Host '--------------------------------------------------------------------------------'
            Write-Host "Launching $GameFullname Server"
            Write-Host '--------------------------------------------------------------------------------'
            Write-Host 
            Write-Host 'Launching . . .'
            Write-Host 
            Start-Process "$ServerLoc\ShooterGame\Binaries\Win64\ShooterGameServer.exe" -ArgumentList "$Map $StartUpSettings $paramline $authkey $steamid" -NoNewWindow
            Clear-Host
            Write-Host '--------------------------------------------------------------------------------'
            Write-Host "$GameFullname Server running!"
            Write-Host '--------------------------------------------------------------------------------'
            Write-Host 
            Write-Host "Server Name: $SessionName"
            Write-Host "Server Password: $ServerPassword"
            Write-Host "Server Map: $Map"
            Write-Host "Server Port: $Port"
            Write-Host 
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

function Copy-ModsFolder {
    if (Test-Path $ModsLoc) {
        Copy-Item -Path "$ModsLoc" -Destination "$ServerLoc\ShooterGame\Content\Mods" -recurse -Force
        Write-Host 
        Write-Host 'Local Mods copied to Server folder.' -ForegroundColor Green
     } else {
        Write-Host 
        Write-Host 'Mods folder not found.' -ForegroundColor Red
    }
}

function New-ServerConfig {
    if (Test-Path $ConfigLoc) {
        Set-ItemProperty -Path "$ConfigLoc\GameUserSettings.ini" -Name IsReadOnly -Value $false
        Set-Content -Value $ServerConfig -Path "$ConfigLoc\GameUserSettings.ini"
        Set-ItemProperty -Path "$ConfigLoc\GameUserSettings.ini" -Name IsReadOnly -Value $true
        Write-Host 
        Write-Host "GameUserSettings.ini created." -ForegroundColor Green
     } else {
        Write-Host 
        Write-Host 'Config folder not found.' -ForegroundColor Red
    }
}

function New-GameConfig {
    if (Test-Path $ConfigLoc) {
        Set-ItemProperty -Path "$ConfigLoc\Game.ini" -Name IsReadOnly -Value $false
        Set-Content -Value $GameConfig -Path "$ConfigLoc\Game.ini"
        Set-ItemProperty -Path "$ConfigLoc\Game.ini" -Name IsReadOnly -Value $true
        Write-Host 
        Write-Host "Game.ini created." -ForegroundColor Green
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
        "Start-Process $ServerLoc\ShooterGame\Binaries\Win64\ShooterGameServer.exe -ArgumentList $settings $paramline $authkey $steamid -NoNewWindow"
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

    if ($Map -eq '') {
        Clear-Host
        Write-Host -ForegroundColor Cyan "Select a Map"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "1"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " TheIsland"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "2"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " TheCenter"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "3"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " ScorchedEarth"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "4"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Ragnarok"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "5"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Aberration"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "6"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Extinction"
        Write-Host -ForegroundColor DarkCyan -NoNewline "`n["; Write-Host -NoNewline "7"; Write-Host -ForegroundColor DarkCyan -NoNewline "]"; `
            Write-Host -ForegroundColor DarkCyan " Valguero"
        $MapSelect = Read-Host "`nSelect a Map (leave blank to go back)"
        # TheIsland
        if($MapSelect -eq 1){
            $Map = 'TheIsland'
        }
        # TheCenter
        if($MapSelect -eq 2){
            $Map = 'TheCenter'
        }
        # ScorchedEarth
        if($MapSelect -eq 3){
            $Map = 'ScorchedEarth_P'
        }
        # Ragnarok
        if($MapSelect -eq 4){
            $Map = 'Ragnarok'
        }
        # Aberration
        if($MapSelect -eq 5){
            $Map = 'Aberration_P'
        }
        # Extinction
        if($MapSelect -eq 6){
            $Map = 'Extinction'
        }
        # Valguero
        if($MapSelect -eq 7){
            $Map = 'Valguero_P'
        }
    }

    if (!(Test-Path $BackupLoc)) { New-Item -ItemType Directory -Force -Path $BackupLoc }
    $GetDate = "$(Get-Date -UFormat "%d%m%y-%H%M")"
    Compress-Archive -Path "$ServerLoc\ShooterGame\Saved\SavedArks\$Map.ark" -DestinationPath "$BackupLoc\$GetDate-$Map.zip" -Force -CompressionLevel 'Optimal'
    Write-Host "Backup of $Map Created" -ForegroundColor Green
}

mainMenu