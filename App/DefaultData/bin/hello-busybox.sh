#!/bin/sh

[[ -f "${HOME}/.color.rc" ]] && source "${HOME}/.color.rc"

echo -ne "${_COLOR_BGreen}BusyBox ${_COLOR_Cyan}Hello World!!! ${_COLOR_BRed}\n"
read -p "Press Enter to exit: " answer
