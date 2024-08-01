#! /bin/bash
unlink ~/.config/alacritty
unlink ~/.config/bspwm
unlink ~/.config/dunst
unlink ~/.config/lvim
unlink ~/.config/nushell
unlink ~/.config/picom.conf
unlink ~/.config/polybar
unlink ~/.config/ranger
unlink ~/.config/rofi
unlink ~/.config/starship.toml
unlink ~/.config/zathura
unlink ~/.config/kitty

stow alacritty
stow bspwm
stow dunst
stow lvim
stow nushell
stow picom
stow polybar
stow ranger
stow rofi
stow starship
stow zathura
stow kitty

cat ~/.DeskTheme.catppuccin/theme.el > ~/.config/doom/theme.el

nitrogen --save --head=DP-2 --set-zoom-fill ~/hardD/wallpapers/endeavour-black-4k.png
nitrogen --save --head=1 --set-zoom-fill ~/hardD/wallpapers/endeavour-black-4k.png

emacsclient --no-wait --eval "(setq catppuccin-flavor 'mocha)" &
emacsclient --no-wait --eval "(load-theme 'catppuccin)" &

bspc wm -r
