function CheckHoliday {
$WeekDay=(Get-Date).DayOfWeek
if ($WeekDay -ne "Saturday" -and $WeekDay -ne "Sunday"){Get-WeekNumber}
else {[string]$currentday = "Holiday"}
}


function Get-WeekNumber([datetime]$DateTime = (Get-Date)) {
    $cultureInfo = [System.Globalization.CultureInfo]::CurrentCulture
    $cultureInfo.Calendar.GetWeekOfYear($DateTime,$cultureInfo.DateTimeFormat.CalendarWeekRule,$cultureInfo.DateTimeFormat.FirstDayOfWeek)


$WeekNumber=Get-WeekNumber

if ($WeekNumber % 2 -eq 0 -and $CurrentTime -ge "08:00" -and $CurrentTime -le "16:00"){checkpsi}
elseif($WeekNumber % 2 -ne 0 -and $CurrentTime -ge "16:00" -and $CurrentTime -le "00:00"){checkpsi}
else{write-host "Start shift: 8:00"}
}

function Get-CurrentTime{
$CurrentTime=(get-date).ToShortTimeString()

#if ($CurrentTime -le "16:00" -and $CurrentTime -ge "08:00"){write-host "1"}
#else{write-host "2"} 
}




## Check and start process
function checkpsi{
$psi=Get-Process|Select-String -Pattern Psi
if (-Not $psi){Start-Process 'C:\Program Files (x86)\Psi\psi.exe' | Out-Null}
}