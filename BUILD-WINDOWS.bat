@echo off
title Compilazione Olio Cristallo
echo ==========================================
echo   Compilazione Olio Cristallo per Windows
echo ==========================================
echo.

:: Controllo se Node.js e' installato
where npm >nul 2>nul
if %errorlevel% neq 0 (
    echo ERRORE: Node.js ^(npm^) non e' installato o non e' nel PATH.
    echo Per favore, scaricalo da https://nodejs.org/ e riprova.
    echo.
    pause
    exit /b
)

:: Controllo se la cartella node_modules esiste
if not exist "node_modules\" (
    echo [1/2] Installazione delle dipendenze in corso...
    echo Questa operazione potrebbe richiedere qualche minuto al primo avvio.
    call npm install
) else (
    echo [1/2] Dipendenze gia' presenti.
)

echo.
echo [2/2] Creazione del file .exe in corso...
call npm run dist

echo.
echo ==========================================
echo   OPERAZIONE COMPLETATA!
echo   Troverai il tuo file .exe di installazione
echo   all'interno della cartella "dist".
echo ==========================================
pause
