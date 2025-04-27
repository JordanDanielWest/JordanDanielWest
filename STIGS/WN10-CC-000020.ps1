<#
.SYNOPSIS
    This PowerShell script ensures that IPv6 source routing is disabled by setting the DisableIpSourceRouting registry value to 2.

.NOTES
    Author          : Jordan West
    LinkedIn        : https://www.linkedin.com/in/jordan-west-it/
    GitHub          : https://github.com/JordanDanielWest
    Date Created    : 2025-04-27
    Last Modified   : 2025-04-27
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000020

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run this script as an administrator to disable IP source routing on IPv6 by setting the DisableIpSourceRouting registry value to 2.
    Example syntax:
    PS C:\> .\WN10-AC-000800-DisableIpSourceRouting.ps1
#>

# Define the registry path
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters"

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force
}

# Set the DisableIpSourceRouting DWORD value to 2
New-ItemProperty -Path $regPath -Name "DisableIpSourceRouting" -PropertyType DWord -Value 2 -Force
