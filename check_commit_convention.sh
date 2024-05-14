#!/usr/bin/env bash

# Check if a commit message file is passed as an argument
if [ -z "$1" ]; then
    echo "No commit message file provided."
    exit 1
fi

COMMIT_MSG_FILE="$1"

# Improved regular expression for Conventional Commits
CONVENTIONAL_REGEX="^(fix|feat|perf|chore|docs|style|revert|refactor|break|test|ci|bump|Bump version|hotfix|ci-skip|bump-skip)(\([a-zA-Z0-9_.\-]+\))?: .+$"

# Check if the commit message matches the conventional commits pattern
if ! grep -qE "$CONVENTIONAL_REGEX" "$COMMIT_MSG_FILE"; then
    cat "$COMMIT_MSG_FILE"
    echo "
Your commit message doesn't conform to Conventional Commit Rules (https://www.conventionalcommits.org/).
At a minimum, your commit should start with one of the following types:

fix: Correct a bug causing an error
feat: Add a new feature
perf: Improve performance
chore: Update build tasks
docs: Update documentation
style: Update code style
revert: Revert a change
refactor: Refactor code
break: Introduce breaking changes
test: Add or update tests
ci: Update CI configuration
bump: Update dependencies
Bump version: Bump the version
hotfix: Apply a hotfix
ci-skip: Skip CI
bump-skip: Skip dependency bump

Example commit message to add a feature: 'feat: Add a new feature'
Example commit message to fix an issue: 'fix: Correct a bug causing an error'
"
    exit 1
fi
