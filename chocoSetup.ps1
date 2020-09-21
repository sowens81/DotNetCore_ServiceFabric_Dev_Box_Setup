
#Requires -Version 3.0
<#
    .DESCRIPTION
        This script will install Choco onto a Windows OS.
        The script must be run with elevated admin permissions for PowerShell.
    
    .NOTES
        AUTHOR: Steve Owens
        LASTEDIT: Sep 21, 2020
        VERSION: 1.0.0.1
#>

# Install Choco 
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
