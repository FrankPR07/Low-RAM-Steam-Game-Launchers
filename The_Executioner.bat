@echo off
:: ====================================================================
:: THE EXECUTIONER - Custom Launcher Template
:: Optimized for low-RAM systems (e.g., 4GB Celeron setups)
:: ====================================================================

:: CONFIGURATION: Replace these values with your game details
set "GAME_EXE=YOUR_GAME_EXE_HERE.exe"
set "STEAM_ID=YOUR_STEAM_ID_HERE"

echo Launching Steam silently to the system tray...
start "" "C:\Steam\steam.exe" -silent
timeout /t 5 /nobreak >nul

echo Launching Game...
start "" "steam://rungameid/%STEAM_ID%"

echo Waiting for the game engine to actually start...
:SEARCH
tasklist /FI "IMAGENAME eq %GAME_EXE%" 2>NUL | find /I "%GAME_EXE%" >NUL
if "%ERRORLEVEL%"=="0" (
    echo Game engine detected! Closing Steam to free up maximum RAM...
    timeout /t 10 /nobreak >nul
    taskkill /f /im steam.exe
    exit
) else (
    timeout /t 3 /nobreak >nul
    goto SEARCH
)
