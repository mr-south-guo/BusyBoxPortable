@echo off
setlocal
title BusyBox

for %%I in ("%~dp0.") do set "_SCRIPT_DIR=%%~fI"
set "_BUSYBOX_BIN=%_SCRIPT_DIR%\App\BusyBox\busybox.exe"

if not defined HOME (
    set "HOME=%_SCRIPT_DIR%\Data"
)
if not exist "%HOME%\.profile" call :Sub_InitHome
if not exist "%HOME%\.profile" (
    echo:Failed to initialize HOME ^("%HOME%"^)
    exit /b 1
)
set "PATH=%HOME%\bin;%PATH%"

if "%~1"=="" (
  :: No arguments. Invoke a login shell at current directory.
  set "_BUSYBOX_STARTUP_DIR=%cd%"
  "%_BUSYBOX_BIN%" sh -l
) else if exist "%~1\*" (
  :: A directory is specified. Invoke a login shell at it.
  set "_BUSYBOX_STARTUP_DIR=%~1"
  "%_BUSYBOX_BIN%" sh -l
) else if exist "%~1" (
  :: A file is specified. Run the file as a shell script with all remaining arguments.
  "%_BUSYBOX_BIN%" sh "%*"
) else if "%~1"=="-h" (
  goto :Help
) else if "%~1"=="--help" (
  goto :Help
) else (
  :: Run the parameters as busybox command.
  "%_BUSYBOX_BIN%" sh -c "%*"
)

:EndScript
endlocal & exit /b

:Help
echo:Usage: %~n0% [DIR ^| FILE [ARG0 ARG1 ...] ^| CMD [ARG0 ARG1 ... ]]
echo:
echo:Launch busybox-w32. When no arguments are provided, start an interactive shell at the current directory.
echo:
echo:OPTIONS:
echo:  DIR   start an interactive shell at directory DIR.
echo:  FILE  run the FILE as busybox shell script and exit.
echo:  CMD   run the CMD as busybox command and exit.
goto :EndScript

:Sub_InitHome
echo:Initializing "%HOME%" ...
xcopy "%_SCRIPT_DIR%\App\DefaultData" "%HOME%" /e /i
exit /b
