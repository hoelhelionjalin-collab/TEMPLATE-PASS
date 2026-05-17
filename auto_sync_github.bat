@echo off
title Auto-Sync TEMPLATE-PASS → GitHub
color 0A

echo =========================================
echo   Auto-Sync TEMPLATE-PASS actif !
echo   Surveillance en cours...
echo   (Ne ferme pas cette fenetre)
echo =========================================
echo.

cd /d "C:\Users\hoelh\OneDrive\Bureau\PASS\TEMPLATE-PASS"

:loop
timeout /t 30 /nobreak >nul

git add .
git diff --cached --quiet
if errorlevel 1 (
    echo [%time%] Modifications detectees, envoi sur GitHub...
    git commit -m "Mise a jour automatique - %date% %time%"
    git push
    echo [%time%] Synchronise avec succes !
    echo.
)

goto loop
