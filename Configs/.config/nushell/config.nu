# config.nu
#
# Installed by:
# version = "0.102.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.

$env.PNPM_HOME = "~/Library/pnpm"
$env.BUN_INSTALL = "~/.bun"
$env.LANG = "en_US.UTF-8"

$env.config.show_banner = false
$env.config.buffer_editor = "nvim"
$env.config.history = {
    file_format: sqlite
    max_size: 1_000_000
    sync_on_enter: true
    isolation: true
}
$env.config.edit_mode = 'vi'

$env.STARSHIP_SHELL = "nu"
def create_left_prompt [] {
    starship prompt --cmd-duration $env.CMD_DURATION_MS
}

# Use nushell functions to define your right and left prompt
$env.PROMPT_COMMAND = { || create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = ""

# The prompt indicators are environmental variables that represent
# the state of the prompt
$env.PROMPT_INDICATOR = ""
$env.PROMPT_INDICATOR_VI_INSERT = ": "
$env.PROMPT_INDICATOR_VI_NORMAL = "〉"
$env.PROMPT_MULTILINE_INDICATOR = "::: "

alias qvim = nvim -u '$HOME/.config/nvim/lua/rawinit.lua'
alias v = nvim
alias pacman = pacman --color=auto
alias paru = paru --color=auto
alias bargo = cargo
alias cargo = cargo mommy
alias diff = diff --color=auto
alias grep = grep --color=auto
alias ip = ip --color=auto
alias y = yazi

alias echo-mic = pactl load-module module-loopback latency_msec=200 source=alsa_input.pci-0000_03_00.6.analog-stereo sink=alsa_output.pci-0000_03_00.6.analog-stereo
alias echo-mic-off = pactl unload-module module-loopback


source ~/.cache/carapace/init.nu
source ~/.zoxide.nu

# Setting path

use std/util "path add"

path add "~/bin"
path add "~/.cargo/bin"
path add "~/.local/bin"
path add ($env.BUN_INSTALL | path join "bin")
path add "~/zig-linux-x86_64-0.13.0"


