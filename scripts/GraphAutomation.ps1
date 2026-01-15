# ==========================================================
# CONFIGURATION
# ==========================================================

# PRTG
$BaseURL  = "https://127.0.0.1:4433"
$ApiToken = $env:PRTG_API_TOKEN

# Telegram
$BotToken = $env:TELEGRAM_BOT_TOKEN
$ChatID   = $env:TELEGRAM_CHAT_ID

# Output directory
$OutDir = "C:\Temp\PRTG_Graphs"

# ==========================================================
# VALIDATION
# ==========================================================

if (-not $ApiToken) {
    Write-Error "PRTG_API_TOKEN environment variable not set"
    exit 1
}

if (-not $BotToken -or -not $ChatID) {
    Write-Error "Telegram environment variables not set"
    exit 1
}

# ==========================================================
# DATE CALCULATION (Yesterday 00:00 → 23:59)
# ==========================================================

$Yesterday   = (Get-Date).AddDays(-1)
$StartDate   = $Yesterday.ToString("yyyy-MM-dd-00-00-00")
$EndDate     = $Yesterday.ToString("yyyy-MM-dd-23-59-59")
$DisplayDate = $Yesterday.ToString("dd MMM yyyy")

# ==========================================================
# PREPARE OUTPUT FOLDER
# ==========================================================

if (!(Test-Path $OutDir)) {
    New-Item -ItemType Directory -Force -Path $OutDir | Out-Null
}

Remove-Item "$OutDir\*" -Force -ErrorAction SilentlyContinue

# ==========================================================
# SENSOR LIST
# ==========================================================

$Sensors = @{
    23742 = "Traffic for site 1"
    4737 = "Traffic for site 2"
    38482 = "Traffic for site 3"
}

# ==========================================================
# DOWNLOAD PRTG GRAPHS
# ==========================================================

$Files = @()

foreach ($ID in $Sensors.Keys) {

    $NameSafe = $Sensors[$ID] -replace '[^a-zA-Z0-9_-]', '_'
    $File     = Join-Path $OutDir "$NameSafe.png"

    $GraphURL = "$BaseURL/chart.png?id=$ID&graphid=-1" +
                "&width=1200&height=500" +
                "&sdate=$StartDate&edate=$EndDate" +
                "&apitoken=$ApiToken"

    Write-Host "Downloading sensor $ID ($DisplayDate)..."

    & curl.exe -s -k "$GraphURL" -o "$File"

    if ((Test-Path $File) -and ((Get-Item $File).Length -gt 10000)) {
       $Files += $File
    } else {
       Write-Warning "Failed to download graph for sensor ID $ID"
       Remove-Item $File -ErrorAction SilentlyContinue
    }

    Start-Sleep -Seconds 2
}

# ==========================================================
# SEND GRAPHS TO TELEGRAM
# ==========================================================

foreach ($File in $Files) {

    $CleanName = (Split-Path $File -Leaf).Replace(".png","").Replace("_"," ")

    $Caption = @"
*PRTG Daily Report*

*Sensor:* $CleanName
*Date:* $DisplayDate (00:00 – 23:59)
"@

    Write-Host "Sending $CleanName to Telegram..."

    & curl.exe -s -k "https://api.telegram.org/bot$BotToken/sendPhoto" `
        -F "chat_id=$ChatID" `
        -F "photo=@$File" `
        -F "parse_mode=Markdown" `
        -F "caption=$Caption" | Out-Null
}

exit 0
