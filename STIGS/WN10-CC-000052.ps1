<#
.SYNOPSIS
        This PowerShell script enforces the use of stronger ECC curves for SSL/TLS by configuring the ECC Curve Order registry value to prioritize NistP384 and NistP256.

.NOTES
    Author          : Jordan West
    LinkedIn        : https://www.linkedin.com/in/jordan-west-it/
    GitHub          : https://github.com/JordanDanielWest
    Date Created    : 2025-04-25
    Last Modified   : 2025-04-25
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000052

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run this script as an administrator to ensure Windows systems prioritize stronger ECC curves and help mitigate the use of weak or untested encryption algorithms.
    Example syntax:
    PS C:\> .\WN10-CC-000080-EccCurvesOrder.ps1

#>

# Define the registry path
$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Cryptography\Configuration\SSL\00010002"

# Create the registry key if it does not exist
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force
}

# Define the ECC curves order
$EccCurves = @("NistP384", "NistP256")

# Set the EccCurves value as REG_MULTI_SZ
New-ItemProperty -Path $RegPath -Name "EccCurves" -PropertyType MultiString -Value $EccCurves -Force
