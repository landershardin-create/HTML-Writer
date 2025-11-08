# Prompt for credentials
$cred = Get-Credential

# Define domain controller and domain
$domainController = "yourdomaincontroller.domain.com"
$domain = "yourdomain.com"

# Attempt to bind to AD using provided credentials
try {
    $contextType = [System.DirectoryServices.AccountManagement.ContextType]::Domain
    $principalContext = New-Object System.DirectoryServices.AccountManagement.PrincipalContext($contextType, $domainController)

    $isValid = $principalContext.ValidateCredentials($cred.UserName, $cred.GetNetworkCredential().Password)

    if ($isValid) {
        Write-Host "✅ Login successful for user: $($cred.UserName)"
        # Optional: Fetch user details
        $userPrincipal = [System.DirectoryServices.AccountManagement.UserPrincipal]::FindByIdentity($principalContext, $cred.UserName)
        Write-Host "Display Name: $($userPrincipal.DisplayName)"
        Write-Host "Email: $($userPrincipal.EmailAddress)"
    } else {
        Write-Host "❌ Login failed. Invalid credentials."
    }
} catch {
    Write-Host "⚠️ Error during login: $_"
}
