<#
.SYNOPSIS
    This PowerShell script ensures that webcam access is denied by setting the Value registry entry to "Deny" under the CapabilityAccessManager\ConsentStore\webcam path.
.NOTES
    Author          : Jordan West
    LinkedIn        : https://www.linkedin.com/in/jordan-west-it/
    GitHub          : https://github.com/JordanDanielWest
    Date Created    : 2025-04-27
    Last Modified   : 2025-04-27
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000007

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run this script as an administrator to deny webcam access by setting the Value registry entry to "Deny".
    Example syntax:
    PS C:\> .\WN10-AC-000900-DenyWebcamAccess.ps1
#>
# Define the registry path
$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam"

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force
}

# Set the Value registry entry to Deny
New-ItemProperty -Path $regPath -Name "Value" -PropertyType String -Value "Deny" -Force
