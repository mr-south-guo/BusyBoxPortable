#!/bin/sh
# shellcheck disable=1090,2154

##### .profile for BusyBoxPortable
# This file will be sourced if BusyBoxPortable is invoked as interactive/login shell.
# Caution:
# - Do not modify this file unless absolute necessary.
# - It is recommended to put your own customization in `.ashrc` instead, which
#   will be sourced right after this file.
#####

[ -f "${HOME}/.color.rc" ] && . "${HOME}/.color.rc"
[ -f "${HOME}/.console-title.rc" ] && . "${HOME}/.console-title.rc"

# --------------------
# Config prompt string.
test "${_CONSOLE_TITLE}" || _CONSOLE_TITLE="BusyBox - \u - \w"

_PS_ITEM_2ND_LINE="\$(date +%H:%M:%S)"

# Different settings for root or non-root.
if [ "${USER}" = "root" ]; then
    _PS_ITEM_USER="${_COLOR_BWhite}${_COLOR_On_Red}\u@\h${_COLOR_Off}"
    _PS_ITEM_LAST="${_COLOR_BRed}#${_COLOR_Off}"
else
    _PS_ITEM_USER="${_COLOR_BWhite}${_COLOR_On_Blue}\u@\h${_COLOR_Off}"
    _PS_ITEM_LAST="${_COLOR_BBlue}\$${_COLOR_Off}"
fi

_PS_ITEM_DIR="${_COLOR_BCyan}\w${_COLOR_Off}"

PS1="${_PS_TITLE_BEGIN}${_CONSOLE_TITLE}${_PS_TITLE_END}${_PS_ITEM_USER} ${_PS_ITEM_DIR}\n${_PS_ITEM_2ND_LINE} ${_PS_ITEM_LAST} "

# ---------- Required by BusyBoxPortable: Begin
if test "${_BUSYBOX_STARTUP_DIR}"
then
    cd "${_BUSYBOX_STARTUP_DIR}" || echo "Failed to cd into ${_BUSYBOX_STARTUP_DIR}"
fi
# ---------- Required by BusyBoxPortable: End

[ -f "${HOME}/.ashrc" ] && . "${HOME}/.ashrc"
