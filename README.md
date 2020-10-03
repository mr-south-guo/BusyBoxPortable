# BusyBox Portable Launcher

## Description

A portable launcher for [busybox-w32](http://frippery.org/busybox/), providing some additional features.

## Features

- **Portable.**
  - Nothing to left behind. Scattered files used by `busybox-w32`'s interactive shell are stored portably in either `Data/` directory or anywhere the environment variable `HOME` points to.
  - Your customization of the interactive shell (e.g. prompt string, alias, functions, etc.), together with the shell history, will go with you.
  - No program remains running waiting for `busybox-w32` to close to clean up. Which means, no mess will be left behind even when unexpected termination of programs.
- **Launch interactive shell at a specified directory, or at current directory.**
  Good for launching a shell while working in Windows Command Prompt. Kind of like "Open BusyBox Here."
- **Execute a shell script or a busybox command.**
  Not a new feature per se. Just that we can use an unified interface to do it.
- **Launch as admin (root).**
  A separate launcher is provided to launch as admin (root). _All features shown above also apply when working as admin (root)!_ This may seem trivial, but actually it's a little bit tricky to achieve when dealing directly with `busybox-w32`.

## Files and Usage

### Main files

- `BusyBoxPortable.cmd`
  - The _launcher_. Running it without arguments starts an interactive shell at the current directory. 
  - `BusyBoxPortable.cmd --help` will display usage details.
- `BusyBoxPortable.admin.cmd`
  - Same as `BusyBoxPortable.cmd`, except that busybox is started as admin (root).
  - This file is **optional**. You don't need it if you are not planning to use the "launch as admin (root)" feature. (You can always start the _launcher_ as admin manually.)
  - `BusyBoxPortablePortbale.cmd --help` will display usage details.

### Auxiliary files

- When starting an interactive shell,
  - if environment variable `HOME` does not exist, it will be set to `Data/`.
  - if the `$HOME` directory does not exist or is empty, it will be clone from `App/DefaultData/`.
  - if exists, `$HOME/.bashrc` will be sourced automatically. **This is the main file your customization should be kept.**
  - Shell history will be saved to `$HOME/.ash_history`.
- `App/BusyBox/busybox.exe`
  - It is a renamed `busybox64.exe` (64bit).
  - Updating or changing version: from its [official website](http://frippery.org/busybox/),
    - download the 64-bit version and rename it to `App\BusyBox\busybox.exe`, or
    - download the 32-bit version and rename it to `App\BusyBox\busybox.exe`.
- `App/elevate/elevate.exe`
  - An tiny open-source utility to run commands as admin, from [here](http://code.kliu.org/misc/elevate/).
  - This file is **optional**. You don't need it if you are not planning to use the "launch as admin (root)" feature. (You can always start the _launcher_ as admin manually.)

## FAQ

### The directory layout of this project looks complicated. Why not put everything inside one directory and be done with it?

My directory layout mimic the [PortableApps.com Format](https://portableapps.com/development/portableapps.com_format#layout). The detailed reasoning may worth a separate project to discuss, but TL;DR: it allows multiple users to share the core program but at the same time keeping their data isolated.
