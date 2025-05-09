<#
.SYNOPSIS
    This PowerShell script enables the use of Credential Guard-protected credentials for Remote Desktop connections by setting AllowProtectedCreds to 1.

.NOTES
    Author          : Jordan West
    LinkedIn        : https://www.linkedin.com/in/jordan-west-it/
    GitHub          : https://github.com/JordanDanielWest
    Date Created    : 2025-05-09
    Last Modified   : 2025-05-09
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000068

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run this script as an administrator to enforce the use of Credential Guard with delegated credentials.
    Example:
    PS C:\> .\Enable-AllowProtectedCreds.ps1
#>

# Define registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation"

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set AllowProtectedCreds to 1
New-ItemProperty -Path $regPath -Name "AllowProtectedCreds" -PropertyType DWord -Value 1 -Force | Out-Null

Write-Host "AllowProtectedCreds has been set to 1 successfully." -ForegroundColor Green
