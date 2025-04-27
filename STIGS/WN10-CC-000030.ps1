<#
.SYNOPSIS
    This PowerShell script disables ICMP redirects by setting the EnableICMPRedirect registry value to 0.

.NOTES
    Author          : Jordan West
    LinkedIn        : https://www.linkedin.com/in/jordan-west-it/
    GitHub          : https://github.com/JordanDanielWest
    Date Created    : 2025-04-25
    Last Modified   : 2025-04-25
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000030

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run this script as an administrator to disable ICMP redirects by setting the EnableICMPRedirect registry entry to 0.
    Example syntax:
    PS C:\> .\WN10-TCPIP-DisableICMPRedirect.ps1
#>

# Define the registry path
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters"

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force
}

# Set the EnableICMPRedirect DWORD value to 0
New-ItemProperty -Path $regPath -Name "EnableICMPRedirect" -PropertyType DWord -Value 0 -Force
