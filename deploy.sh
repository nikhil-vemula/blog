#!/bin/sh

# If a command fails then the deploy stops
set -e

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Go To Public folder
cd public

echo In public folder

git status

# Add changes to git.
git add .

# Commit changes.
msg="Rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg" --no-verify

# Push source and build repos.
git push origin master