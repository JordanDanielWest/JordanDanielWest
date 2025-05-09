<#
.SYNOPSIS
    Configures the ACSettingIndex for a power policy to ensure secure display settings on AC power.

.DESCRIPTION
    This script sets the 'ACSettingIndex' registry value to 1 under the specified Power Settings GUID.
    This setting typically controls behavior related to display or sleep policies when the system is plugged into AC power.

.NOTES
    Author          : Jordan West
    LinkedIn        : https://www.linkedin.com/in/jordan-west-it/
    GitHub          : https://github.com/JordanDanielWest
    Date Created    : 2025-05-09
    Last Modified   : 2025-05-09
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000150

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 


.USAGE
    Run this script in an elevated PowerShell session (Run as Administrator):

        PS C:\> .\Set-ACSettingIndex.ps1
#>

# Define the registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51"

# Ensure the registry path exists
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the registry value
New-ItemProperty -Path $regPath -Name "ACSettingIndex" -PropertyType DWord -Value 1 -Force | Out-Null

Write-Host "'ACSettingIndex' successfully set to 1 at $regPath" -ForegroundColor Green
