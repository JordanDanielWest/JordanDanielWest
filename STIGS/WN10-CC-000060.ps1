<#
.SYNOPSIS
    This PowerShell script configures Windows to block connections to non-domain networks when connected to a domain-authenticated network by setting the fBlockNonDomain registry value to 1.

.NOTES
    Author          : Jordan West
    LinkedIn        : https://www.linkedin.com/in/jordan-west-it/
    GitHub          : https://github.com/JordanDanielWest
    Date Created    : 2025-04-25
    Last Modified   : 2025-04-25
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000060

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run this script as an administrator to enforce network security by restricting simultaneous connections to non-domain networks when connected to a domain.
    Example syntax:
    PS C:\> .\WN10-CC-000110-BlockNonDomainNetworks.ps1

#>

# Define the registry path
$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\GroupPolicy"

# Create the registry key if it does not exist
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force
}

# Set the fBlockNonDomain DWORD value to 1
New-ItemProperty -Path $RegPath -Name "fBlockNonDomain" -PropertyType DWord -Value 1 -Force
