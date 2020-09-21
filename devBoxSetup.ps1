#Requires -Version 3.0
<#
    .DESCRIPTION
        This script will install Chocolatey packages, VSCode Extensions and Visual Studio 2019 Extensions onto a Windows OS.
        The script must be run with elevated admin permissions for PowerShell.
        The script must be run in the same directory as the configuration files, see GIT Repo readme for more details.
    
    .NOTES
        AUTHOR: Steve Owens
        LASTEDIT: Sep 21, 2020
        VERSION: 1.0.0.1
#>

function InstallVSExtension 
{
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [string] $ExtensionName,
        [Parameter(Mandatory=$true)]
        [string] $FileName,
        [Parameter(Mandatory=$true)]
        [string] $DownloadURL
    )

    Process
    {
        $dl = (Get-Location).Path
        Invoke-WebRequest -Uri $DownloadURL -OutFile "$dl/$FileName"
        VSIXInstaller.exe /quiet $dl/$$FileName
        Write-Host("Visual Studio 2019 Extension - $ExtensionName, Installed Successfully")
    }
}

# Install Chocolatey Packages
choco install packages.config -y

# Install VS Code Extensions
code --install-extension vscode_extensions.txt

# Install Visual Studio 2019 Extensions
$VSES = (Get-Content vs_extensions.json| ConvertFrom-Json)

foreach ($VSE in $VSES)
{
    InstallVSExtension -ExtensionName $VSE.ExtensionName -FileName $VSE.FileName -DownloadURL $VSE.DownloadURL
}

