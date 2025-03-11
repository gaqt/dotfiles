# My Dotfiles

Not intended to work on any machine

Install dependencies:
```

paru -S --needed nano vim neovim flameshot xorg-server xclip plasma /
    kde-applications cmake make npm yarn rustup ghostty nerd-fonts /
    python python-pip btop tmux 7zip ffmpeg fzf ripgrep neofetch hyfetch /
    jq openssh zoxide

rustup default stable

cargo instal --locked cargo-binstall
cargo binstall --locked cargo-mommy bacon yazi-fm yazi-cli starship bat exa /
    cargo-expand nushell

```

Install script (run from repo directory):
```

git config core.filemode false
python3 install.py
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
nu ~/.config/nushell/setup.nu

```

