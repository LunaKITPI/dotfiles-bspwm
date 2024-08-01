# Nushell Cneofetch --ascii ~/.asciionfig File
# version = "0.91.0"

$env.config = {
  show_banner: false,
    cursor_shape: {
    vi_insert: underscore
    vi_normal: block
    emacs: line
  }

}
# extras
## starship
use ~/.cache/starship/init.nu
## zoxide
source ~/.zoxide.nu

# aliases
alias qq = exit
alias ll = ls -l
alias la = ls -a
alias emk = pkill emacs
alias emd = emacs --daemon
alias nurc = lvim ~/.config/nushell/config.nu
alias nuenv = lvim ~/.config/nushell/env.nu
alias vim = lvim
alias lv = lvim
alias v = lvim
alias em = emacsclient -nw
alias sps = sudo pacman -S
alias spsyu = sudo pacman -Syu
alias wiki = wiki-tui
alias gitd = ~/Documents/shell-scripts/gitd.sh
alias p8 = ping 8.8.8.8
alias nf = hyfetch
alias itch = itch --no-sandbox
alias tt = tomato
alias cd = z
alias gc = git commit -m
alias gpom = git push -u origin main
alias gaa = git add .
alias hserv = ssh luniya@192.168.0.145
