#!/usr/bin/env bash

# Check if argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <hostname>"
  exit 1
fi

HOST="$1"

nixos-rebuild switch --flake .#${HOST} --target-host ${HOST} --sudo --ask-sudo-password
