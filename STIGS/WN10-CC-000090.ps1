<#
.SYNOPSIS
    Configures the system to allow Group Policy to detect and apply changes by setting the 'NoGPOListChanges' registry value to 0.

.DESCRIPTION
    This script ensures that Group Policy settings are dynamically refreshed when changes are detected.
    Setting 'NoGPOListChanges' to 0 enables the client to process updated GPOs during a background refresh.

.NOTES
    Author          : Jordan West
    LinkedIn        : https://www.linkedin.com/in/jordan-west-it/
    GitHub          : https://github.com/JordanDanielWest
    Date Created    : 2025-05-09
    Last Modified   : 2025-05-09
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000090

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 


.USAGE
    Run this script as Administrator:
    
    PS C:\> .\Set-NoGPOListChanges.ps1
#>

# Define registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}"

# Create the key if it does not exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the NoGPOListChanges value to 0 (enable GPO list changes processing)
New-ItemProperty -Path $regPath -Name "NoGPOListChanges" -PropertyType DWord -Value 0 -Force | Out-Null

Write-Host "NoGPOListChanges set to 0 (enabled) successfully." -ForegroundColor Green
