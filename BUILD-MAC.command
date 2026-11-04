#!/bin/bash
set -e
cd "$(dirname "$0")"
echo "=========================================="
echo " OLIO CRISTALLO - BUILD macOS"
echo "=========================================="
if ! command -v node >/dev/null 2>&1; then
  echo "Node.js non trovato. Installalo da https://nodejs.org/ e riprova."
  read -r -p "Premi Invio per chiudere..."
  exit 1
fi
if [[ "$(uname)" != "Darwin" ]]; then
  echo "Questo script va eseguito su un Mac."
  read -r -p "Premi Invio per chiudere..."
  exit 1
fi
npm install
npm run dist:mac
echo ""
echo "Build completata. Trovi .dmg e .zip nella cartella release."
read -r -p "Premi Invio per chiudere..."
