#!/bin/sh
pushd ~/.dotfiles
sudo nixos-rebuild switch --flake .#$1
popd