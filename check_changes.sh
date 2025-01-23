#!/bin/bash

WATCH_DIR=$1

# Try to get the default branch dynamically, or fall back to 'main'
default_branch=$(git remote show origin | grep 'HEAD branch' | awk '{print $3}')
if [ -z "$default_branch" ]; then
default_branch="main"  # Fallback to 'main' if the default branch cannot be determined
fi

# List changes
all_changes=$(git diff --name-only origin/${default_branch}...HEAD)

printf '%s\n' "--------- ALL CHANGES ---------"
printf '%s\n' $all_changes
printf '%s\n' "-------------------------------"

# Filter changes
changes=$(echo "$all_changes" | grep "^${WATCH_DIR}")
if [ -n "$changes" ]; then
echo "Changes detected in ${WATCH_DIR} directory."
# echo "has_changes=true" >> $GITHUB_OUTPUT
else
echo "No changes in ${WATCH_DIR} directory."
# echo "has_changes=false" >> $GITHUB_OUTPUT
fi
