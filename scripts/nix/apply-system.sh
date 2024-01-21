#!/bin/sh
pushd ~/.dotfiles
git add .
sudo nixos-rebuild switch --flake .#${1:-laptop} --show-trace
popd