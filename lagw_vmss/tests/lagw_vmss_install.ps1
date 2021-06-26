#Create downloads dir
$value = Test-Path -Path "C:\downloads"
if ('False' -eq $value)
{
    New-Item -Path "c:\" -Name "downloads" -ItemType "directory"
}

# Source file location
$source = 'https://go.microsoft.com/fwlink/?linkid=837444'
# Destination to save the file
$destination = 'c:\downloads\oms-gateway.msi'
#Download the OMS Gateway file
Invoke-WebRequest -Uri $source -OutFile $destination

#Install OMS Gateway
Start-Process msiexec.exe -Verb RunAs -Wait -ArgumentList 'Msiexec.exe /I "oms-gateway.msi" /qn PORTNUMBER=8080 LicenseAccepted=1'