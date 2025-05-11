@echo off
chcp 65001 > nul
title Useful Commands (15 functions)
color 0A
setlocal enabledelayedexpansion

:MAIN_MENU
cls
echo ------------------------------------
echo   Useful Commands Menu (15 functions)
echo ------------------------------------
echo 1.  Find file by name
echo 2.  Search text in files
echo 3.  Top 10 largest files
echo 4.  Process monitor
echo 5.  Check disk usage
echo 6.  Kill process by name
echo 7.  Archive folder
echo 8.  Check free memory
echo 9.  Show open ports
echo 10. Replace text in files
echo 11. Check ping
echo 12. Show IP addresses
echo 13. Check SSL certificate
echo 14. Convert video to MP4
echo 15. Generate password
echo 0.  Exit
echo ------------------------------------
set /p choice="Select option: "

if "%choice%"=="1" goto FIND_FILE
if "%choice%"=="2" goto GREP_TEXT
if "%choice%"=="3" goto TOP10_FILES
if "%choice%"=="4" goto PROCESS_MONITOR
if "%choice%"=="5" goto DISK_USAGE
if "%choice%"=="6" goto KILL_PROCESS
if "%choice%"=="7" goto ARCHIVE_FOLDER
if "%choice%"=="8" goto FREE_MEMORY
if "%choice%"=="9" goto OPEN_PORTS
if "%choice%"=="10" goto REPLACE_TEXT
if "%choice%"=="11" goto CHECK_PING
if "%choice%"=="12" goto SHOW_IPS
if "%choice%"=="13" goto CHECK_SSL
if "%choice%"=="14" goto CONVERT_TO_MP4
if "%choice%"=="15" goto GENERATE_PASSWORD
if "%choice%"=="0" exit /b

echo Invalid choice!
pause
goto MAIN_MENU

:FIND_FILE
set /p filename="Enter filename: "
dir /s /b "%filename%"
pause
goto MAIN_MENU

:GREP_TEXT
set /p pattern="Enter search text: "
findstr /s /n /i /p "%pattern%" *.*
pause
goto MAIN_MENU

:TOP10_FILES
for /f "tokens=*" %%a in ('dir /s /b /a-d ^| sort /r /+100') do (
    set /a count+=1
    if !count! leq 10 echo %%a
)
pause
goto MAIN_MENU

:PROCESS_MONITOR
tasklist
pause
goto MAIN_MENU

:DISK_USAGE
wmic logicaldisk get caption,size,freespace
pause
goto MAIN_MENU

:KILL_PROCESS
set /p process="Enter process name: "
taskkill /f /im "%process%"
pause
goto MAIN_MENU

:ARCHIVE_FOLDER
set /p folder="Enter folder path: "
powershell Compress-Archive -Path "%folder%" -DestinationPath "%folder%.zip"
echo Archived to %folder%.zip
pause
goto MAIN_MENU

:FREE_MEMORY
wmic OS get FreePhysicalMemory,TotalVisibleMemorySize /Value
pause
goto MAIN_MENU

:OPEN_PORTS
netstat -ano
pause
goto MAIN_MENU

:REPLACE_TEXT
set /p old="Enter old text: "
set /p new="Enter new text: "
set /p filemask="Enter file mask (e.g. *.txt): "
powershell -Command "(gc %filemask%) -replace '%old%', '%new%' | Out-File %filemask%"
pause
goto MAIN_MENU

:CHECK_PING
set /p host="Enter domain or IP: "
ping %host% -n 4
pause
goto MAIN_MENU

:SHOW_IPS
ipconfig | findstr IPv4
pause
goto MAIN_MENU

:CHECK_SSL
set /p domain="Enter domain: "
powershell -Command "[System.Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}; try { $req = [System.Net.WebRequest]::Create('https://%domain%'); $req.GetResponse() } catch { $_.Exception.InnerException }; $req.ServicePoint.Certificate | fl *"
pause
goto MAIN_MENU

:CONVERT_TO_MP4
set /p input="Enter input file: "
set /p output="Enter output file (without .mp4): "
ffmpeg -i "%input%" "%output%.mp4"
pause
goto MAIN_MENU

:GENERATE_PASSWORD
powershell -Command "$length=16; $chars='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*'; $random=[System.Random]::new(); $password=(-join (1..$length | %% {$chars[$random.Next($chars.Length)]})); $password"
pause
goto MAIN_MENU
