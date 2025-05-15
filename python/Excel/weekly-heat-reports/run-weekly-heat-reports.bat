@echo off
setlocal

:: Set log path for tracking runs
set "logfile=%APPDATA%\create-weekly-dir-last-run.log"

:: Get today's date (just the date part)
for /f %%A in ('powershell -command "(Get-Date).ToString(\"yyyy-MM-dd\")"') do set TODAY=%%A

:: Get today's day of week (e.g. Monday)
for /f %%B in ('powershell -command "(Get-Date).DayOfWeek"') do set DAY=%%B

:: Only run on Mondays (change as needed)
if /i not "%DAY%"=="Thursday" goto :EOF

:: Check if we've already run today
if exist "%logfile%" (
    for /f %%C in (%logfile%) do (
        if "%%C"=="%TODAY%" goto :EOF
    )
)

:: === Heat Reports logic here ===
python C:\Users\dssalmon\Documents\scripts\weekly-heat-reports.py

:: Write today's date to the log so we don't run again
echo %TODAY% > "%logfile%"

endlocal