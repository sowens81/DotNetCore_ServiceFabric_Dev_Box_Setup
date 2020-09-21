# DotNetCore and ServiceFabric Dev Book Setup

A set of scripts to be run on a Window System to install and configure a DotNetCore Developer box with Additional features such as ServiceFabric and SpecFlow.

## Install Choco
Run the following PowerShell Script on a Windows to install choco, must be run as admin.

Powershell Command: ./chocoSetup.ps1

## Package Configuratio and Setup

packages.config file is used for the packages that are required to be installed by Choco/Chocolatey, amend as required.

vs_extensions.json file is used for the Visual Studio 2019 marketplace extensions that are required to be installed by Visual Studio 2019 Cli, amend as required. Get the download URL and FileName for Visual Studio Extension Marketplace.

vscode_requirements.txt file is used for the Visual Studio Code marketplace extensions that are required to be installed by Visual Studio Code Cli, amend as required. Get the download URL and FileName for Visual Studio Code Extension Marketplace.

## Build Out the Environment (If Chocolatey Already Installed)
Run the following PowerShell Script on a Windows OS using an Administrative permissions.

Powershell Command: ./devBoxSetup.ps1

## Installed Software
See the following files for more details.
- packages.config
- vs_extensions.json
- vscode_requirements.txt