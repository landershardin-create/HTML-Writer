# === CONFIGURATION ===
$logPath = "$env:SystemDrive\LoopbackSecurityAudit.log"
$emailRecipient = "admin@example.com"       # Replace with your email
$emailSender = "securitybot@example.com"    # Replace with sender address
$smtpServer = "smtp.example.com"            # Replace with your SMTP server
$networkSharePath = "\\Server\AuditLogs"    # Replace with your network share path

# === LOGGING FUNCTION ===
function Log {
    param ([string]$message)
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Add-Content -Path $logPath -Value "$timestamp - $message"
    Write-Host $message
}

# === ADMIN CHECK ===
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Log "ERROR: Script must be run as Administrator."
    exit
}

# === LOOPBACK AUDIT ===
Log "🔍 Auditing loopback-bound services..."
$loopbackServices = netstat -ano | findstr "127.0.0.1"
$loopbackServices | ForEach-Object { Log "Loopback binding: $_" }

# === FIREWALL HARDENING ===
Log "🧱 Applying firewall rules..."
New-NetFirewallRule -DisplayName "Block External Loopback Access" `
    -Direction Inbound -LocalAddress 127.0.0.1 -Action Block `
    -Protocol TCP -Profile Any -Enabled True | Out-Null
Log "Firewall rule 'Block External Loopback Access' applied."

$restrictedPorts = @(80, 1433, 3306, 8080)
foreach ($port in $restrictedPorts) {
    New-NetFirewallRule -DisplayName "Restrict Loopback Port $port" `
        -Direction Inbound -LocalAddress 127.0.0.1 -LocalPort $port `
        -Action Block -Protocol TCP -Profile Any -Enabled True | Out-Null
    Log "Firewall rule for port $port applied."
}

# === IIS LOOPBACK PROTECTION ===
Log "🔐 Enabling IIS loopback check protection..."
$regPath = "HKLM\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0"
$regName = "BackConnectionHostNames"
$hostname = "your.local.hostname"  # Replace with actual hostname
New-Item -Path $regPath -Force | Out-Null
New-ItemProperty -Path $regPath -Name $regName -PropertyType MultiString -Value $hostname -Force