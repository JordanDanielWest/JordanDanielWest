<#
.SYNOPSIS
    This PowerShell script disables the use of plaintext credentials by setting the UseLogonCredential registry value to 0 under Wdigest settings.

.NOTES
    Author          : Jordan West
    LinkedIn        : https://www.linkedin.com/in/jordan-west-it/
    GitHub          : https://github.com/JordanDanielWest
    Date Created    : 2025-04-25
    Last Modified   : 2025-04-25
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000038

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run this script as an administrator to enforce credential protection by setting the UseLogonCredential registry value to 0.
    Example syntax:
    PS C:\> .\WN10-SO-000090-UseLogonCredential.ps1

#>

# Define the registry path
$RegPath = "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\Wdigest"

# Create the registry key if it does not exist
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force
}

# Set the UseLogonCredential DWORD value to 0
New-ItemProperty -Path $RegPath -Name "UseLogonCredential" -PropertyType DWord -Value 0 -Force
