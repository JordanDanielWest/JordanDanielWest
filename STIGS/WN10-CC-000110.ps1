<#
.SYNOPSIS
    Disables HTTP printing on the system by configuring the 'DisableHTTPPrinting' registry setting.

.DESCRIPTION
    HTTP printing can expose the system to remote print server attacks. Setting the 
    'DisableHTTPPrinting' registry value to 1 prevents printing over HTTP, reducing the attack surface.

.NOTES
    Author          : Jordan West
    LinkedIn        : https://www.linkedin.com/in/jordan-west-it/
    GitHub          : https://github.com/JordanDanielWest
    Date Created    : 2025-05-09
    Last Modified   : 2025-05-09
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000110

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run this script from an elevated PowerShell session (Run as Administrator):

    PS C:\> .\Set-DisableHTTPPrinting.ps1
#>

# Define the registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers"

# Ensure the registry path exists
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the DisableHTTPPrinting value
New-ItemProperty -Path $regPath -Name "DisableHTTPPrinting" -PropertyType DWord -Value 1 -Force | Out-Null

Write-Host "'DisableHTTPPrinting' registry key set to 1 successfully." -ForegroundColor Green
