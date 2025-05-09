<#
.SYNOPSIS
    Hides the network selection UI on the sign-in screen to prevent unauthorized access attempts via available networks.

.DESCRIPTION
    Setting 'DontDisplayNetworkSelectionUI' to 1 disables the network selection UI on the logon screen,
    reducing the risk of unauthorized users connecting to external networks before authentication.

.NOTES
    Author          : Jordan West
    LinkedIn        : https://www.linkedin.com/in/jordan-west-it/
    GitHub          : https://github.com/JordanDanielWest
    Date Created    : 2025-05-09
    Last Modified   : 2025-05-09
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000120

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 


.USAGE
    Run this script from an elevated PowerShell session (Run as Administrator):

    PS C:\> .\Set-DontDisplayNetworkSelectionUI.ps1
#>

# Define the registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System"

# Ensure the registry path exists
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the DontDisplayNetworkSelectionUI value
New-ItemProperty -Path $regPath -Name "DontDisplayNetworkSelectionUI" -PropertyType DWord -Value 1 -Force | Out-Null

Write-Host "'DontDisplayNetworkSelectionUI' registry key set to 1 successfully." -ForegroundColor Green
