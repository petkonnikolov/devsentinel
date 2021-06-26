# Source file location
$source = 'https://go.microsoft.com/fwlink/?LinkId=828603'
# Destination to save the file
$destination = 'c:\downloads\mma-setup.exe'
#Download the OMS Gateway file
Invoke-WebRequest -Uri $source -OutFile $destination

#Install OMS Gateway
Start-Process msiexec.exe -Wait -ArgumentList 'Msiexec.exe /I "oms gateway.msi" /qn PORTNUMBER=8080 LicenseAccepted=1'