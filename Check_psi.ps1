$psi=Get-Process|Select-String -Pattern Psi
if (-Not $psi){Start-Process 'C:\Program Files (x86)\Psi\psi.exe' | Out-Null}
