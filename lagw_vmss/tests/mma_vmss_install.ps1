#Create downloads dir
$value = Test-Path -Path "C:\downloads"
if ('False' -eq $value)
{
    New-Item -Path "c:\" -Name "downloads" -ItemType "directory"
}

# Source file location
$source = 'https://go.microsoft.com/fwlink/?LinkId=828603'
# Destination to save the file
$destination = 'c:\downloads\mma-setup.exe'

#Download the OMS Gateway file
Invoke-WebRequest -Uri $source -OutFile $destination

#Extract executable
Start-Process 'mma-setup.exe' -WorkingDirectory 'C:\downloads' -Verb RunAs -Wait -ArgumentList '/c /t:C:\downloads'
#Install MMA Agent
Start-Process 'setup.exe' -WorkingDirectory "C:\downloads" -Verb RunAs -Wait -ArgumentList '/qn NOAPM=1 ADD_OPINSIGHTS_WORKSPACE=1 OPINSIGHTS_WORKSPACE_AZURE_CLOUD_TYPE=0 OPINSIGHTS_WORKSPACE_ID=parameters('workspaceName') OPINSIGHTS_WORKSPACE_KEY=parameters('workspaceKey') AcceptEndUserLicenseAgreement=1'