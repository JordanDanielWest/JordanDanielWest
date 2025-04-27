<#
.SYNOPSIS
    This PowerShell script disables the lock screen slideshow by setting the NoLockScreenSlideshow registry value to 1.
.NOTES
    Author          : Jordan West
    LinkedIn        : https://www.linkedin.com/in/jordan-west-it/
    GitHub          : https://github.com/JordanDanielWest
    Date Created    : 2025-04-27
    Last Modified   : 2025-04-27
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-0000010

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run this script as an administrator to disable the lock screen slideshow by setting the NoLockScreenSlideshow registry entry to 1.
    Example syntax:
    PS C:\> .\WN10-PS-000100-DisableLockScreenSlideshow.ps1
#>

# Define the registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force
}

# Set the NoLockScreenSlideshow DWORD value to 1
New-ItemProperty -Path $regPath -Name "NoLockScreenSlideshow" -PropertyType DWord -Value 1 -Force
