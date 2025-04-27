<#
.SYNOPSIS
    This PowerShell script prevents NetBIOS name release on demand by setting the NoNameReleaseOnDemand registry value to 1.

.NOTES
    Author          : Jordan West
    LinkedIn        : https://www.linkedin.com/in/jordan-west-it/
    GitHub          : https://github.com/JordanDanielWest
    Date Created    : 2025-04-25
    Last Modified   : 2025-04-25
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000035

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
   un this script as an administrator to prevent NetBIOS name release on demand by setting the NoNameReleaseOnDemand registry entry to 1.
    Example syntax:
    PS C:\> .\WN10-Netbt-NoNameReleaseOnDemand.ps1
#>

# Define the registry path
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Netbt\Parameters"

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force
}

# Set the NoNameReleaseOnDemand DWORD value to 1
New-ItemProperty -Path $regPath -Name "NoNameReleaseOnDemand" -PropertyType DWord -Value 1 -Force
