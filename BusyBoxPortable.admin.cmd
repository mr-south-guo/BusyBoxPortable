@echo off
setlocal

for %%I in ("%~dp0.") do set "_SCRIPT_DIR=%%~fI"

set "_ADMIN_BIN=%_SCRIPT_DIR%\App\elevate\elevate.exe"
set "_BUSYBOX_BIN=%_SCRIPT_DIR%\BusyBoxPortable.cmd"

if "%~1"=="-h" (
  goto :Help
) else if "%~1"=="--help" (
  goto :Help
)

set "_CMD_FULL=^"%_ADMIN_BIN%^" /c ^"%_BUSYBOX_BIN%^" %*"

:Action
endlocal & %_CMD_FULL%
exit /b

:Help
echo:NOTE: You may not see STDOUT if admin version is run from a normal console.
echo:
set "_CMD_FULL=^"%_BUSYBOX_BIN%^" --help"
goto :Action
