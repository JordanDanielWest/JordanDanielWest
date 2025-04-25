<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

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
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000500).ps1 
#>


# Define the registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force
}

# Set the MaxSize DWORD value to 0x8000 (32,768 in decimal)
New-ItemProperty -Path $regPath -Name "MaxSize" -PropertyType DWord -Value 0x8000 -Force
