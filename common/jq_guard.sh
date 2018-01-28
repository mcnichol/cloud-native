#!/usr/bin/env bash

# This script relies on styles.sh and functions.sh (found in /config) to have been loaded
set +e
program_is_installed jq
exit_status=$?
set -e

if [ "$exit_status" -eq "1" ]; then
   msg "'JQ' must be installed to use this application"
   msgWithColor "(https://stedolan.github.io/jq/)\n" ${BLUE}

   msg "Install with Homebrew: "
   msgWithColor "brew install jq\n" ${GREEN}
   exit -1;
fi
