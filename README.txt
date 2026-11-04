OLIO CRISTALLO - VERSIONE DESKTOP WINDOWS E macOS

CONTENUTO
- index.html: gioco originale, lasciato invariato
- main.js: avvio dell'applicazione Electron
- package.json: dipendenze e configurazione di build Windows/macOS
- BUILD-WINDOWS.bat: crea installer e versione portable su Windows
- BUILD-MAC.command: crea i pacchetti macOS su un Mac

CREARE LA VERSIONE macOS
1. Copia/estrai l'intero progetto su un Mac.
2. Installa Node.js LTS da https://nodejs.org/ se non è già presente.
3. Apri BUILD-MAC.command. Se macOS blocca lo script, apri Terminale nella cartella e lancia: chmod +x BUILD-MAC.command && ./BUILD-MAC.command
4. Attendi il completamento della prima installazione e compilazione.
5. Nella cartella release troverai un file .dmg e un .zip.

La build standard usa l'architettura del Mac sul quale viene eseguita.
Per compilare esplicitamente Apple Silicon (M1/M2/M3/M4): npm run dist:mac:arm64
Per compilare esplicitamente Intel: npm run dist:mac:x64

NOTA SU SICUREZZA macOS
Questa build non è firmata né notarizzata con un Developer ID Apple. Su altri Mac Gatekeeper potrebbe mostrare un avviso al primo avvio. Per una distribuzione pubblica senza questi avvisi servono firma e notarizzazione Apple, con account Apple Developer.

VERSIONE WINDOWS
Su Windows esegui BUILD-WINDOWS.bat. I file .exe vengono creati nella cartella release.

NOTE GENERALI
- Il file HTML originale non è stato modificato.
- Il gioco viene eseguito in una finestra desktop massimizzata.
- I salvataggi usano lo storage locale persistente di Chromium/Electron.
- Il tasto F continua a gestire lo schermo intero; ESC e gli altri comandi restano gestiti dal gioco.
- La prima build richiede Internet per scaricare Electron e le dipendenze.

COMPILARE macOS SENZA AVERE UN MAC (GitHub Actions)
1. Crea un account gratuito su https://github.com/ (se non ne hai già uno).
2. Da Windows, crea un nuovo repository GitHub e carica TUTTI i file e le cartelle di questo progetto, inclusa la cartella nascosta .github/workflows.
3. Apri il repository su GitHub, vai nella scheda Actions.
4. Se richiesto, abilita GitHub Actions per il repository.
5. Seleziona "Build Olio Cristallo for macOS" e premi "Run workflow".
6. Attendi che il workflow termini con esito verde.
7. Nella pagina della run, in basso, scarica l'artefatto "Olio-Cristallo-macOS-universal". Dentro troverai il .dmg e lo .zip per Mac Intel e Apple Silicon.

La compilazione viene eseguita su un runner macOS ospitato da GitHub: non serve possedere un Mac. Il workflow genera una build universale non firmata/notarizzata. Per distribuirla pubblicamente senza gli avvisi di Gatekeeper occorre successivamente la firma e notarizzazione Apple.
