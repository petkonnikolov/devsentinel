# Source file location
$source = 'https://go.microsoft.com/fwlink/?linkid=837444'
# Destination to save the file
$destination = 'c:\dload\oms gateway.msi'
#Download the file
Invoke-WebRequest -Uri $source -OutFile $destination

Start-Process msiexec.exe -Wait -ArgumentList 'Msiexec.exe /I "oms gateway.msi" /qn PORTNUMBER=8080 LicenseAccepted=1'