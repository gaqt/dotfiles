#!/bin/bash

set -e

pushd ~/nixos/$(hostname) > /dev/null

nvim configuration.nix
alejandra configuration.nix > /dev/null
color=$(tput setaf 4)
echo -e "${color} _~Rebuilding NixOS~_ >.< hang in there,,"
sudo nixos-rebuild switch -I nixos-config=configuration.nix &> ../nixos-switch.log || (
    bat nixos-switch.log | grep --color error && false)

popd > /dev/null
