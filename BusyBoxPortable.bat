@echo off

set _SCRIPT_DIR=%~dp0
title BusyBox

:: Default to 64bit unless 32bit is specified.
if "%1"=="32" (
    set _BUSYBOX_BIN=%_SCRIPT_DIR%App\BusyBox\busybox32.exe
    shift
) else (
    set _BUSYBOX_BIN=%_SCRIPT_DIR%App\BusyBox\busybox64.exe
)

if not defined HOME (
    set HOME=%_SCRIPT_DIR%Data
)
PATH=%HOME%\bin;%PATH%

if "%~1"=="" (
  :: No arguments. Invoke a login shell at %HOME%.
  set _BUSYBOX_STARTUP_DIR=%HOME%
  "%_BUSYBOX_BIN%" sh -l
) else if exist "%~1\*" (
  :: A directory is specified. Invoke a login shell at it.
  set _BUSYBOX_STARTUP_DIR=%~1
  "%_BUSYBOX_BIN%" sh -l
) else if exist "%~1" (
  :: A file is specified. Run the file as a shell script.
  "%_BUSYBOX_BIN%" sh "%~1"
) else (
  echo %1 does not exist.
  pause
)
