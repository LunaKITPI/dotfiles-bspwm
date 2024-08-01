# Nushell Environment Config File
#
# version = "0.91.0"

$env.ENV_CONVERSIONS = {
    "PATH": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
    "Path": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
}
$env.NU_LIB_DIRS = [
    ($nu.default-config-dir | path join 'scripts') # add <nushell-config-dir>/scripts
]
$env.NU_PLUGIN_DIRS = [
    ($nu.default-config-dir | path join 'plugins') # add <nushell-config-dir>/plugins
]


$env.EDITOR = emacsclient
## path
$env.PATH = ($env.PATH | prepend '~/.local/bin')
$env.PATH = ($env.PATH | prepend '~/.cargo/bin')
$env.PATH = ($env.PATH | prepend '~/.config/emacs/bin')
$env.EDITOR = nvim
# starship
mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu
## zoxide
zoxide init nushell | save -f ~/.zoxide.nu
