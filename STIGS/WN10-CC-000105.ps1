<#
.SYNOPSIS
    Disables access to web-based Windows Shell services by setting 'NoWebServices' to 1.

.DESCRIPTION
    Prevents the use of Windows Explorer to access Web-based services like WebDAV by enforcing
    the 'NoWebServices' registry setting. This reduces potential attack surfaces and supports compliance requirements.

.NOTES
    Author          : Jordan West
    LinkedIn        : https://www.linkedin.com/in/jordan-west-it/
    GitHub          : https://github.com/JordanDanielWest
    Date Created    : 2025-05-09
    Last Modified   : 2025-05-09
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000105

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 


.USAGE
    Run this script in an elevated PowerShell session (Run as Administrator):

    PS C:\> .\Set-NoWebServices.ps1
#>

# Define registry path
$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer"

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set NoWebServices to 1 (disabled)
New-ItemProperty -Path $regPath -Name "NoWebServices" -PropertyType DWord -Value 1 -Force | Out-Null

Write-Host "'NoWebServices' registry key set to 1 successfully." -ForegroundColor Green
