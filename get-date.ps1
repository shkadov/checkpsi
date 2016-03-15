function checkpsi{
$psi=Get-Process|Select-String -Pattern Psi
if (-Not $psi){Start-Process 'C:\Program Files (x86)\Psi\psi.exe' | Out-Null}
}

$WeekDay=(Get-Date).DayOfWeek
if ($WeekDay -ne "Saturday" -and $WeekDay -ne "Sunday"){checkpsi}
else {[string]$currentday = "Holiday"}

$date = Get-Date |Out-File 1.txt 
$psi  |Out-File 1.txt -Append
$currentday |Out-File 1.txt -Append
