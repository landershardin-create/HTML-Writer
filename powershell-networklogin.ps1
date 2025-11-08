# Prompt for credentials
$cred = Get-Credential -Message "Enter your network credentials"

# Test network access (e.g., to a shared folder)
$networkPath = "\\server\share"
$test = Test-Path $networkPath -Credential $cred

if ($test) {
    Write-Host "✅ Access granted to $networkPath"
    
    # Optional: Map network drive
    $driveLetter = "Z:"
    New-PSDrive -Name $driveLetter.TrimEnd(':') -PSProvider FileSystem -Root $networkPath -Credential $cred -Persist
    Write-Host "📁 Drive $driveLetter mapped to $networkPath"
} else {
    Write-Host "❌ Access denied. Check credentials or network path."
}