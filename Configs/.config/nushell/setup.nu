
mkdir ~/.cache/carapace
carapace _carapace nushell | save --force ~/.cache/carapace/init.nu

cargo install nu_plugin_clipboard
plugin add ~/.cargo/bin/nu_plugin_clipboard

cargo install nu_plugin_regex
plugin add ~/.cargo/bin/nu_plugin_regex
