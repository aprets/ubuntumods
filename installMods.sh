#!/bin/bash
[ "$UID" -eq 0 ] || exec sudo "$0" "$@"
echo "$(whoami)"
