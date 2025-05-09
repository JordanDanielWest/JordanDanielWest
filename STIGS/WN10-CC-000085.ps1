<#
.SYNOPSIS
    This PowerShell script enforces a secure Boot-Start Driver Initialization policy for Early Launch Antimalware (ELAM), preventing known bad drivers from loading during startup.

.NOTES
    Author          : Jordan West
    LinkedIn        : https://www.linkedin.com/in/jordan-west-it/
    GitHub          : https://github.com/JordanDanielWest
    Date Created    : 2025-05-09
    Last Modified   : 2025-05-09
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000085

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 


.USAGE
    Run this script as an administrator to configure ELAM to only allow good, unknown, and critical drivers — excluding known bad drivers.
    Example:
    PS C:\> .\Configure-ELAM-DriverPolicy.ps1
#>

# Define registry path
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Policies\EarlyLaunch"

# Create the registry key if it does not exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set DriverLoadPolicy to 3 (Good, Unknown, and Bad but Critical)
New-ItemProperty -Path $regPath -Name "DriverLoadPolicy" -PropertyType DWord -Value 3 -Force | Out-Null

Write-Host "DriverLoadPolicy has been configured to 3 (secure startup enforcement) successfully." -ForegroundColor Green
