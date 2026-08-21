@echo off
:: ====================================================================
:: THE GUARDIAN V.1 - Custom Launcher Template
:: Keeps Steam alive silently in the tray, closes it when you quit
:: ====================================================================

:: CONFIGURATION: Replace these values with your game details
set "GAME_EXE=YOUR_GAME_EXE_HERE.exe"
set "STEAM_ID=YOUR_STEAM_ID_HERE"

echo Launching Steam silently to the system tray...
start "" "C:\Steam\steam.exe" -silent
timeout /t 5 /nobreak >nul

echo Launching Game...
start "" "steam://rungameid/%STEAM_ID%"

echo Waiting for the game to actually start...
:SEARCH
tasklist /FI "IMAGENAME eq %GAME_EXE%" 2>NUL | find /I "%GAME_EXE%" >NUL
if "%ERRORLEVEL%"=="0" (
    echo Game detected! Steam is running silently in the background...
    goto WAIT_FOR_EXIT
) else (
    timeout /t 3 /nobreak >nul
    goto SEARCH
)

:WAIT_FOR_EXIT
timeout /t 5 /nobreak >nul
tasklist /FI "IMAGENAME eq %GAME_EXE%" 2>NUL | find /I "%GAME_EXE%" >NUL
if "%ERRORLEVEL%"=="1" (
    echo Game closed! Shutting down Steam completely to free up RAM...
    taskkill /f /im steam.exe
    exit
) else (
    goto WAIT_FOR_EXIT
)
