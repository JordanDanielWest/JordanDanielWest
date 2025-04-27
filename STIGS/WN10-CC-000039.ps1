<#
.SYNOPSIS
    This PowerShell script configures the SuppressionPolicy registry value under specific file class handlers to enhance security when running files as a different user.

.NOTES
    Author          : Jordan West
    LinkedIn        : https://www.linkedin.com/in/jordan-west-it/
    GitHub          : https://github.com/JordanDanielWest
    Date Created    : 2025-04-25
    Last Modified   : 2025-04-25
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000039

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run this script as an administrator to set the SuppressionPolicy registry value to 4096 (0x00001000) for BAT, CMD, EXE, and MSC file types.
    Example syntax:
    PS C:\> .\WN10-SO-000100-SuppressionPolicy.ps1

#>

# List of registry paths to modify
$RegPaths = @(
    "HKLM:\SOFTWARE\Classes\batfile\shell\runasuser",
    "HKLM:\SOFTWARE\Classes\cmdfile\shell\runasuser",
    "HKLM:\SOFTWARE\Classes\exefile\shell\runasuser",
    "HKLM:\SOFTWARE\Classes\mscfile\shell\runasuser"
)

foreach ($path in $RegPaths) {
    # Create the key if it does not exist
    if (-not (Test-Path $path)) {
        New-Item -Path $path -Force
    }

    # Set the SuppressionPolicy DWORD value to 4096 (0x1000)
    New-ItemProperty -Path $path -Name "SuppressionPolicy" -PropertyType DWord -Value 0x1000 -Force
}
