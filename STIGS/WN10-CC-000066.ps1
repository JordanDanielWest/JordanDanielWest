<#
.SYNOPSIS
    This PowerShell script enables logging of full command-line arguments for process creation events by setting the ProcessCreationIncludeCmdLine_Enabled registry value to 1.

.NOTES
    Author          : Jordan West
    LinkedIn        : https://www.linkedin.com/in/jordan-west-it/
    GitHub          : https://github.com/JordanDanielWest
    Date Created    : 2025-05-09
    Last Modified   : 2025-05-09
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000066

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 


.USAGE
    Run this script as an administrator to enhance audit log detail for process creation, which aids in forensic investigations and threat detection.
    Example:
    PS C:\> .\Enable-CommandLineAuditing.ps1
#>

# Define the registry path
$RegPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit"

# Create the registry key if it doesn't exist
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

# Set the ProcessCreationIncludeCmdLine_Enabled DWORD value to 1
New-ItemProperty -Path $RegPath -Name "ProcessCreationIncludeCmdLine_Enabled" -PropertyType DWord -Value 1 -Force | Out-Null

Write-Host "Process command-line auditing has been enabled successfully." -ForegroundColor Green
