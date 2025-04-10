# PowerShell script to disable specific services and remove unwanted apps with a 1-second delay

# List of services to disable
$services = @(
    "AxInstSV", "tzautoupdate", "bthserv", "dmwappushservice",
    "MapsBroker", "lfsvc", "SharedAccess", "lltdsvc",
    "AppVClient", "NetTcpPortSharing", "CscService", "PhoneSvc",
    "Spooler", "PrintNotify", "QWAVE", "RmSvc",
    "RemoteAccess", "SensorDataService", "SensrSvc", "SensorService",
    "ShellHWDetection", "SCardSvr", "ScDeviceEnum", "SSDPSRV",
    "WiaRpc", "TabletInputService", "upnphost", "UserDataSvc",
    "UevAgentService", "WalletService", "FrameServer", "stisvc",
    "wisvc", "icssvc", "WSearch", "XblAuthManager",
    "XblGameSave", "SEMgrSvc", "DiagTrack"
)

Write-Host "Disabling specified services..." -ForegroundColor Cyan

foreach ($service in $services) {
    try {
        Write-Host "Disabling service: $service"
        Set-Service -Name $service -StartupType Disabled -ErrorAction Stop
    } catch {
        Write-Host "Failed to disable service: $service. Error: $_" -ForegroundColor Yellow
    }
    Start-Sleep -Seconds 1
}

Write-Host "`nRemoving unwanted apps..." -ForegroundColor Cyan

# List of app patterns to remove
$appPatterns = @(
    "*print3d*", "*3dviewer*", "*zune*", "*minecraft*",
    "*bing*", "*skype*", "*solitaire*", "*candycrush*",
    "*netflix*", "*onenote*", "*dolby*", "*fitbit*",
    "*feedback*", "*yourphone*"
)

foreach ($pattern in $appPatterns) {
    try {
        Write-Host "Removing app package matching: $pattern"
        Get-AppxPackage -Name $pattern -ErrorAction Stop | Remove-AppxPackage -ErrorAction Stop
    } catch {
        Write-Host "Failed to remove app package matching: $pattern. Error: $_" -ForegroundColor Yellow
    }
    Start-Sleep -Seconds 1
}

Write-Host "`nAll specified tasks completed." -ForegroundColor Green


