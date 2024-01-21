#!/bin/sh
CURRENT_DIR=$(pwd)
TARGET=$CURRENT_DIR"/.git/config"
SOURCE=~/.dotfiles/identities/git-asturia
cat $SOURCE >> $TARGET