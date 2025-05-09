<#
.SYNOPSIS
    Disables Web-based Plug and Play driver downloads for printers by setting the 'DisableWebPnPDownload' registry value to 1.

.DESCRIPTION
    Web-based Plug and Play (WebPnP) can introduce risk by allowing printer drivers to be downloaded over the internet.
    Setting this registry key to 1 prevents such downloads, reducing potential attack vectors.

.NOTES
    Author          : Jordan West
    LinkedIn        : https://www.linkedin.com/in/jordan-west-it/
    GitHub          : https://github.com/JordanDanielWest
    Date Created    : 2025-05-09
    Last Modified   : 2025-05-09
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000100

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 


.USAGE
    Run this script in an elevated PowerShell session (Run as Administrator):

    PS C:\> .\Set-DisableWebPnPDownload.ps1
#>

# Define the registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers"

# Create the registry key if it does not exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set DisableWebPnPDownload to 1 (enabled)
New-ItemProperty -Path $regPath -Name "DisableWebPnPDownload" -PropertyType DWord -Value 1 -Force | Out-Null

Write-Host "'DisableWebPnPDownload' set to 1 successfully." -ForegroundColor Green
