<#
.SYNOPSIS
    This PowerShell script disables the Internet Connection Sharing user interface by setting the NC_ShowSharedAccessUI registry value to 0, preventing systems from easily creating mobile hotspots.

.NOTES
    Author          : Jordan West
    LinkedIn        : https://www.linkedin.com/in/jordan-west-it/
    GitHub          : https://github.com/JordanDanielWest
    Date Created    : 2025-04-25
    Last Modified   : 2025-04-25
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000044

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run this script as an administrator to restrict Internet Connection Sharing and reduce exposure to potentially malicious devices.
    Example syntax:
    PS C:\> .\WN10-CC-000050-NC_ShowSharedAccessUI.ps1

#>

# Define the registry path
$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Network Connections"

# Create the registry key if it does not exist
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force
}

# Set the NC_ShowSharedAccessUI DWORD value to 0
New-ItemProperty -Path $RegPath -Name "NC_ShowSharedAccessUI" -PropertyType DWord -Value 0 -Force
