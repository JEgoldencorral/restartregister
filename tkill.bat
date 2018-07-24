:: task kill for posiw.exe

taskkill /im posiw.exe /f /t
taskkill /im positerm.exe
timeout /t 8
taskkill /im posiw.exe /f /t
cls
exit
