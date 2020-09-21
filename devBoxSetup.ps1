



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
choco install git -y
choco install vsts-cli -y
choco install vscode -y
choco install azure-cli -y
choco install az.powershell -y
choco install nodejs -y
choco install pester -y
choco install sql-server-express -y
choco install azure-data-studio -y
choco install sql-server-management-studio -y
choco install service-fabric-sdk  -y
choco install visualstudio2019professional --package-parameters "--add Microsoft.VisualStudio.Workload.CoreEditor --add Microsoft.VisualStudio.Workload.Data --add Microsoft.VisualStudio.Workload.DataScience --add Microsoft.VisualStudio.Workload.ManagedDesktop --add Microsoft.VisualStudio.Workload.NetCoreTools --add Microsoft.VisualStudio.Workload.NetCrossPlat --add Microsoft.VisualStudio.Workload.NetWeb --add Microsoft.VisualStudio.Workload.Node --add Microsoft.VisualStudio.Workload.Universal --add Microsoft.VisualStudio.Workload.Azure --includeRecommended --includeOptional --passive --locale en-US" -y
choco install postman -y

# Install VS Code Extensions
code --install-extension extensions.txt

# Install Visual Studio 2019 Extensions


$VSES = (Get-Content vs_extensions.json| ConvertFrom-Json)

foreach ($VSE in $VSES)
{
    InstallVSExtension -ExtensionName $VSE.ExtensionName -FileName $VSE.FileName -DownloadURL $VSE.DownloadURL
}

