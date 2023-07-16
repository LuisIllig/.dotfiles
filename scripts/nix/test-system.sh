#!/bin/sh
pushd ~/.dotfiles
git add .
nixos-rebuild build --flake .#${1:-laptop}
popd