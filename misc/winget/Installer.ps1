$Url = 'https://github.com/qarmin/czkawka/releases/download/4.1.0/windows_czkawka_gui.zip'
If (-Not (Test-Path -Path "$env:TEMP\czkawka_temp\")) {
    New-Item -Path "$env:TEMP\czkawka_temp\" -ItemType Directory
} 
$ZipFile = "$env:TEMP\czkawka_temp\" + $(Split-Path -Path $Url -Leaf)
Invoke-WebRequest -Uri $Url -OutFile $ZipFile 
$Destination= "$env:LOCALAPPDATA\czkawka"
If (-Not (Test-Path -Path $Destination)) {
    New-Item -Path $Destination -ItemType Directory
}
# $ExtractShell = New-Object -ComObject Shell.Application 
# $Files = $ExtractShell.Namespace($ZipFile).Items() 
# $ExtractShell.NameSpace($Destination).CopyHere($Files) 
Expand-Archive -Path $ZipFile -DestinationPath $Destination -Force
Remove-Item $ZipFile -Force
Start-Process $Destination\czkawka_gui.exe