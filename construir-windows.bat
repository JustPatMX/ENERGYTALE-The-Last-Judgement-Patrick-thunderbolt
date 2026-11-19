@echo off
chcp 65001 >nul
echo === Patrick Thunderbolt: construir el .exe ===
where node >nul 2>nul
if errorlevel 1 (
  echo Necesitas instalar Node.js primero: https://nodejs.org
  pause
  exit /b 1
)
if not exist game\fonts mkdir game\fonts
if not exist game\fonts\VT323-Regular.ttf powershell -NoProfile -Command "Invoke-WebRequest -Uri 'https://github.com/google/fonts/raw/main/ofl/vt323/VT323-Regular.ttf' -OutFile 'game\fonts\VT323-Regular.ttf'"
call npm install
call npm run dist
echo.
echo Listo. Tus archivos estan en la carpeta dist\
pause
