#!/bin/sh
CURRENT_DIR=$(pwd)
TARGET=$CURRENT_DIR"/.git/config"
SOURCE=~/.dotfiles/identities/git-z-labor
cat $SOURCE >> $TARGET