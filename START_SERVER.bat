@echo off
echo ========================================
echo   INTERCON PHARMA - LOCAL WEB SERVER
echo ========================================
echo.
echo Starting local web server...
echo Your website will open in your browser!
echo.
echo Press Ctrl+C to stop the server
echo ========================================
echo.

REM Try Python 3
python --version >nul 2>&1
if %errorlevel% == 0 (
    echo Using Python to start server...
    start http://localhost:8000
    python -m http.server 8000
    goto :eof
)

REM Try Python (older systems)
py --version >nul 2>&1
if %errorlevel% == 0 (
    echo Using py to start server...
    start http://localhost:8000
    py -m http.server 8000
    goto :eof
)

REM Try Node.js http-server
where http-server >nul 2>&1
if %errorlevel% == 0 (
    echo Using Node.js http-server...
    start http://localhost:8080
    http-server -p 8080
    goto :eof
)

REM If nothing works
echo.
echo ERROR: No web server found!
echo.
echo Please install Python from: https://www.python.org/downloads/
echo OR install Node.js from: https://nodejs.org/
echo.
pause
