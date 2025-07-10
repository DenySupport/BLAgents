:: Define variables
set TASKNAME=InstallS1
set MSIPATH=C:\AgentInstallers\SentinelOneInstaller.msi
set LOGPATH= C:\AgentInstallers\s1log.txt

:: Create scheduled task to run as Administrator with highest privileges
schtasks /create ^
  /tn "%TASKNAME%" ^
  /tr "msiexec /i \"%MSIPATH%\" /qn /norestart SITE_TOKEN=eyJ1cmwiOiAiaHR0cHM6Ly91c2VhMS0wMDEtbXNzcC5zZW50aW5lbG9uZS5uZXQiLCAic2l0ZV9rZXkiOiAiMTIxYzY3ZTQwNWYwOTMyZSJ9 /L*V \"%LOGPATH%\"" ^
  /sc once ^
  /st 00:00 ^
  /rl HIGHEST ^
  /ru "playscripts\prioritysupport" ^
  /rp "playPr10r1ty" ^
  /f

:: Run the task immediately
schtasks /run /tn "%TASKNAME%"

:: (Optional) delete the task after running
:: schtasks /delete /tn "%TASKNAME%" /f
