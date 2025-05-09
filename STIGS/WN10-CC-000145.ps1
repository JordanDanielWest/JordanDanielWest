<#
.SYNOPSIS
    Configures the DCSettingIndex to disable the ability to turn off the system display during sleep while on battery.

.DESCRIPTION
    Sets the value of the registry key associated with power settings policy 
    `0e796bdb-100d-47d6-a2d5-f7d2daa51f51` to ensure secure power configuration when the system is on battery (DC power).

.NOTES
    Author          : Jordan West
    LinkedIn        : https://www.linkedin.com/in/jordan-west-it/
    GitHub          : https://github.com/JordanDanielWest
    Date Created    : 2025-05-09
    Last Modified   : 2025-05-09
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000145

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 


.USAGE
    Run this script from an elevated PowerShell session (Run as Administrator):

    PS C:\> .\Set-DCSettingIndex.ps1
#>

# Define registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51"

# Ensure registry path exists
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set DCSettingIndex to 1
New-ItemProperty -Path $regPath -Name "DCSettingIndex" -PropertyType DWord -Value 1 -Force | Out-Null

Write-Host "'DCSettingIndex' set to 1 successfully at $regPath" -ForegroundColor Green

