<#
.SYNOPSIS
    This PowerShell script disables insecure guest access to SMB servers by setting the AllowInsecureGuestAuth registry value to 0.

.NOTES
    Author          : Jordan West
    LinkedIn        : https://www.linkedin.com/in/jordan-west-it/
    GitHub          : https://github.com/JordanDanielWest
    Date Created    : 2025-04-25
    Last Modified   : 2025-04-25
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000040

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run this script as an administrator to enforce secure SMB client behavior by disabling insecure guest authentication.
    Example syntax:
    PS C:\> .\WN10-SO-000110-AllowInsecureGuestAuth.ps1

#>

# Define the registry path
$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\LanmanWorkstation"

# Create the registry key if it does not exist
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force
}

# Set the AllowInsecureGuestAuth DWORD value to 0
New-ItemProperty -Path $RegPath -Name "AllowInsecureGuestAuth" -PropertyType DWord -Value 0 -Force
