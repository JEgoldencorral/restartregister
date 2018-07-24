:: !_RegisterRestart.bat


SET /p IP= Which Register Do you Want To Restart... 1, 2, or 3?
Goto Reg%ip%


:Reg1
:: Register 1 is special, it runs SPCwin, SPCwin does not play nice a lot of the time, we are going to send a file to it to gracefully shut it down 
::this copies the 

Copy "%cd%\tkill.bat" "\\172.16.250.1\c\temp"
timeout /t 2

echo Now calling taskKill on register 1 to kill posiw & positerm

psexec \\172.16.250.1\ C:\temp\tkill.bat

copy c:\sc\topmsg.$$$ L:\sc\topmsg.$$$ /y

timeout /t 5

shutdown -m \\172.16.250.1 -f -r -t 00

goto End

:Reg2

shutdown -m \\172.16.250.2 -f -r -t 00
timeout /t 1
MSG * Register 2 Is Shutting Down Now

goto End

:Reg3

shutdown -m \\172.16.250.3 -f -r -t 00
timeout /t 1
MSG * Register 3 Is Shutting Down Now

goto End

:end
cls
MSG * "Verify the register did in fact shut down?"
timeout /t 3

exit /b

