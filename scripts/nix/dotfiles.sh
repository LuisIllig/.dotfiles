#!/bin/sh
pushd ~/.dotfiles
if ! [ -x "$(command -v codium)" ]; then
  echo 'Error: codium is not installed.' >&2
  exit 1
fi
codium .
popd
terminal_pid=$(ps -o ppid= -p $$)
kill -TERM "$terminal_pid"