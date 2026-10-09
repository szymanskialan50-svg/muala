@echo off
rem Registers the virtual webcam under the name "HD Camera Iphone" (needs admin, one time).
net session >nul 2>&1
if %errorlevel% neq 0 (
  powershell -NoProfile -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
  exit /b
)
set "NAME=HD Camera Iphone"
cd /d "%~dp0driver"
regsvr32 /s /n /i:UnityCaptureName="%NAME%" UnityCaptureFilter64.dll
if %errorlevel% neq 0 ( echo Installing 64-bit filter failed. & pause & exit /b 1 )
regsvr32 /s /n /i:UnityCaptureName="%NAME%" UnityCaptureFilter32.dll
echo.
echo Done. Restart Zoom / Discord / Teams / browser - the camera is called "%NAME%".
pause
