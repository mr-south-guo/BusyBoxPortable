#!/bin/sh
# shellcheck disable=1090

[ -f "${HOME}/.color.rc" ] && . "${HOME}/.color.rc"

# shellcheck disable=2059,2154
printf "${_COLOR_BGreen}BusyBox ${_COLOR_Cyan}Hello World!!! ${_COLOR_BRed}\n"

printf "Press [Enter] key to continue..."; read -r
