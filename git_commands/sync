#!/usr/bin/env bash
#
# Sync an upstream branch

# The extra '&& :' is needed: https://stackoverflow.com/a/25915221
git fetch --all --prune && git rebase --preserve-merges --autostash $1 && :
