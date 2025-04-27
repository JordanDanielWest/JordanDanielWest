<#
.SYNOPSIS
        This PowerShell script disables IP source routing by setting the DisableIPSourceRouting registry value to 2.

.NOTES
    Author          : Jordan West
    LinkedIn        : https://www.linkedin.com/in/jordan-west-it/
    GitHub          : https://github.com/JordanDanielWest
    Date Created    : 2025-04-25
    Last Modified   : 2025-04-25
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run this script as an administrator to disable IP source routing by setting the DisableIPSourceRouting registry entry to 2.
    Example syntax:
    PS C:\> .\WN10-TCPIP-DisableIPSourceRouting.ps1

#>

# Define the registry path
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters"

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force
}

# Set the DisableIPSourceRouting DWORD value to 2
New-ItemProperty -Path $regPath -Name "DisableIPSourceRouting" -PropertyType DWord -Value 2 -Force
