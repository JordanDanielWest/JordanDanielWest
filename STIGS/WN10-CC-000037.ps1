<#
.SYNOPSIS
    This PowerShell script strips local administrator accounts of admin rights over remote connections unless they use elevated credentials, by setting LocalAccountTokenFilterPolicy to 0.

.NOTES
    Author          : Jordan West
    LinkedIn        : https://www.linkedin.com/in/jordan-west-it/
    GitHub          : https://github.com/JordanDanielWest
    Date Created    : 2025-04-27
    Last Modified   : 2025-04-27
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000037

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run this script as an administrator to enforce UAC filtering on remote connections by setting the LocalAccountTokenFilterPolicy registry value to 0.
    Example syntax:
    PS C:\> .\WN10-SO-000070-LocalAccountTokenFilterPolicy.ps1

#>

# Define the registry path
$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force
}

# Set the LocalAccountTokenFilterPolicy DWORD value to 0
New-ItemProperty -Path $regPath -Name "LocalAccountTokenFilterPolicy" -PropertyType DWord -Value 0 -Force
