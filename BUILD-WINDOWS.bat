@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo ======================================
echo       OLIO CRISTALLO - BUILD
 echo ======================================
where node >nul 2>nul
if errorlevel 1 (
  echo Node.js non trovato. Installa la versione LTS da https://nodejs.org/
  pause
  exit /b 1
)
echo Installazione dipendenze...
call npm install
if errorlevel 1 goto error
echo Creazione installer e versione portable...
call npm run dist:win
if errorlevel 1 goto error
echo.
echo Build completata. Trovi i file nella cartella release.
pause
exit /b 0
:error
echo.
echo Build non riuscita. Controlla la connessione e i messaggi qui sopra.
pause
exit /b 1
