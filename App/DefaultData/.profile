alias ll="ls -alh"

source "$HOME/.color.rc"
source "$HOME/.console-title.rc"

# --------------------
# Config prompt string.
[[ ${_CONSOLE_TITLE} ]] || _CONSOLE_TITLE="BusyBox - \u - \w"

_PS_ITEM_2ND_LINE="\$(date +%H:%M:%S)"

# Different settings for root or non-root.
if [[ "${USER}" == "root" ]]; then
    _PS_ITEM_USER="${_COLOR_BWhite}${_COLOR_On_Red}\u@\h${_COLOR_Off}"
    _PS_ITEM_LAST="${_COLOR_BRed}#${_COLOR_Off}"
else
    _PS_ITEM_USER="${_COLOR_BWhite}${_COLOR_On_Blue}\u@\h${_COLOR_Off}"
    _PS_ITEM_LAST="${_COLOR_BBlue}\$${_COLOR_Off}"
fi

_PS_ITEM_DIR="${_COLOR_BCyan}\w${_COLOR_Off}"

PS1="${_PS_TITLE_BEGIN}${_CONSOLE_TITLE}${_PS_TITLE_END}${_PS_ITEM_USER} ${_PS_ITEM_DIR}\n${_PS_ITEM_2ND_LINE} ${_PS_ITEM_LAST} "

# --------------------
# cd to startup directory if defined.
[[ ${_BUSYBOX_STARTUP_DIR} ]] && cd "${_BUSYBOX_STARTUP_DIR}"
